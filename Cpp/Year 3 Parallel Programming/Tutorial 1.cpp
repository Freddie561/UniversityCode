#include <iostream>
#include <vector>
#include <algorithm>
#include <numeric>
#include <stdio.h>

#include "Utils.h"
#include "Tutorial 1.h"

//	The data is imported data using ifstream. It goes through each line and pushes 
//	the final element into a vector. The string is then converted to a float, and then 
//	multiplied by 100 to remove the decimal place so atomic functions can import the data 
//	as an int. The padding size is used to ensure that if the input vector is not a 
//	multiple of the local size given, there are additional null values added. These 
//	values are later removed when calculating the statistics. The output vectors are 
//	then created, along with their sizes in bytes, then the buffers for the kernel 
//	arguments. The buffer for the temperature values are set as Read Only, as the data 
//	will not be changed. These buffers are then filled, while the Temp buffer is written 
//	to. The Kernels are then set up, each with their own buffers and the local memory 
//	size calculation. The mean is calculated by dividing the output of the Sum_Buffer by 
//	the size of the vector, minus the null values used for padding. The statistics are 
//	displayed to console by dividing by 100, as the temperature values are multiplied by 
//	100 at the start.  For the Variance, initially every value must run through the 
//	(xi - x)2 part of the variance formula using the var_kernel_reduce kernel. This 
//	is then stored in a vector to run through the var_kernel_sum formula to sum the 
//	values together. To find the standard deviation, the square root of variance is 
//	divided by the amount of vector elements, minus the amount of excess padding from 
//	the null values, minus 1. The calculation is not 100% accurate as the values used 
//	are not floats, some data is lost. To reduce the amount of data lost, the values 
//	were multiplied by 100 initially. 

int main(int argc, char** argv) {

	typedef int myType;

	// Record overall start time
	auto start = std::chrono::high_resolution_clock::now();
	//Part 1 - handle command line options such as device selection, verbosity, etc.
	int platform_id = 0;
	int device_id = 0;
	vector<double> time(0);
	vector<int>sizes(0);

	////Vector Initialisations 
	
	vector<myType>Temps(0);
	

	//Create events

	cl::Event min_event;
	cl::Event max_event;
	cl::Event sum_event;
	cl::Event var_event;
	cl::Event var_event2;


	try {

		// Read input file 
		std::ifstream myfile("temp_lincolnshire.txt");


		std::string line;
		while (getline(myfile, line))
		{
			vector<string> line_vec = {};
			istringstream each_line(line);

			// For each line in extracted line with space delim
			while (getline(each_line, line, ' ')) {
				line_vec.push_back(line);
			}

			float line_float = stof(line_vec.back()); // Convert string to float
			line_float = line_float * 100; //Atomic Functions don't work with floats, so we multiply by 100 to remove decimal point
			Temps.push_back(line_float); // Add final string of each line to back of vector
		}

		//Part 2 - host operations
		//2.1 Select computing devices
		cl::Context context = GetContext(platform_id, device_id);

		//display the selected device
		std::cout << "Runinng on " << GetPlatformName(platform_id) << ", " << GetDeviceName(platform_id, device_id) << std::endl;

		//create a queue to which we will push commands for the device
		cl::CommandQueue queue(context, CL_QUEUE_PROFILING_ENABLE);

		//2.2 Load & build the device code

		cl::Program::Sources sources;

		AddSources(sources, "kernels/my_kernels.cl");

		cl::Program program(context, sources);

		//build and debug the kernel code
		try {
			program.build();
		}
		catch (const cl::Error& err) {
			std::cout << "Build Status: " << program.getBuildInfo<CL_PROGRAM_BUILD_STATUS>(context.getInfo<CL_CONTEXT_DEVICES>()[0]) << std::endl;
			std::cout << "Build Options:\t" << program.getBuildInfo<CL_PROGRAM_BUILD_OPTIONS>(context.getInfo<CL_CONTEXT_DEVICES>()[0]) << std::endl;
			std::cout << "Build Log:\t " << program.getBuildInfo<CL_PROGRAM_BUILD_LOG>(context.getInfo<CL_CONTEXT_DEVICES>()[0]) << std::endl;
			throw err;
		}

		//Part 3 - memory allocation
		//host - input

		
		size_t local_size = 256;
		size_t padding_size = Temps.size() % local_size; //Padding size created

		if (padding_size) {

			vector <int> temp_ext(local_size - padding_size, 0);
	
			Temps.insert(Temps.end(), temp_ext.begin(), temp_ext.end());
		}

		int excessPad = local_size - padding_size; //This is used to calculate the mean correctly, as we don't want to use the null (0s) values in the calculation

		size_t vector_elements = Temps.size();//number of elements
		size_t vector_size = Temps.size() * sizeof(myType);//size in bytes
		size_t no_of_Workgroups = vector_elements / local_size;


		//Output vectors

		//Min calculation Vector
		std::vector<myType> minOutput(vector_elements);
		size_t min_output_size = minOutput.size() * sizeof(myType);
		//Max calculation Vector
		std::vector<myType> maxOutput(vector_elements);
		size_t max_output_size = maxOutput.size() * sizeof(myType);
		//Sum calculation Vector
		std::vector<myType> sumOutput(vector_elements);
		size_t sum_output_size = sumOutput.size() * sizeof(myType);
		//1st Variance calculation Vector used for var reduce
		std::vector<myType> varOutput(vector_elements);
		size_t var_output_size = varOutput.size() * sizeof(myType);
		//2nd Variance calculation Vector used for var sum
		std::vector<myType> varOutput2(vector_elements);
		size_t var_output_size2 = varOutput2.size() * sizeof(myType);
	
		//device - buffers
		cl::Buffer Temp_Buffer(context, CL_MEM_READ_ONLY, vector_size); // Buffer for Temperatures
		cl::Buffer Min_Buffer(context, CL_MEM_READ_WRITE, min_output_size); // Min Buffer
		cl::Buffer Max_Buffer(context, CL_MEM_READ_WRITE, max_output_size); // Max Buffer
		cl::Buffer Sum_Buffer(context, CL_MEM_READ_WRITE, sum_output_size); // Sum Buffer
		cl::Buffer Var_Buffer(context, CL_MEM_READ_WRITE, var_output_size); // 1st Variance Buffer
		cl::Buffer Var_Buffer2(context, CL_MEM_READ_WRITE, var_output_size2); // 2nd Variance Buffer
		

		//Part 4 - device operations

		//4.1 Copy array to device memory
		queue.enqueueWriteBuffer(Temp_Buffer, CL_TRUE, 0, vector_size, &Temps[0]);

		//Fill buffers for kernels to use as arguements 
		queue.enqueueFillBuffer(Min_Buffer, 0, 0, min_output_size);
		queue.enqueueFillBuffer(Max_Buffer, 0, 0, max_output_size);
		queue.enqueueFillBuffer(Sum_Buffer, 0, 0, sum_output_size);
		queue.enqueueFillBuffer(Var_Buffer, 0, 0, var_output_size);
		queue.enqueueFillBuffer(Var_Buffer2, 0, 0, var_output_size2);

		//Setup and execute the kernels
		
		cl::Kernel kernel_min = cl::Kernel(program, "min_kernel");

		//Sets arguments for each line
		kernel_min.setArg(0, Temp_Buffer);
		kernel_min.setArg(1, Min_Buffer);
		kernel_min.setArg(2, cl::Local(local_size * sizeof(myType)));//local memory size);

		cl::Kernel kernel_max = cl::Kernel(program, "max_kernel");

		//Sets arguments for each line
		kernel_max.setArg(0, Temp_Buffer);
		kernel_max.setArg(1, Max_Buffer);
		kernel_max.setArg(2, cl::Local(local_size * sizeof(myType)));//local memory size);

		cl::Kernel kernel_sum = cl::Kernel(program, "sum_kernel");

		//Sets arguments for each line
		kernel_sum.setArg(0, Temp_Buffer);
		kernel_sum.setArg(1, Sum_Buffer);
		kernel_sum.setArg(2, cl::Local(local_size * sizeof(myType)));//local memory size);

		queue.enqueueNDRangeKernel(kernel_min, cl::NullRange, cl::NDRange(vector_elements), cl::NDRange(local_size), NULL, &min_event);
		queue.enqueueNDRangeKernel(kernel_max, cl::NullRange, cl::NDRange(vector_elements), cl::NDRange(local_size), NULL, &max_event);
		queue.enqueueNDRangeKernel(kernel_sum, cl::NullRange, cl::NDRange(vector_elements), cl::NDRange(local_size), NULL, &sum_event);

		//4.3 Copy the result from device to host
		queue.enqueueReadBuffer(Min_Buffer, CL_TRUE, 0, min_output_size, &minOutput[0]);
		queue.enqueueReadBuffer(Max_Buffer, CL_TRUE, 0, max_output_size, &maxOutput[0]);
		queue.enqueueReadBuffer(Sum_Buffer, CL_TRUE, 0, sum_output_size, &sumOutput[0]);
		
		//Wait for the tasks to finish before carrying on
		min_event.wait();
		max_event.wait();
		sum_event.wait();

		float total = sumOutput[0];
		int actual_size_of_vector = vector_elements - excessPad; // This calculation ensures the mean does not use the excess null values for its calculation
		float mean = total / actual_size_of_vector;
		float int_mean_for_var = mean;//converting to int for 
		std::cout << endl;
		std::cout << "Min = " << minOutput[0]/100 << std::endl;
		std::cout << "Kernel execution time [ns]:" << min_event.getProfilingInfo<CL_PROFILING_COMMAND_END>() - min_event.getProfilingInfo<CL_PROFILING_COMMAND_START>() << std::endl;
		std::cout << "Profiling Info:  = " << GetFullProfilingInfo(min_event, ProfilingResolution::PROF_US) << std::endl;
		std::cout << endl;
		std::cout << "Max = " << maxOutput[0]/100 << std::endl;
		std::cout << "Kernel execution time [ns]:" << max_event.getProfilingInfo<CL_PROFILING_COMMAND_END>() - max_event.getProfilingInfo<CL_PROFILING_COMMAND_START>() << std::endl;
		std::cout << "Profiling Info:  = " << GetFullProfilingInfo(max_event, ProfilingResolution::PROF_US) << std::endl;
		std::cout << endl;
		std::cout << "Mean = " << mean/100 << std::endl;
		std::cout << "Kernel execution time [ns]:" << sum_event.getProfilingInfo<CL_PROFILING_COMMAND_END>() - sum_event.getProfilingInfo<CL_PROFILING_COMMAND_START>() << std::endl;
		std::cout << "Profiling Info:  = " << GetFullProfilingInfo(sum_event, ProfilingResolution::PROF_US) << std::endl;
		std::cout << endl;

		//// VARIANCE
		cl::Kernel kernel_var_reduce = cl::Kernel(program, "var_kernel_reduce");

		float total_for_variance_calc = total / 100;
		//Sets arguments for each line
		kernel_var_reduce.setArg(0, Temp_Buffer);
		kernel_var_reduce.setArg(1, Var_Buffer);
		kernel_var_reduce.setArg(2, cl::Local(local_size * sizeof(myType)));//local memory size);
		kernel_var_reduce.setArg(3, int_mean_for_var);
		kernel_var_reduce.setArg(4, actual_size_of_vector);

		queue.enqueueNDRangeKernel(kernel_var_reduce, cl::NullRange, cl::NDRange(vector_elements), cl::NDRange(local_size), NULL, &var_event);

		queue.enqueueReadBuffer(Var_Buffer, CL_TRUE, 0, var_output_size, &varOutput[0]);

		cl::Kernel kernel_var_reduce_sum = cl::Kernel(program, "var_kernel_sum");
		kernel_var_reduce_sum.setArg(0, Var_Buffer);
		kernel_var_reduce_sum.setArg(1, Var_Buffer2);
		kernel_var_reduce_sum.setArg(2, cl::Local(local_size * sizeof(myType)));//local memory size);
		
		queue.enqueueNDRangeKernel(kernel_var_reduce_sum, cl::NullRange, cl::NDRange(vector_elements), cl::NDRange(local_size), NULL, &var_event2);

		queue.enqueueReadBuffer(Var_Buffer2, CL_TRUE, 0, var_output_size2, &varOutput2[0]);

		int variance = varOutput2[0];

		int var_exe_time = (var_event.getProfilingInfo<CL_PROFILING_COMMAND_END>() - var_event.getProfilingInfo<CL_PROFILING_COMMAND_START>()) + (var_event2.getProfilingInfo<CL_PROFILING_COMMAND_END>() - var_event2.getProfilingInfo<CL_PROFILING_COMMAND_START>());

		
		float std = sqrt(variance / (vector_elements - excessPad));
		std::cout << "Std = " << std << std::endl;
		std::cout << "Kernel execution time [ns]:" << var_exe_time << std::endl;
		std::cout << "Profiling Info:  = " << GetFullProfilingInfo(sum_event, ProfilingResolution::PROF_US) << std::endl;
		//Record end time
	   auto finish = std::chrono::high_resolution_clock::now();

	   std::chrono::duration<double> elapsed = finish - start;
	   std::cout << endl;
	   std::cout << "Total Program elapsed time: " << elapsed.count() << " s\n";
		
	}
	catch (cl::Error err) {
		std::cerr << "ERROR: " << err.what() << ", " << getErrorString(err.err()) << std::endl;

	}
	return 0;

}


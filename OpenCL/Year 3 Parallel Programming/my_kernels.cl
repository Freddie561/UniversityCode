kernel void min_kernel(global const int* A, global int* B, local int* scratch)
{
int global_id = get_global_id(0);
int local_id = get_local_id(0);
int local_size = get_local_size(0);

scratch[local_id] = A[global_id]; // Copy from global to local

barrier(CLK_LOCAL_MEM_FENCE);

for (int i = 1; i < local_size; i *= 2)
  {
    if ((local_id % (i * 2) == 0) && ((local_id + i) < local_size)) //Check every item in the work group
    {
      if (scratch[local_id + i] < scratch[local_id]) // If the currently stored value is larger than the next value, the next value is then stored in local mem
      {
        scratch[local_id] = scratch[local_id + i];
      }
    }
    barrier(CLK_LOCAL_MEM_FENCE);
  }


if (!local_id) //Calls for atomic min for every value to find the lowest value
  {
    atomic_min(B, scratch[local_id]); 
  }
}

kernel void max_kernel(global const int* A, global int* B, local int* scratch)
{
int global_id = get_global_id(0);
int local_id = get_local_id(0);
int local_size = get_local_size(0);

scratch[local_id] = A[global_id]; // Copy from global to local

barrier(CLK_LOCAL_MEM_FENCE);

for (int i = 1; i < local_size; i *= 2)
  {
    if ((local_id % (i * 2) == 0) && ((local_id + i) < local_size)) // Sequentially runs through each value in the workgroup
    {
      if (scratch[local_id + i] > scratch[local_id]) // If the currently stored value is smaller than the next value, the next value is then stored in local mem
      {
        scratch[local_id] = scratch[local_id + i];
      }
    }
    barrier(CLK_LOCAL_MEM_FENCE);
  }



if (!local_id) //Calls for atomic max for every value stored in local memory to find the lowest value
  {
    atomic_max(B, scratch[local_id]);
  }
}

kernel void sum_kernel(global const int* A, global int* B, local int* scratch)
{
int global_id = get_global_id(0);
int local_id = get_local_id(0);
int local_size = get_local_size(0);

scratch[local_id] = A[global_id]; // Copy from global to local

barrier(CLK_LOCAL_MEM_FENCE);

for (int i = 1; i < local_size; i *= 2)
  {
    if ((local_id % (i * 2) == 0) && ((local_id + i) < local_size)) //Runs through all local values and sequentially adds them together
    {
        scratch[local_id] += scratch[local_id+i];
    }
    barrier(CLK_LOCAL_MEM_FENCE);
  }

if (!local_id)
  {
    atomic_add(B, scratch[local_id]);
  }
}

kernel void var_kernel_reduce(global const int* A, global int* B, local int* scratch,float mean, int inputSize)
{
	int global_id = get_global_id(0);
	int local_id = get_local_id(0);
	int local_size = get_local_size(0);

	if (global_id < inputSize){
		//calculation for variance
		scratch[local_id] = (A[global_id] - mean) * (A[global_id] - mean); //Runs through each value to  complete part of the variance formula

		barrier(CLK_LOCAL_MEM_FENCE);
		
		B[global_id] = scratch[local_id]; // Adds value to the B vector
		}
}

kernel void var_kernel_sum(global const int* A, global int* B, local int* scratch)
{
	int global_id = get_global_id(0);
	int local_id = get_local_id(0);
	int local_size = get_local_size(0);
	
	scratch[local_id] = A[global_id];
	barrier(CLK_LOCAL_MEM_FENCE);
	for (int i = 1; i < local_size; i *= 2)
	{
		if ((local_id % (i * 2) == 0) && ((local_id + i) < local_size))
		{
			if(scratch[local_id + i] += scratch[local_id])
			{
				scratch[local_id] = scratch[local_id+i];
			}
		}
		barrier(CLK_LOCAL_MEM_FENCE);
	}
		
	scratch[local_id] = scratch[local_id] / 10000; // usually divide by 100, but that they are already multiplied by 100, they need to be divided by 10,000

	if (!local_id)
	{
		atomic_add(B, scratch[local_id]);
	}
	
}


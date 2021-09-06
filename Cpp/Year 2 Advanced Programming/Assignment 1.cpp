#include "Shape.h"
#include "Circle.h"
#include "Rectangle.h"
#include "Square.h"
#include "Movable.h"
#include <vector>
#include <iostream>
#include <string>
#include <chrono> 
using namespace std::chrono;

using namespace std;
int main()
{
	string userCommand;			// string command;
	vector <Shape*> shapes;     // this one will hold your shapes - this is a pointer to the shape object
	vector <string> parameters; // this one will hold parameters for the commands
	
	while (userCommand.compare("exit") != 0) // This program is on a permanent loop, waiting for the command "exit" to close
	{		
		std::cout << "Enter the command: "; // Telling the user to input their command

		getline(cin, userCommand); // Inputs the command
		
		char* cstr = new char[userCommand.length() + 1]; // this creates the source string for the strcpy_s function

		strcpy_s(cstr, userCommand.length() + 1, userCommand.c_str()); //This function is copying the userCommand into the cstr variable


		char delim[] = " "; // This creatures the delim variable, giving it the value of a space to the strtok_s command will look for spaces to break up tokens
		char* next_token1 = NULL; // Creating the token variable to feed into the parameters vector
		char* token = strtok_s(cstr, delim, &next_token1); // Creates the token variable using the strok_s function. This token is the first string in the userCommand
														   // The delim is the space between two strings and the &next_token1 is currently empty but will be populated by the 
														   // next string in the userCommand

		while (token != NULL) //While there are still tokens inside the parameters vector, continue running
		{
			parameters.push_back(token); // This is pushing each token into the parameters vector
			token = strtok_s(NULL, delim, &next_token1); //the next token is created for the next push_back to take place
		}

		if (parameters.empty()) { // Error handling to make sure the parameters vector isn't empty (This would be because the user has pressed enter without entering a command
			cout << "User must enter a command." << endl; // Error message informing the user to enter a command
			continue; // continues out of the while loop, as a crash would happen if the next line tried to convert a token of the parameters vector that didn't exist
		}
			
		string command = parameters[0]; // convert the first token in the parameters vector to the string command to be checked against the if statements

		if (command.compare("addR") == 0) { // First if statement checks for addR as the user would be trying to add a rectangle
			
			if (parameters.size() == 5) { // To add a rectangle the user needs 4 values after the addR, without this an error message will throw and the while loop reset

				string Sx = parameters[1]; // converts the first value to a string. This value will hold the x coordinate
				string Sy = parameters[2]; // converts the next value to a string. This value will hold the y coordinate
				string Sh = parameters[3]; // converts the value into a string. This value will hold the height of the rectangle
				string Sw = parameters[4]; // converts the value into a string. This value will hold the width of the rectangle

				try { //Try block to check that its possible to convert these strings to integers. An error would throw if the user attempted to convert a letter to an int
					int x = stoi(Sx); //Attempts to convert the string holding the x coordinate to an integer using the stoi() function
					int y = stoi(Sy); //Attempts to convert the string holding the y coordinate to an integer using the stoi() function
					int h = stoi(Sh); //Attempts to convert the string holding the height of the rectangle to an integer using the stoi() function
					int w = stoi(Sw); //Attempts to convert the string holding the width of the rectangle to an integer using the stoi() function

					
					if (h > 0 && w > 0) { // If statement to check if either the height or width of the triangle is above 0, if not an error is shown
						Rectangle* r = new Rectangle(x, y, h, w); // The rectangle object is created using the values inputted
						shapes.push_back(r); // This object is then pushed into the shapes vector
						cout << *r; // The overloaded operator << outputs the object through its pointer using the toString() function					
					}
					else 
					{
						cout << "Both Rectangle's height and width must be above 0" << endl; // the error displaying that either the height or width is incorrect (must be above 0)
					}
				}
				catch (const std::invalid_argument & e) // This is for the first try block to check if all the values can be converted to integers
				{
					std::cout << "One or more arguments are invalid for this command. Ensure all arguments after 'addR' are integers " << endl;
				}
			}
			else //This is from the if statement checking that their are 4 values after the addR command
			{
				std::cout << "The parameters size for adding a Rectangle is incorrect. 4 numbers after 'addR' are required" << endl;
			}
																			 
		}
		else if (command.compare("addS") == 0) {// Second if statement checks for addS as the user would be trying to add a square
			
			if (parameters.size() == 4) { // To add a square the user needs 3 values after the addS, without this an error message will throw and the while loop reset
				string Sx = parameters[1]; // converts the first value to a string. This value will hold the x coordinate
				string Sy = parameters[2]; // converts the next value to a string. This value will hold the y coordinate
				string Se = parameters[3]; // converts this value into a string. This will hold the edge value of the square

				try { //Try block to check that its possible to convert these strings to integers. An error would throw if the user attempted to convert a letter to an int
					int x = stoi(Sx); //Attempts to convert the string holding the x coordinate to an integer using the stoi() function
					int y = stoi(Sy); //Attempts to convert the string holding the y coordinate to an integer using the stoi() function
					int e = stoi(Se); //Attempts to convert the string holding the edge value of the square into an integer using the stoi() function

					if (e > 0) { // If statement to check if the edge value is above 0 for the square. Else an error will be shown
						Square* s = new Square(x, y, e); // The square object is created using the values inputted
						shapes.push_back(s); // This object is then pushed into the shapes vector
						cout << *s; // The overloaded operator << outputs the object through its pointer using the toString() function		
					}
					else 
					{
						cout << "Square's edge value must be higher than 0" << endl; // the error displaying that the edge value is incorrect (must be above 0)
					}	
				}
				catch (const std::invalid_argument & e) // This is for the try block to check if all the values can be converted to integers
				{
					std::cout << "One or more arguments are invalid for this command. Ensure all arguments after 'addS' are integers " << endl;
				}
			}
			else //This is from the if statement checking that their are 3 values after the addS command
			{
				std::cout << "The parameters size for adding a Square is incorrect. 3 numbers after 'addS' are required" << endl;
			}
		}
		else if (command.compare("addC") == 0)  // Third if statement checks for addC as the user would be trying to add a circle
		{
			
			if (parameters.size() == 4) { // To add a circle the user needs 3 values after the addC, without this an error message will throw and the while loop reset
				string Sx = parameters[1]; // converts the first value to a string. This value will hold the x coordinate
				string Sy = parameters[2]; // converts the next value to a string. This value will hold the y coordinate
				string Sr = parameters[3]; // converts this value into a string. This will hold the radius value of the circle
				
				try { //Try block to check that its possible to convert these strings to integers. An error would throw if the user attempted to convert a letter to an int
					int x = stoi(Sx); //Attempts to convert the string holding the x coordinate to an integer using the stoi() function
					int y = stoi(Sy); //Attempts to convert the string holding the y coordinate to an integer using the stoi() function
					float r = stof(Sr); //Attempts to convert the string holding the radius value of the circle into an float using the stof() function

					if (r > 0) { // If statement to check if the radius value is above 0 for the circle. Else an error will be shown
						Circle* c = new Circle(x, y, r); // The circle object is created using the values inputted
						shapes.push_back(c); // This object is then pushed into the shapes vector
						cout << *c; // The overloaded operator << outputs the object through its pointer using the toString() function	
					}
					else 
					{
						cout << "Circle's radius value must be higher than 0" << endl; // the error displaying that the radius value is incorrect (must be above 0)
					}
					
				}
				catch (const std::invalid_argument & e)// This is for the try block to check if all the values can be converted to integers
				{
					std::cout << "One or more arguments are invalid for this command. Ensure all arguments after 'addC' are integers " << endl;
				}
			}
			else //This is from the if statement checking that their are 3 values after the addC command
			{
				std::cout << "The parameters size for adding a Circle is incorrect. 3 numbers after 'addC' are required" << endl;
			}

		}
		else if (command.compare("scale") == 0) { //Fourth if statement checks for scale as the user would be trying to scale an object that already exists
										
			int shapeNo; //Initialises the shapeNo variable to be used in the if statement below
			if (parameters.size() == 4) { // To scale a shape the user needs 3 values after the "scale", without this an error message will throw and the while loop reset
				string SNo = parameters[1]; // converts the first value into a string. This will hold the shape ID corresponding to the shape they want to scale
				string Sx_Scale = parameters[2]; //This converts the string for the new x value they wish to scale the shape by to an int
				string Sy_Scale = parameters[3]; //This converts the string for the new y value they wish to scale the shape by to an int
				try {//This try block ensures no errors within the scale function can crash the program
					shapeNo = stoi(SNo); //Here is the stoi() function converting the Shape number string to an integer

					if (shapeNo < (shapes.size() + 1)) //This if statement checks to see if the shape number inputted can exist in the list by checking it against the amount of
					{								   // shapes inside the shapes vector
						shapeNo = shapeNo - 1; //As the index of the first shape in the shapes vector is 0, we subtract 1 from the users number so they are in sync with the index of the shape they'd like to scale
						float x_Scale = stof(Sx_Scale);//This is the stoi() function converting the string of the x value to scale from to an int
						float y_Scale = stof(Sy_Scale);//This is the stoi() function converting the string of the x value to scale from to an int
						if (x_Scale > 0 && y_Scale > 0) { // This if statement checks that both x and y scale values are above 0, or else an error is shown
							Movable* s = nullptr; //This creates an empty pointer that is used when the dynamic_cast function is called
							try { // This try catch will thrown any exception that is unforeseen. 

								s = dynamic_cast<Movable*>(shapes[shapeNo]); //The pointer created earlier now points to the shape the user chooses through the use of dynamic_cast
								if (s) { //This checks to see if s is not null. If it isn't, the dynamic cast has been able to cast the object to pointer we wanted
									s->scale(x_Scale, y_Scale); // The scale function is called and uses the new x y values to scale by
								}

							}
							catch (const std::exception& e) //catch block to catch any exceptions to do with the dynamic_cast or the scale function
							{ 
								cout << e.what() << endl; //outputs to the user the error which has been thrown
							}
							cout << shapes[shapeNo]->toString(); //Uses the toString() function to output the new values and points that have been produced through the scale function
						}
						else //This throws an error saying that one or more of the x/y values must be larger than 0
						{
							cout << "One of more values are not larger than 0, please try again" << endl;
						}
					}
					else //This throws an error displaying that there isn't a shape under the index provided
					{
						cout << "This value does not correspond to an index of a shape" << endl;
					}
				}
				catch (const exception e) { // This is the end of the large catch block which detects if the user has inputted letters that cannot be converted to int.
					std::cout << "One or more arguments are invalid for this command. Ensure all arguments after 'scale' are integers" << endl;
					
				}
			}
			else //Outputs an error message if the user attempts to enter a command with a bad parameter size
			{
				std::cout << "The parameters size for scaling a shape is incorrect. 2 numbers after 'scale' are required" << endl;
			}
		}
		else if (command.compare("move") == 0) { //Fifth if statement checks for "move" as the user would be trying to move an object that already exists
			
			int shapeNo; //Initialises the shapeNo variable to be used in the if statement below
			if (parameters.size() == 4) { // To move a shape the user needs 3 values after the "move", without this an error message will throw and the while loop reset
				string SNo = parameters[1];// converts the first value into a string. This will hold the shape ID corresponding to the shape they want to move
				string NewX = parameters[2];//This converts the string for the new x value they wish to move the shape to, into an int
				string NewY = parameters[3];//This converts the string for the new y value they wish to move the shape to, into an int
				
					try { //This try block ensures no errors within the move function can crash the program
						shapeNo = stoi(SNo); //This is the stoi() function converting the Shape number string to an integer

						if (shapeNo < (shapes.size() + 1)) //This if statement checks to see if the shape number inputted can exist in the list by checking it against the amount of
														   // shapes inside the shapes vector
						{
							shapeNo = shapeNo - 1; //As the index of the first shape in the shapes vector is 0, we subtract 1 from the users number so they are in sync with the index of the shape they'd like to move
							int x = stoi(NewX); //This is the stoi() function converting the string of the x value to move the shape to, into an int
							int y = stoi(NewY); //This is the stoi() function converting the string of the y value to move the shape to, into an int
							Movable* m = nullptr; //This creates an empty pointer that is used when the dynamic_cast function is called
							try { // This try catch will thrown any exception that is unforeseen. 
								m = dynamic_cast<Movable*>(shapes[shapeNo]); //The pointer created earlier now points to the shape the user chooses through the use of dynamic_cast

								if (m) { //This checks to see if m is not null. If it isn't, the dynamic cast has been able to cast the object to pointer we wanted
									m->move(x, y); // The move function is called and uses the new x y values to move the object by
								}							
							}
							catch (const std::exception& e) //catch block to catch any exceptions to do with the dynamic_cast or the move function
							{ 
								cout << e.what() << endl;  //outputs to the user the error which has been thrown
							}

							cout << shapes[shapeNo]->toString(); //Uses the toString() function to output the new values and points that have been produced through the move function
						}
						else //This throws an error displaying that there isn't a shape under the index provided
						{
							cout << "This value does not correspond to an index of a shape" << endl;
							
						}
					}
					catch (const exception e) { // This is the end of the large catch block which detects if the user has inputted letters that cannot be converted to int.
						
						std::cout << "One or more arguments are invalid for this command. Ensure all arguments after 'move' are integers" << endl;
					}
				
							
			}
			else //Outputs an error message if the user attempts to enter a command with a bad parameter size
			{
				std::cout << "The parameters size for moving a shape is incorrect. 3 numbers after 'move' are required" << endl;
			}
			
			

		}
		else if (command.compare("display") == 0) { //Sixth if statement checks for "display" which will output all the shapes currently in the shapes vector
			for (Shape* ptr : shapes) //For loop for every shape pointers in the shapes vector
			{
				
				Shape& shape = *ptr; // dereference ptr to reference 
				std::cout << shape.toString(); //Outputs the shape using the toString() function
				cout << endl; //Ends the line, ready for the next toString() to output
			}
		}
		else if (command.compare("exit") == 0) //checks for the exit command so the final else statement won't output an error message.
		{
		continue; 
		}
		else //If no commands are correct, the user is informed and the loop cycles back to the top
		{
			std::cout << "I'm sorry, that command is invalid, please try again" << endl; //Error message displayed to the user
		}

		
		parameters.clear(); //This empties the parameters vector ready to be used again
		delete[] cstr; //this deletes cstr ready to be used again

		std::cout << endl << endl;
	}

	//The program gets to here when the user inputs "exit"
	std::cout << "Press any key to continue...";
	std::getchar();

	return 0; //Ends program
}



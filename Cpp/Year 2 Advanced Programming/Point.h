#pragma once

#include <iostream>

class Point 
{
public://public integers used by child classes of the shape class to calculate points
	int x;
	int y;
	   
	Point(int _x, int _y); //Point constructor to be used to calculate points within the shapes

	friend std::ostream& operator<<(std::ostream& lhs, const Point& rhs); //Friend function for the overloading << operator. This is used in the child classes of the shape class to output to the toString() function
};

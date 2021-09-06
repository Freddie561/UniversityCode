#pragma once
#ifndef shape_h
#define shape_h
#include <iostream>
#include <set>
#include "Point.h"
#include <vector>
#include <sstream>    

class Shape
{

protected: //These variables and virtual functions are protected as they are used by the child classes but are not called in the main cpp file
	float area; // Variable for area used by the child classes of shape
	float perimeter; // Variable for perimeter used by the child classes of shape
	bool isCircular = false; // Variable used to check if the shape is circular which is used by the child classes of shape

	std::vector<Point> points; // vector that holds the points for use by the child classes of shape

	virtual void calculateArea() {}; // virtual functions below used by the child classes
	virtual void calculatePerimeter() {}; 
	virtual void calculatePoints() {};


public: //these are called in the main .cpp file so they must be public
	
	virtual std::string toString() const { return ""; } //to string function that is used by the child classes and also called in the main .cpp file

};
#endif 

#include "Rectangle.h"
using namespace std;

Rectangle::Rectangle(int x, int y, int height, int width) //class constructor of the Rectangle
	: height(height) //This is the list of variables being initialised
	, width(width)
{
	calculateArea(); //Calls this function to calculate the area
	calculatePerimeter(); // Calls this function to calculate perimeter
	calculatePoints(x, y, height, width); // Calls this function to calculate the points
}

void Rectangle::move(int x, int y) //Function to move an object to two new coordinates
{
	calculatePoints(x, y, height, width); //To move an object we call the calculatePoints function and run the new x and y coordinates through it. 
}

void Rectangle::scale(float x, float y) // Function to scale an object by two floats.
{
	height = height * x; //The height of the rectangle is scaled by the x value inputted
	width = width * y; // The width of the rectangle is scaled by the y value inputted
	Point leftTop = *points.begin(); //Begin returns an iterator to the first item in the vector. "*" then dereferences the iterator to get the item itself
	calculatePoints(leftTop.x, leftTop.y, (height), (width)); //Call the calculatePoints function again with its new x y coordinates
	calculateArea(); //Calculate area with its new height and width
	calculatePerimeter(); // Calculate perimeter with its new height and width
}

void Rectangle::calculateArea() // Function to calculate the area of a Rectangle
{
	area = static_cast<float>(height * width); //area is inherited from the shape class and is assigned by multiplying the height and width
}

void Rectangle::calculatePerimeter() // Function to calculate the perimeter of a Rectangle
{
	perimeter = (height + width) * 2; //perimeter is inherited from the shape class and is assigned by adding the height and width together and multiplying by 2
}

void Rectangle::calculatePoints(int x, int y, int height, int width) //This function calculates the points 
{
	Point leftTop(x,y); //These four Points are inherited from the Point class and assigned values here
	Point rightTop(x+width,y);
	Point rightBottom(x + width, y + height);
	Point leftBottom(x,y+height);
	
	// This is some exception handling that will prevent integer overflow
	if (leftTop.x > rightBottom.x || leftTop.y > rightBottom.y)
	{
		std::exception e("Integer overflow in calculate points. Shape unmodified.");

		throw e;
	}

	points.clear();	//This removes the previous points that were calculated before
	points.insert(points.begin(), { leftTop, rightTop, rightBottom, leftBottom }); //This inserts the points in this order from the beginning

}

Rectangle::~Rectangle() //Deconstructor for the rectangle
{
	
}
	
// preparing a string stream to output the rectangle object information
std::string Rectangle::toString() const
{
	std::ostringstream oss; //creating an ostringstream object to output strings to console
	
	oss << "Rectangle [h=" << height << ",w=" << width << "]" << endl; //outputs the height and width of the rectangle
	oss << "Points [";
	for (const Point& iter : points)
	{
		oss << iter; // This is where the << operator that is inherited from the point class displays the points
	}
	oss << "]" << endl;

	oss << "Area= " << area << " Perimeter= " << perimeter << endl;	//Outputs the area and perimeter of the rectangle

	return oss.str(); //returns the oss
}

std::ostream& operator<<(std::ostream& out, const Rectangle& rhs) //using the toString() function, we the return value here with <<
{
	out << rhs.toString(); //runs the toString() function and outputs what it returns
	return out;
}
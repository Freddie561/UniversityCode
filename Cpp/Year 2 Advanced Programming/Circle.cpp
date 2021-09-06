#include "Circle.h"

Circle::Circle(int x, int y, float radius) //Class constructor of the Circle
	: radius(radius) //The radius variable being initialised
{
	isCircular = true; //This bool is turned to true in this constructor
	calculateArea(); //Calls this function to calculate the area
	calculatePerimeter(); // Calls this function to calculate perimeter
	calculatePoints(x, y, radius); // Calls this function to calculate the points
}

void Circle::move(int x, int y)  //Function to move an object to two new coordinates
{
	calculatePoints(x, y, radius); //To move an object we call the calculatePoints function and run the new x and y coordinates through it. 
}

void Circle::scale(float x, float y)  // Function to scale an object by two floats.
{
	radius = radius * x; // The radius of circle is multiplied by the float x
	Point leftTop = *points.begin(); //Begin returns an iterator to the first item in the vector. "*" then dereferences the iterator to get the item itself
	
	if (x != y) // if statement to check if the x and y values are the same. As this object is isometric, an error will throw if the values are not the same
	{
		std::exception e("X and Y did not match for scaling circle. Scaling canceled");
		throw e; // Throws the exception
	}

	calculatePoints(leftTop.x, leftTop.y, radius); //Call the calculatePoints function again with its new x y coordinates
	calculateArea(); //Calculate area with its new radius
	calculatePerimeter(); // Calculate perimeter with its new radius
	cout << "Scaling isotropic object, using x value only" << endl;
}

void Circle::calculateArea()  // Function to calculate the area of a Circle
{
	area = radius * M_PI; //area is inherited from the shape class and is assigned by multiplying the radius by PI
}

void Circle::calculatePerimeter()  // Function to calculate the perimeter of a Circle
{
	perimeter = (radius * M_PI) * 2; //perimeter is inherited from the shape class and is assigned by multiplying the radius plus PI by 2
}

void Circle::calculatePoints(int x, int y, float radius) //This function calculates the points of the square object
{
	Point leftTop(x, y); //These two Points are inherited from the Point class and assigned values here
	Point rightBottom(x + 2 * radius, y + 2 * radius);

	// This is some exception handling that will prevent integer overflow
	if (leftTop.x > rightBottom.x || leftTop.y > rightBottom.y)
	{
		std::exception e("Integer overflow in calculate points. Shape unmodified.");

		throw e;
	}

	points.clear(); //This removes the previous points that were calculated before
	points.insert(points.begin(), { leftTop, rightBottom }); //This inserts the points in this order from the beginning
}
// preparing a string stream to output the square object information
std::string Circle::toString() const
{
	std::ostringstream oss; //creating an ostringstream object to output strings to console
	
	oss << "Circle [r=" << radius << "]" << endl; //outputs the radius of the circle
	oss << "Points [";
	for (const Point& iter : points)
	{
		oss << iter; // This is where the << operator that is inherited from the point class displays the points
	}
	oss << "]" << endl;

	oss << "Area= " << area << " Perimeter= " << perimeter << endl; //Outputs the area and perimeter of the circle


	return oss.str();//returns the oss
}

std::ostream& operator<<(std::ostream& out, const Circle& rhs) //using the toString() function, we the return value here with <<
{
	out << rhs.toString(); //runs the toString() function and outputs what it returns
	return out;
}



Circle::~Circle() { //Deconstructor for the circle

	
}

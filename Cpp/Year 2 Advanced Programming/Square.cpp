#include "Square.h"


Square::Square(int x, int y, int edge)//class constructor of the Square
	: edge(edge) //This is the list of variables being initialised
{
	calculateArea(); //Calls this function to calculate the area
	calculatePerimeter(); // Calls this function to calculate perimeter
	calculatePoints(x, y, edge); // Calls this function to calculate the points
};

void Square::move(int x, int y) //Function to move an object to two new coordinates
{
	calculatePoints(x, y, edge); //To move an object we call the calculatePoints function and run the new x and y coordinates through it. 
};

void Square::scale(float x, float y)  // Function to scale an object by two floats.
{
	edge = edge * x; //The size of the squares edge is multiples by the float x
	Point leftTop = *points.begin(); //Begin returns an iterator to the first item in the vector. "*" then dereferences the iterator to get the item itself

	if (x != y) // if statement to check if the x and y values are the same. As this object is isometric, an error will throw if the values are not the same
	{
		std::exception e("X and Y did not match for scaling circle. Please ensure they are the same values if you wish to scale an isometric object");
		throw e; // Throws the exception
	}

	calculatePoints(leftTop.x, leftTop.y, edge); //Call the calculatePoints function again with its new x y coordinates
	calculateArea(); //Calculate area with its new edge value
	calculatePerimeter(); // Calculate perimeter with its new edge value
}

void Square::calculateArea() // Function to calculate the area of a Square
{
	area = static_cast<float>(edge * edge); //area is inherited from the shape class and is assigned by multiplying the edge by the edge
};

void Square::calculatePerimeter() // Function to calculate the perimeter of a Square
{
	perimeter = edge * 4; //perimeter is inherited from the shape class and is assigned by multiplying the edge value by 4
}

void Square::calculatePoints(int x, int y, int edge) { //This function calculates the points of the square object

	Point leftTop(x, y); //These four Points are inherited from the Point class and assigned values here
	Point rightTop(x + edge, y);
	Point leftBottom(x, y + edge);
	Point rightBottom(x + edge, y + edge);

	// This is some exception handling that will prevent integer overflow
	if (leftTop.x > rightBottom.x || leftTop.y > rightBottom.y)
	{
		std::exception e("Integer overflow in calculate points. Shape unmodified.");

		throw e;
	}

	points.clear(); //This removes the previous points that were calculated before
	points.insert(points.begin(), { leftTop, rightTop, rightBottom, leftBottom }); //This inserts the points in this order from the beginning
	
}
	
// preparing a string stream to output the square object information
std::string Square::toString() const
{
	std::ostringstream oss; //creating an ostringstream object to output strings to console

	oss << "Square [e=" << edge << "]" << endl; //outputs the edge value of the square
	oss << "Points [";
	for (const Point& iter : points)
	{
		oss << iter; // This is where the << operator that is inherited from the point class displays the points
	}
	oss << "]" << endl;

	oss << "Area= " << area << " Perimeter= " << perimeter << endl; //Outputs the area and perimeter of the square

	return oss.str(); //returns the oss
}

std::ostream& operator<<(std::ostream& out, const Square& rhs) //using the toString() function, we the return value here with <<
{
	out << rhs.toString(); //runs the toString() function and outputs what it returns
	return out;
}

Square::~Square() { //Deconstructor for the square
	 
	
}
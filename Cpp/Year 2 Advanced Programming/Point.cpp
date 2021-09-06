#include"Point.h"

Point::Point(int _x, int _y) // Creating the point class constructor
	: x(_x) // This is the initialiser list for the points
	, y(_y)
{

}

std::ostream& operator<<(std::ostream& out, const Point& rhs) //overloading the << operator to display points
{
	out << "(" << rhs.x << "," << rhs.y << ")"; // this outputs the right hand side x coordinate, then the right hand side y coordinate (This is why its called rhs.x/.y)

	return out;
}


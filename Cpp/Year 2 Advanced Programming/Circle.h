#define _USE_MATH_DEFINES
#include <iostream>
#include "Shape.h"
#include <Math.h>
#include "Movable.h"
using namespace std;
class Circle: public Shape, public Movable  //This class inherits from the shape class and movable class
{ 

private: //These functions and variables are used within the Circle class so they are kept private
	
	float radius;
	//below are the third functions that are used when creating a circle. These functions are only used in the Circle class
	void calculateArea();
	void calculatePerimeter();
	void calculatePoints(int leftTop, int rightTop, float radius);

protected:
	//Below are functions used by the Circle class, but are called in the main .cpp file so they are kept protected
	void move(int x, int y);
	void scale(float x, float y);
	virtual std::string toString() const;
	friend std::ostream& operator<<(std::ostream& lhs, const Circle& rhs);

public:
	//Below is the constructor of the Circle object. This needs to be kept public for use in the main .cpp file
	Circle(int x, int y, float radius);
	~Circle();//Deconstructor for the circle object
	

};

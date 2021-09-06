#include <iostream>
#include "Shape.h"
#include "Movable.h"
 


class Rectangle :public Shape ,public Movable //This class inherits from the shape class and movable class
{

private: //These functions and variables are used within the Rectangle class so they are kept private

	int height;
	int width;
	//below are the third functions that are used when creating a rectangle. These functions are only used in the Rectangle class
	void calculateArea();
	void calculatePerimeter();
	void calculatePoints(int x, int y, int height, int width);
	

protected:
	//Below are functions used by the Rectangle class, but are called in the main .cpp file so they are kept protected
	void move(int x, int y);
	void scale(float x, float y);
	
	virtual std::string toString() const;
	friend std::ostream& operator<<(std::ostream& lhs, const Rectangle& rhs);

public:
	//Below is the constructor of the Rectangle object. This needs to be kept public for use in the main .cpp file
	Rectangle(int x, int y, int height, int width);
	~Rectangle(); //Deconstructor for the rectangle object

};


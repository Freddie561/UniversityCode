#include <iostream>
#include "Shape.h"
#include "Movable.h"
using namespace std;

class Square : public Shape, public Movable { //This class inherits from the shape class and movable class

private: //These functions and variables are used within the Square class so they are kept private
	int edge;
	//below are the third functions that are used when creating a Square. These functions are only used in the Square class
	void calculateArea();
	void calculatePerimeter();
	void calculatePoints(int x, int y, int edge);
	
protected:
	//Below are functions used by the Square class, but are called in the main .cpp file so they are kept protected
	void move(int x, int y);
	void scale(float x, float y);

	virtual std::string toString() const;

	friend std::ostream& operator<<(std::ostream& lhs, const Square& rhs);
public:
	//Below is the constructor of the Square object. This needs to be kept public for use in the main .cpp file
	Square(int x, int y, int edge);
	~Square(); //Deconstructor for the square object

};

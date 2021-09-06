#pragma once
#include <iostream>


class Movable {

public: //Below are two virtual functions used by the child classes of the shapes. 
		//Important to note that the class "Shape" does not inherit from the movable class, only the child classes do
	virtual void move(int x, int y) {};
	virtual void scale(float x, float y){};

};
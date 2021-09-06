#include "bots.h"
#include <iostream>
using namespace std;
//the algorithim needs to maintain the following data:
//1. Which nodes (grid locations) are closed
//2. A cost value of each node
//3. Link X and Y coords for each node (shows the best ways to get there)
//4. Which nodes form the final path

void cDijkstra::Build(cBotBase& bot)
{
	for (int x = 0; x < GRIDWIDTH; x++) {
		for (int y = 0; y < GRIDHEIGHT; y++) {
			closed[x][y] = false;
			cost[x][y] = 1000000.0f;
			linkX[x][y] = -1;
			linkY[x][y] = -1;
			inPath[x][y] = false;
		}
	}
	
	int targetX = bot.PositionX();
	int targetY = bot.PositionY();
	cost[bot.PositionX()][bot.PositionY()] = 0;
	float newcost;
	while (closed[gTarget.PositionX()][gTarget.PositionY()] == false) {

		float small = 999999999999;
		closed[targetX][targetY] = true;
		if (gLevel.isValid(targetX + 1, targetY)) {
			if (!closed[targetX + 1][targetY])
			{
				newcost = cost[targetX][targetY] + 1;
				if (newcost < cost[targetX + 1][targetY])
				{
					cost[targetX + 1][targetY] = newcost;
					linkX[targetX + 1][targetY] = targetX;
					linkY[targetX + 1][targetY] = targetY;
					
					
				}
			}
		}
		if (gLevel.isValid(targetX + 1, targetY + 1)) {
			if (!closed[targetX + 1][targetY + 1])
			{
				newcost = cost[targetX][targetY] + 1.4;
				if (newcost < cost[targetX + 1][targetY + 1])
				{
					cost[targetX + 1][targetY + 1] = newcost;
					linkX[targetX + 1][targetY + 1] = targetX;
					linkY[targetX + 1][targetY + 1] = targetY;
					
					
				}
			}
		}
		if (gLevel.isValid(targetX, targetY + 1)) {
			if (!closed[targetX][targetY + 1])
			{
				newcost = cost[targetX][targetY] + 1;
				if (newcost < cost[targetX][targetY + 1])
				{
					cost[targetX][targetY + 1] = newcost;
					linkX[targetX][targetY + 1] = targetX;
					linkY[targetX][targetY + 1] = targetY;
					
					
				}
			}
		}
		if (gLevel.isValid(targetX - 1, targetY + 1)) {
			if (!closed[targetX - 1][targetY + 1])
			{
				newcost = cost[targetX][targetY] + 1.4;
				if (newcost < cost[targetX - 1][targetY + 1])
				{
					cost[targetX - 1][targetY + 1] = newcost;
					linkX[targetX - 1][targetY + 1] = targetX;
					linkY[targetX - 1][targetY + 1] = targetY;
					
					
				}
			}
		}
		if (gLevel.isValid(targetX - 1, targetY)) {
			if (!closed[targetX - 1][targetY])
			{
				newcost = cost[targetX][targetY] + 1;
				if (newcost < cost[targetX - 1][targetY])
				{
					cost[targetX - 1][targetY] = newcost;
					linkX[targetX - 1][targetY] = targetX;
					linkY[targetX - 1][targetY] = targetY;
					
					
				}
			}
		}
		if (gLevel.isValid(targetX - 1, targetY - 1)) {
			if (!closed[targetX - 1][targetY - 1])
			{
				newcost = cost[targetX][targetY] + 1.4;
				if (newcost < cost[targetX - 1][targetY - 1])
				{
					cost[targetX - 1][targetY - 1] = newcost;
					linkX[targetX - 1][targetY - 1] = targetX;
					linkY[targetX - 1][targetY - 1] = targetY;
					
					
				}
			}
		}
		if (gLevel.isValid(targetX, targetY - 1)) {
			if (!closed[targetX][targetY - 1])
			{
				newcost = cost[targetX][targetY] + 1;
				if (newcost < cost[targetX][targetY - 1])
				{
					cost[targetX][targetY - 1] = newcost;
					linkX[targetX][targetY - 1] = targetX;
					linkY[targetX][targetY - 1] = targetY;

				}
			}
		}
		if (gLevel.isValid(targetX + 1, targetY - 1)) {
			if (!closed[targetX + 1][targetY - 1])
			{
				newcost = cost[targetX][targetY] + 1.4;
				if (newcost < cost[targetX + 1][targetY - 1])
				{
					cost[targetX + 1][targetY - 1] = newcost;
					linkX[targetX + 1][targetY - 1] = targetX;
					linkY[targetX + 1][targetY - 1] = targetY;


				}
			}
		}
		for (int i = 0; i < GRIDWIDTH; i++)
		{
			for (int j = 0; j < GRIDHEIGHT; j++) 
			{
				if (gLevel.isValid(i, j)) 
				{
					if (closed[i][j] == false) 
					{
						if (cost[i][j] < small)
						{
							small = cost[i][j];
							targetX = i;
							targetY = j;
						}
					}
					
				}
					
				
			}
		}
		closed[targetX][targetY] = true;
		
	}
		

		

	
	

	bool done = false; //set to true when we are back at the bot position
	int nextClosedX = gTarget.PositionX(); //start of path
	int nextClosedY = gTarget.PositionY(); //start of path
	while (!done)
	{
		inPath[nextClosedX][nextClosedY] = true;
		int tmpX = nextClosedX;
		int tmpY = nextClosedY;
		nextClosedX = linkX[tmpX][tmpY];
		nextClosedY = linkY[tmpX][tmpY];
		if ((nextClosedX == bot.PositionX()) && (nextClosedY ==
			bot.PositionY())) done = true;
	}
	completed = true;

}
cDijkstra gDijkstra;



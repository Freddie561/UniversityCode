using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.IO;

namespace Assignment_3
{
    class Program
    {
       
        static void Main(string[] args)
        {
           //Here I am creating two new Games using the classes created later on in the program
            Game1 game1 = new Game1();
            Game2 game2 = new Game2();
            Console.WriteLine("Welcome to my Assignment");
            Console.WriteLine("\nGame 1 will have you be presented with three Prime Minister's names to which you need to decide which one served first.");
            Console.WriteLine("Game 2 will have you be presented with three Prime Minister's names and a date of term of one of them.\nYou need to decide which Prime Minister served on that date.");
            Console.WriteLine("\nPlease select which game you wish to play by entering either 'A' or 'B':");
            Console.WriteLine("----------------------");
            Console.WriteLine("A: Game 1");
            Console.WriteLine("\nB: Game 2");
            Console.WriteLine("\nIf you wish to Quit, please type 'Quit'");
            bool gamebool = true;
            //This while statement checks the users input to see which game they select. If anyone other than A, B or Quit is inputted, the program will show Incorrect Input 
            while (gamebool)
            {
                string gameoption = Console.ReadLine();

                if (gameoption.ToLower() == "A".ToLower())
                {
                    Console.WriteLine("Game 1 Starting:");
                    game1.Game();
                }
                if (gameoption.ToLower() == "B".ToLower())
                {
                    Console.WriteLine("Game 2 Starting:");
                    game2.Game();
                }
                if (gameoption.ToLower() == "Quit".ToLower())
                {
                    Environment.Exit(1);
                }

                else
                {
                    Console.WriteLine("Incorrect Input");

                }
            }
       

        }
    }
    //Here is the first Game's code
    class Game1
    {
        public void Game()
        {
            //Implementing the csv file into the program

            var read = new StreamReader("list.csv");

            //creating the five lists using the five columns inside the excel spreadsheet
            List<string> ListNo = new List<string>();
            List<string> ListName = new List<string>();
            List<string> ListDOB = new List<string>();
            List<string> ListSDOT = new List<string>();
            List<string> ListEDOT = new List<string>();


            //Here I create two variables, the first being line, then one for values. This allows me to split them into Lists later on.
            //This is all done while there's data to implement, when there is no data the while loop stops
            while (!read.EndOfStream)
            {
                var line = read.ReadLine();
                var values = line.Split(',');

                //here we add the values to each list that has been created
                //This if statement also checks to see if the values include "No". This removes the first line of the 
                if (!values[0].Equals("No"))
                {
                    //This if statement checks to see if the ListName that is being implemented already exists, if it does the entire line is ignored.
                    //This removes the chances of duplicate Prime Minister Dates

                    if (!ListName.Contains(values[1]))
                    {
                        ListNo.Add(values[0]);
                        ListName.Add(values[1]);
                        ListDOB.Add(values[2]);
                        ListSDOT.Add(values[3]);
                        ListEDOT.Add(values[4]);
                    }

                }

            }

            //This line of code is kept commented. This is used for testing purposes to check that the program has implemented the data properly 
            //for (int i = 0; i < ListName.Count; i++)
            //{
            //   Console.WriteLine($"{ListNo[i]} : {ListName[i]} : {ListDOB[i]} - {ListSDOT[i]} - {ListEDOT[i]} ");
            //}

            //Here is the start of a large while loop. This loop is used to restart the program if the user wants to play again.
            bool restart = true;
            while (restart)
            {
                //Here the score is created using the Player class
                //There are also some strings, int and bool created for further use
                Player score = new Player();
                score.PlayerScore = 0;
                bool run = true;
                string startoption;
                int ii = 0;
                string finishoption;

                //Console.Clear() is used here to tidy the program so the user isn't overwhelmed with data on the console

                Console.Clear();
                //Here is the fist thing the user will see, explaining the game before they begin
                Console.WriteLine("----------------------");
                Console.WriteLine("Code by: Freddie Palmer (18679256)");
                Console.WriteLine("----------------------");
                Console.WriteLine("Welcome to the Prime Minister Game");
                Console.WriteLine("\nIn this game, you will be given 3 Prime Ministers to choose from and you have to guess which one served first.");
                Console.WriteLine("You will be given a score out of 5 based on 5 questions");
                Console.WriteLine("\nIf you are ready to start, type 'Ready', if you wish to quit, type 'Quit'");
                Console.WriteLine("----------------------");

                //while statement to see if they are ready. If they type ready the game begins
                //They can type quit and the game closes. If they type anything else the console will show incorrect input

                while (run)

                {
                    startoption = Console.ReadLine();
                    if (startoption.ToLower() == "Ready".ToLower())
                    {
                        Console.WriteLine("Game Starting...");
                        run = false;
                    }
                    else if (startoption.ToLower() == "Quit".ToLower())
                    {
                        System.Environment.Exit(1);
                    }
                    else
                    {
                        Console.WriteLine("Incorrect input, Please enter either 'Ready' or 'Quit'");
                    }
                }

                //Another clear function to tidy the screen

                Console.Clear();
                Console.WriteLine("Game Started!");
                Console.WriteLine("----------------------");


                //Here is the start of the game's main while loop. Using the int declared above, this while loop runs 5 times overall
                
                while (ii < 5)
                {
                    
                    Console.WriteLine("Out of these three Prime Ministers, who served first? Please type either 'A', 'B', or 'C'");

                    //A new random variable is created to further use

                    Random rnd = new Random();

                    //Using the random variable, we are able to create three numbers. Inside the parameters of these numbers is the listname.count. 
                    //This means the numbers can only go up to the amount of names there are in the list
                    //The three ints being created are used further in the question function. They are also recreated each time so the user isn't presented with the same three options every time.

                    int rndA = rnd.Next(ListName.Count);
                    int rndB = rnd.Next(ListName.Count);
                    int rndC = rnd.Next(ListName.Count);

                    //This while loop is used to check if the three random numbers are different from one another. This removes the chances of the same Prime Minister showing up twice in the same question.

                    while ((rndA == rndB) || (rndB == rndC) || (rndC == rndA))
                    {
                        rndA = rnd.Next(ListName.Count);
                        rndB = rnd.Next(ListName.Count);
                        rndC = rnd.Next(ListName.Count);

                    }

                    //Here using the three numbers created, the console displays the names associated with those three numbers. 
                    //These are the three options the user sees.

                    Console.WriteLine("------------------");
                    Console.WriteLine("A:{0}", ListName[rndA]);
                    Console.WriteLine("B:{0}", ListName[rndB]);
                    Console.WriteLine("C:{0}", ListName[rndC]);
                    Console.WriteLine("------------------");

                    //This array is created out of the three numbers that have been randomly generated.


                    int[] answerarray = new[] { rndA, rndB, rndC };

                    //This int is how the program finds the correct answer. We use the index value of the three rndA, rndB, rndC to see what is smallest, as that must be the correct answer.

                    int answerint = answerarray.Min();


                    //You can remove the comment line for testing purposes to display the answer with the question, so you can test what happens if you get it right

                    //Console.WriteLine("Test {0}", answerint);
                    //Console.WriteLine(ListName[answerint]);


                    //The program checks to see what the user has implemented and also creates a new string for later purposes
                    string answerLetter = Console.ReadLine();
                    string answerP = "";

                    //This if statement converts the users answer to one of the three options the have chosen.
                    //It also converts the answer to lower case so it wouldn't matter if the user inputted "a" or "A"

                    if (answerLetter.ToLower() == "A".ToLower())
                    {
                        answerP = ListName[rndA];

                    }
                    else if (answerLetter.ToLower() == "B".ToLower())
                    {
                        answerP = ListName[rndB];

                    }
                    else if (answerLetter.ToLower() == "C".ToLower())
                    {
                        answerP = ListName[rndC];

                    }
                    else
                    {
                        Console.WriteLine("Please type A, B or C");
                    }

                    //This is the if statement used to see if the answer the user has implemented is the same as the correct answer the program has found

                    if (answerP.ToLower() == ListName[answerint].ToLower())
                    {
                        Console.WriteLine("Correct!");

                        //For confirmation the user is also shown the correct answer.

                        Console.WriteLine("The answer is indeed {0}", ListName[answerint]);

                        //The score.addS() and score.displayS() functions are fired here if the user gets the correct answer, this is adding a point to the users score and displaying the score.
                        score.addS();
                        score.displayS();
                        Console.WriteLine("------------------");
                    }

                    //However if the user implemented the incorrect answer, the else is fired. 

                    else
                    {
                        Console.WriteLine("That is incorrect!");
                        Console.WriteLine("The correct answer was {0}", ListName[answerint]);

                        //the score.displayS() is still fired to show the user their score.

                        score.displayS();
                        Console.WriteLine("------------------");
                    }

                    //This adds 1 to the ii int, finishing the while loop when ii becomes 5

                    ii++;
                }

                //When the game is complete, the user is displayed these messages and their final score. They are then given the option to close the program of restart the game.

                Console.WriteLine("That is the game complete!");
                score.displayS();
                Console.WriteLine("------------------");
                Console.WriteLine("I hope you enjoyed! Type 'Restart' to restart the game,'Quit' to end the game!");

                //This is a small while loop asking the user to type either 'Restart' to restart the game,'Quit' to end the game

                run = true;
                while (run)

                {
                    finishoption = Console.ReadLine();

                    //Whatever they type here is always changed to lowercase to avoid confusion within the program

                    if (finishoption.ToLower() == "Quit".ToLower())
                    {
                        
                        //The bool restart is turned to false and the program is closed
                        //This is the bool that was created when the Game 1 starts
                        restart = false;
                        Environment.Exit(1);
                    }
                    if (finishoption.ToLower() == "Restart".ToLower())
                    {
                        //Here if the user inputs restart, the run bool is turned to false, taking the program out of this loop and back up to the start of the Game to play again.

                        run = false;
                    }
                    else
                    {
                        //If anything else is inputted, this is shown and the while loop continues until either "Quit" or "Restart" is entered.

                        Console.WriteLine("Incorrect input, Please either type Restart or Quit");
                    }
                }
            }
        }
    }
    //Here the program is creating the second game with its own class. 

    class Game2
    {
        //This is the main and only function of this class

        public void Game()
        {
            //Everything here is identical to the Game1

            var read = new StreamReader("list.csv");

            //creating the five lists using the five columns inside the excel spreadsheet
            List<string> ListNo = new List<string>();
            List<string> ListName = new List<string>();
            List<string> ListDOB = new List<string>();
            List<string> ListSDOT = new List<string>();
            List<string> ListEDOT = new List<string>();

            while (!read.EndOfStream)
            {
                var line = read.ReadLine();
                var values = line.Split(',');

                //here we add the values to each list

                if (!values[0].Equals("No"))
                {
                    if (!ListName.Contains(values[1]))
                    {
                        ListNo.Add(values[0]);
                        ListName.Add(values[1]);
                        ListDOB.Add(values[2]);
                        ListSDOT.Add(values[3]);
                        ListEDOT.Add(values[4]);
                    }

                }

            }

            


            bool restart = true;
            while (restart == true)
            {

                Player score = new Player();
                score.PlayerScore = 0;
                bool run = true;
                string startoption;
                string finishoption;

                Console.Clear();

                //Here is where the class differentiate as the user is shown a different set of writelines.

                Console.WriteLine("----------------------");
                Console.WriteLine("Code by: Freddie Palmer (18679256)");
                Console.WriteLine("----------------------");
                Console.WriteLine("Welcome to the Prime Minister Date Game");
                Console.WriteLine("\nIn this game you will be presented with three Prime Ministers names and a date.\nYou will need to guess which PM is serving on that date.");
                Console.WriteLine("\nIf you are ready to start, type 'Ready', if you wish to quit, type 'Quit'");
                Console.WriteLine("----------------------");

                //while statement to see if they are ready. If they type ready the game begins
                //They can type quit and the game closes. If they type anything else the console will show incorrect input


                
                while (run == true)

                {
                    startoption = Console.ReadLine();
                    if (startoption.ToLower() == "Ready".ToLower())
                    {
                        Console.WriteLine("Game Starting...");
                        run = false;
                    }
                    else if (startoption.ToLower() == "Quit".ToLower())
                    {
                        System.Environment.Exit(1);
                    }
                    else
                    {
                        Console.WriteLine("Incorrect input, Please enter either 'Ready' or 'Quit'");
                    }
                }

                //Here is a clear just to tidy up the console for the user

                Console.Clear();

                Console.WriteLine("Game Started!");
                int ii = 0;

                //Here is the start of the game's main while loop. Using the int declared above, this while loop runs 5 times overall

                while (ii < 5)
                {
                    Random rnd = new Random();

                    //Like in the first game the program creates three random numbers within the parameters of the .Count numbers.

                    int rndA = rnd.Next(ListSDOT.Count);
                    int rndB = rnd.Next(ListSDOT.Count);
                    int rndC = rnd.Next(ListSDOT.Count);

                    //This while loop is used to check if the three random numbers are different from one another. This removes the chances of the same Prime Minister showing up twice in the same question.

                    while ((rndA == rndB) || (rndB == rndC) || (rndC == rndA))
                    {
                        rndA = rnd.Next(ListName.Count);
                        rndB = rnd.Next(ListName.Count);
                        rndC = rnd.Next(ListName.Count);

                    }

                    //For the program to decide on the correct answer it will randomly decide between the three random numbers generated

                    int[] answerarray = new[] { rndA, rndB, rndC };

                    //The program will then store that answer in the int answerint

                    int answerint = answerarray[rnd.Next(answerarray.Length)];
                    
                    //The line underneath can be uncommented for testing purposes to check what happens if the user gets it correct as it'll display the correct answer above

                    //Console.WriteLine(ListName[answerint]);

                    Console.WriteLine("------------------");

                    //This line shows the date the user is trying to guess belongs to one of the three options.

                    Console.WriteLine("Out of these three Prime Ministers, who served during this date:{0}", ListSDOT[answerint]);
                    Console.WriteLine("A:{0}", ListName[rndA]);
                    Console.WriteLine("B:{0}", ListName[rndB]);
                    Console.WriteLine("C:{0}", ListName[rndC]);
                    Console.WriteLine("------------------");
                    
                    //Similar to the first game, the user's input is then converted to either an A, B or C.
                    //This then corresponds to one of the three options
                    
                    string answerLetter = Console.ReadLine();
                    string answerP = "";
                    if (answerLetter.ToLower() == "A".ToLower())
                    {
                        answerP = ListSDOT[rndA];
                    }
                    else if (answerLetter.ToLower() == "B".ToLower())
                    {
                        answerP = ListSDOT[rndB];
                    }
                    else if (answerLetter.ToLower() == "C".ToLower())
                    {
                        answerP = ListSDOT[rndC];
                    }
                    else
                    {
                        Console.WriteLine("Please type A, B or C");
                    }

                    //This if statement is ran to see if the users answer is correct. It checks the answer from the user against the answer generated by the program are the same  

                    if (answerP.ToLower() == ListSDOT[answerint].ToLower())
                    {
                        //If they are the same this if statement fires

                        Console.WriteLine("Correct!");
                        Console.WriteLine("The answer is indeed {0}", ListName[answerint]);

                        //the score is added and then displayed afterwards
                        score.addS();
                        score.displayS();
                        Console.WriteLine("------------------");
                    }

                    else
                    {
                        //if the user is incorrect, the score is displayed but no points are added

                        Console.WriteLine("That is incorrect!");
                        Console.WriteLine("The correct answer was {0}", ListName[answerint]);
                        score.displayS();
                        Console.WriteLine("------------------");
                    }

                    //This will just add +1 to ii, allowing for the while statement to be ran 5 times
                    ii++;

                }


              //When the game is completed the score is displayed along with the following lines

                Console.WriteLine("That is the game complete!");
                score.displayS();
                Console.WriteLine("------------------");
                Console.WriteLine("I hope you enjoyed! Type 'Restart' to restart the game,'Quit' to end the game!");

                //Here a bool is created called run, it is used in the while loop to check what the user decides to do.
                //They could either quit by typing "Quit" or restart by typing "Restart". If they type anything else, the else statement fires

                run = true;
                while (run == true)

                {
                    finishoption = Console.ReadLine();
                    if (finishoption.ToLower() == "Quit".ToLower())
                    {
                        restart = false;
                        System.Environment.Exit(1);
                    }
                    if (finishoption.ToLower() == "Restart".ToLower())
                    {
                        //As the restart bool is still true, after coming out of the while loop using run, the program jumps back up to the start where the while loop using restart is and starts again.
                        //The run bool is turned false so we are brought out of the while loop using run as a bool
                        run = false;
                    }
                    else
                    {
                        Console.WriteLine("Incorrect input, Please either type Restart or Quit");
                    }
                }
            }   
        }


    }

    //Here the Player class is created. This is used to keep track of their score throughout the game
    class Player
        {

        //This is the public int that is used to track score
        public int PlayerScore;

        //The function to display the score to the user

        public void displayS()
            {
                Console.WriteLine("Player Score:{0}", PlayerScore);
            }

        //This function to add to the score, this always adds just 1, so if the user gets a question right a point is added

        public void addS()
            {
                PlayerScore = PlayerScore + 1;
            }
            
  
        }

    }



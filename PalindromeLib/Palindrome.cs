using System;

namespace PalindromeLib
{
   public class Palindrome
    {
        static void Main(string[] args)
        {
            string palindrome;
            Console.WriteLine("Enter your palindrome");
            palindrome = Console.ReadLine();

            char[] forwardString = palindrome.ToCharArray();
            //char[] backwardString; //= Array.Reverse(forwardString);
            
        
            for (int i = 0; i < forwardString.Length; i++)
            {
                i = forwardString[i]; //traverse array of strings entered
                //print string entered
                Console.WriteLine("You entered: " + i );//print string entered
               
                for (int j = forwardString.Length; j > 0; j--)
                {
                    j = forwardString[j];
                    if (i.CompareTo(j) == 0)
                    {
                        Console.WriteLine("This is a palindrome!");

                    }
                    else
                    {
                        Console.WriteLine("This is no palindrome!");
                    }

                }
            }
        }
    }
}
        
    


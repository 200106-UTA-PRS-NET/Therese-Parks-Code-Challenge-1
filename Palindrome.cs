using System;

namespace PalindromeLib
{
    /*library should have a class that can tell me whether a string is a palindrome or not.
    all the behavior of the class should be unit tested.*/

    // a palindrome reads the same forwards and backwards.these should be considered palindromes:
    //"nurses run"
    //"racecaR"
    //"1221"
    //"never odd, or even."

    //these should not be considered palindromes:
    //"one two one"
    //"123abccba123"*/

    // Class that can tell whether code entered ins a palindrome or not
    // Behavior will be unit tested

    public class Palindrome
    {
        public static bool IsPalindrome(string text)
        {
            if (text.Length <= 1)
                return true;
            else
            {
                if (text[0] != text[text.Length - 1])
                    return false;
                else
                    return IsPalindrome(text.Substring(1, text.Length - 2));
            }
        }
        static void Main(string[] args)
        {
            string string1, rev;
            string1 =  "Malayalam";
           // string1 = Console.ReadLine();
            char[] ch = string1.ToCharArray();

            Array.Reverse(ch);
            rev = new string(ch);

            bool b = string1.Equals(rev, StringComparison.OrdinalIgnoreCase);
            if(b == true)
            {
                Console.WriteLine("{string1} is  a palindrome");

            }
            else
            {
                Console.WriteLine("{string1} is not a palindrome");

            }

            Console.Read();
        }
    }
}

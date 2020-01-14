using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PalindromeLib;
namespace UnitTestPalindrome
{
    [TestClass]
    public class PalindromeTest
    {
        [TestMethod] 
        //Each test method that you want Test 
        //Explorer to recognize must have the 
        //[TestMethod] attribute.
        public void TestMethod1() { 
            string string1, rev;
            string1 = "racecaR";
           // string1 = Console.ReadLine();
            char[] ch = string1.ToCharArray();

            Array.Reverse(ch);
            rev = new string (ch);

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

import java.io.*;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.lang.*;
import java.util.StringTokenizer;
import java.lang.Math;
public class main {

    public static void main(String[] args) throws IOException 
    {
        String contents = new String(Files.readAllBytes(Paths.get("KJV.txt")));
       
        String text = getRidOfNumbers(contents);
        int sentCount = countSent(text);
        String noDelims = getRidOfDelims(text);
        String lowerc = noDelims.toLowerCase();
        int wordCount = countWord(lowerc);
        int syllableCount = countSyllables(lowerc);
        double a = (double)syllableCount/(double)wordCount;
        double b = (double)wordCount/(double)sentCount;
        System.out.println("a = " + a);
        System.out.println("b = " + b);
        double index = 206.835 - (a*84.6) - (b*1.015);
        double grade = (a*11.8) + (b*0.39) - 15.59;
        System.out.println("The grade is: " + grade);
        System.out.println("The index is: " + index);
        System.out.println("The number of sentences is " + sentCount);
        System.out.println("The number of words is " + wordCount);
        System.out.println("The number of syllables is " + syllableCount);
    }

//Method that deletes the digits in a string and returns the string
    public static String getRidOfNumbers(String s)
    {
        String contents = s;
        ArrayList<Character> sc = new ArrayList<Character>();
        for(int i = 0;i < contents.length(); i++)
        {
            sc.add(contents.charAt(i));

        }

        ArrayList<Character> nn = new ArrayList<Character>();
        for(int j = 0; j < sc.size(); j++)
        {
            if(!Character.isDigit(sc.get(j)))
            {
                nn.add(sc.get(j));
            }

        }

        for(int k = 0; k < nn.size(); k++)
        {
            if(nn.get(k) == ' ' && nn.get(k+1) == ' ')
            {
                nn.remove(k);
                
            }
        }
        StringBuilder builder = new StringBuilder(nn.size());
        for(Character ch: nn)
        {
            builder.append(ch);
        }
        String fin = builder.toString();
        return fin;
    }

//Method that counts and returns the number of sentences in a string
    public static int countSent (String s)
    {   
        String str = s;
        int count = 0;
        String delims = "?.;:!";

        for (int i = 0; i < str.length(); i++)
        {   
            if (delims.indexOf(str.charAt(i)) != -1)
            {
                count++;

            }
        }

        return count;
    }
    
//Method that deletes Delims from a string
    public static String getRidOfDelims(String s)
    {
        String str = s;
        String str1 = s.replaceAll("[;:?!.]", "");

        return str1;
    }

//Method that counts and returns the number of words in a string
    public static int countWord(String s)
    {
        String str = s;
        int wc = 0;
        String d = " \n";
        for(int i = 0; i < str.length(); i++)
        {
            if(d.indexOf(str.charAt(i)) != -1)
            {
                wc++;
            }
        }

        return wc;
    }

//Method that returns true when the character is a vowel
    public static boolean isVowel(char c)
    {
        char ch = c;
        if(ch=='a'||ch=='e'||ch=='i'||ch=='o'||ch=='u'||ch=='y'||ch=='A'||ch=='E'||ch=='I'||ch=='O'||ch=='U'||ch=='Y')
        {
            return true;
        }
        else
        {
            return false;
        }
    }

//Method that returns true if there is only 1 vowel in the string
    public static boolean onlyVowel(String s)
    {
        String str = s;
        int vc = 0;
        for(int i = 0; i < str.length()-1; i++)
        {
            if(isVowel(str.charAt(i)))
            {
                vc++;
            }
        }
        if(vc <= 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

//Method that counts and returns the syllable count
    public static int countSyllables(String s)
    {
        String str = s;
        int sc = 0;
        StringTokenizer st = new StringTokenizer(str);
        while(st.hasMoreTokens())
        {
            String token = st.nextToken();
            for(int i = 0; i < token.length(); i++)
            {
                if(isVowel(token.charAt(i)))
                {
                    if(token.charAt(i) == 'e' && i+1 == token.length() && onlyVowel(token) == false)
                    {
                        sc = sc - 1;
                    }
                    if(i+1 != token.length())
                    {
                        if(isVowel(token.charAt(i+1)))
                        {
                            sc = sc - 1;
                        }
                    }
                    sc++;
                }
            }
        }
        return sc;
    }
}







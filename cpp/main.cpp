#include <iostream>
using namespace std;

i
int main(int argc, char* argv[])
{
    char c;
    string str;
    int words = 0;
    int syllables = 0;
    int sentences = 0;

    ifstrem infile;
    infile.open(argv[1]);
    while(not(infile.eof()))
    {
        infile.get(str);
        words = words + wordCount(& str);
        syllables = syllables + syllableCount(& str);
        sentences = sentences + sentenceCount(c);
    }

    return 0;
}

//to check if a string is a numeric char
bool isNumber(string *s)
{
    bool num;
    int digits = 0;
    string temp = *s;
    char x [temp.length()];
    strcpy(x, temp.c_str());
    for(int i = 0; i < x.size(); i++)
    {
        if(isdigit(x[i]))
        {
             digits++;
        }
    
    }
    if(temp.length() == digits)
    {
        num = true;
    }
    else
    {
        num = false;
    } 
    
    return num;
}

int wordCount(string & str)
{
    string add = & str; //add holds address of str
    string s = * add;   //s holds the string at add
    int words = 0;
    
    if(isNumber( & add) == true)
    {
         //move over to next word
         
    }
    else
    {
        words++;
        //get next word

    }
    return words;
}

int FindWordCount(file)
{
    int wordcount = 0;
    //while file input
    //get word from file using .find(either a space or sentence marker) lab4 or Lab2
    //assign the string to a variable   
    if(sentencemarker)
    {
        sentencecount++;
    
    }
    
    //break word up into chars to check if all chars are numbers or chars or mix
    if(isNumber(word) == true)
    {
        //move to next word

    }
    else 
    {
        wordcount++;
        //add to a master list of some sort

    }
    
    return wordcount;

}

bool isVowel(char & c)
{
    bool isvowel;
    char v = tolower(c);
    if(v != 'a' || 'e' || 'i' || 'o' || 'u' || 'y')
    {
        isvowel = false;
    }
    else
    {
        isvowel = true;
    }
    
    return isvowel;
}

int syllableCount(string & str)
{
    string ad = & str;
    string t = * add;
    if(t.back() == 'e') //if e is the last char remove it from the string
    {
        t.pop_back();
    }
    char w [t.length()];
    strcpy(w, t.c_str());
    for(int i = 0; i < w.size(); i++)
    {
        if(isVowel(w[i]) == true)
        {
            if(w[i] == 'e')
            {
                if(t.//check for last letter in word (space or sentence marker)
                
                //T -> check that the syllable count has at least 1 (F add 1)
                //F -> keep going

            }
            if(isVowel(w[i+1]) == true)
            {
                syllablecount++;
                //move pointer to skip adajcent vowel
                //adjust word length 

            }
            else
            {
                syllablecount++;
                //move pointer to next letter

            }
        }
    }
}












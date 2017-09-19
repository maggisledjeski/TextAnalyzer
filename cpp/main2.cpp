#include <iostream>
#include <cstdlib>
#include <fstream>

bool isVowel(char *);
bool isSentMarker(char *);
int sentCount(char *);
int syllableCount(char *);
int wordCount(char *);

using namespace std;


int main(int argc, char * argv[])
{
    char c;
    int sentences = 0;
    int syllables = 0;
    int words = 0;
    
    ifstream infile;
    infile.open(argv[1]);
    while(!(infile.eof))
    {
        infile.get(c);
       
        sentences = sentences + sentCount(c);
        syllables = syllables + syllableCount(c);
        words = words + wordCount(c);

    }

    
}

bool isVowel(char * c)
{
    bool vowel;
    char x = tolower(*c);
    if(x != 'a' ||x != 'e' ||x != 'i' ||x != 'o' ||x != 'u' ||x != 'y')
    {
        vowel = false;
    }
    else
    {
        vowel = true;
    }
    return vowel;
}

bool isSentMarker(char * c)
{
    bool marker;
    if(*c == '.' ||*c == '!' ||*c == '?' ||*c == ';' ||*c == ':')
    {
        marker = true;
    }
    else
    {
        marker = false;
    }
    return marker;
}

int sentCount(char *char1)
{
    int sentences = 0;
    while(*char1 != '\0')
    {
        if(isSentMarker(*char1) == true)
        {
            sentences++;
            char1++;
        }
        else
        {
            char1++;
        }
    }
    return sentences;
}

int syllableCount(char *char2)
{
    int syllables = 0;
    while(*char2 != '\0')
    {
        if(isVowel(*char2) == true)
        {


int wordCount(char *char3)
{
    int words = 0;
    while(*char3 != '\0')
    {
        



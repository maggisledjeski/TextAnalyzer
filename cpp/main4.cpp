#include <iostream>
#include <string>
#include <fstream>
#include <vector>
using namespace std;

int countSent(string & line);
string removeDelims(string & line);
string removeNumbers(string & line);
int countWords(string & line);
bool isVowel(char & c);
bool isOnlyVowel(string & line);
int countSyllables(string & line);

int main(int argc, char* argv[])
{
    char c;
    string str;
    int words = 0;
    int syllables = 0;
    int sentences = 0;
    string nn;
    int n;
    ifstream file;
    string line;
    file.open("KJV.txt");
    while (getline (file, line))
    {
        sentences = sentences + countSent(line);
        nn = removeNumbers(line);
        nn = removeDelims(nn);
        words = words + countWords(nn);
        syllables = syllables + countSyllables(nn); 
    }
    
    double a = (double)syllables/(double)words;
    double b = (double)words/(double)sentences;
    cout << "a = " << a << endl;
    cout << "b = " <<  b << endl;
    double index = 206.835 - (a*84.6) - (b*1.015);
    cout << "The index is: " << index << endl;
    cout << "The number of sentences are: " << sentences << endl;
    cout << "The number of words are: " << words << endl;
    cout << "The number of syllables are: " << syllables << endl;
    return 0;
}

int countSent(string & line)
{
    string str = line;
    int sc = 0;
    for(int i = 0; i < str.length(); i++)
    {
        if(str[i] == '.' || str[i] == ';' || str[i] == ':' || str[i] == '!' || str[i] == '?')
        {
            sc++;
        }
    }
    
    return sc;
}

string removeDelims(string & line)
{
    string str = line;
    for(string::iterator begin = str.begin(), end = str.end(); begin != end;)
    {
        if(ispunct(*begin))
        {
            begin = str.erase(begin);
        }
        else
        {
             ++begin;
        }
    }
    return str;
}

string removeNumbers(string & line)
{
    string str = line;
    for(string::iterator begin = str.begin(), end = str.end(); begin != end;)
    {
        if(isdigit(*begin))
        {
            begin = str.erase(begin);     
        }
        else
        {
            ++begin;
       }
    }    
    return str;
}

int countWords(string & line)
{
    string str = line;
    bool inSpaces = true;
    int wc = 0;
    for(int i = 0; i < str.length(); ++i)
    {
       if (isspace(str[i]))
       {
          inSpaces = true;
       }
       else if (inSpaces)
       {
          wc++;
          inSpaces = false;
       }

    
    }
    return wc;
}

bool isVowel(char & c)
{
    bool isV = false;
    char letter = tolower(c);
    if(letter == 'a' || letter == 'e' || letter == 'i' || letter == 'o' || letter == 'u' || letter == 'y')
    {
        isV = true;
    }
    return isV;
}

bool isOnlyVowel(string & line)
{
    string str = line;
    int vc = 0;
    for(int i = 0; i < str.length(); i++)
    {
        if(isVowel(str[i]))
        {
            vc++;
        }
    }
    if(vc == 1)
    {
        return true;
    }
    else
    {
        return false;
    }
}
int countSyllables(string & line)
{
    string str = line;
    int vc = 0;
    vector <string> words;
    int i = 0;
    int s = 0;
    while(i != str.size())
    {
        while(i != str.size() && isspace(str[i]))
        {
            i++;
        }
        s = i;
        while(s != str.size() && !isspace(str[s]))
        {
            s++;
        }
        if(i != s)
        {
            words.push_back(str.substr(i,s-i));
            i = s;
        }
    }
    for(int c = 0; c < words.size(); c++)
    {
        string word = words[c];
        for(int j = 0; j < word.length(); j++)
        {
            if(isVowel(word[j]))
            {
                vc++;
                if(isVowel(word[j+1]))
                {
                    vc--;
                }
            }
        }
        if(word.back() == 'e')
        {
            if(!isOnlyVowel(word))
            {
                vc--;
            }
        }
//    cout << word << ": " << vc << endl;    
    }
    return vc;  
}


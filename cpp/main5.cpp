#include <iostream>
#include <string>
#include <fstream>


using namespace std;

int countSent(string & line);
//string removeDelims(string & line);
//string removeNumbers(string & line);
//int countWords(string & line);
//int countSyllables(string & line);

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
    file.open("textfile.txt");
    while (getline (file, line))
    {
    //send line to a method which countsthe sentences etc.
        sentences = sentences + countSent(line);
//        nn = removeNumbers(line);
//        nn = removeDelims(nn);
    }
    cout << "The number of sentences are: " << sentences << endl;
//    cout << "The number of words are: " << words << endl;
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


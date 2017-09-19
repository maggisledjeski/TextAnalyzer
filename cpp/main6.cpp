#include <iostream>
#include <string>
#include <fstream>
using namespace std;

int countSent(const string & line);

int maint(int arg, char* argv[])
{
    int sentences = 0;
    ifstream file;
    string line;
    file.open("textfile.txt");
    while(getline(file,line))
    {
        sentences = sentences + countSent(line);
    
    }
    cout << "The number of sentences are: " << sentences << endl;
    
    return 0;
}

int countSent(const string & line)
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

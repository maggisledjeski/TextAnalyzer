#include <iostream>
#include <string>
#include <fstream>
using namespace std;


int main(int argc, char* argv[])
{

char c;
    string str;
    int words = 0;
    int syllables = 0;
    int sentences = 0;
    string nn;
    ifstream file;
    string line;
    file.open("textfile.txt");
    while (getline (file, line))
    {
        //send line to a method which countsthe sentences etc.
        //        sentences = sentences + countSent(line);
        //                nn = removeNumbers(line);
        //                        nn = removeDelims(nn);
        //                                //cout << line << '!' << endl;
        //                                    }
        //                                        cout << nn << endl;
        //                                            cout << "The number of sentences are: " << sentences << endl;
        //                                                return 0;
        //                                                }
        //
        //                                                int countSent(string & line)
        //                                                {
        //                                                    string str = line;
        //                                                        int sc = 0;
        //                                                            for(int i = 0; i < str.length(); i++)
        //                                                                {
        //                                                                        if(str[i] == '.' || str[i] == ';' || str[i] == ':' || str[i] == '!' || str[i] == '?')
        //                                                                                {
        //                                                                                            sc++;
        //                                                                                                    }
        //                                                                                                        }
        //
        //                                                                                                            return sc;
        //                                                                                                            }
        //



//    ifstrem infile;
//    infile.open(argv[1]);
//    while(not(infile.eof()))
//    {
//        infile.get(str);
//        words = words + wordCount(& str);
//        syllables = syllables + syllableCount(& str);
//        sentences = sentences + sentenceCount(c);
//    }

    

//string line;
//while(getline(file, line))
//
//{
//    istringstream iss(line);
//    string token;
//    while (iss >> token)


//    {
    

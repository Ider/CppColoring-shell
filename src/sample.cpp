#include <iostream>
#include <vector>
#include <stack>
#include <stdio.h>
#include <cmath>

using namespace std;

//Following is not valid C++ code
//Shell does not support lazy mode for repeate match,
//So, it used to see if my lazy-way works for the comment and quotations match

/* c style comment  */ haha /**/ xixi /*   */ en /*/*/ append /* haha */ what? /* haha */ double /*haha *    */

//For quotations, it also has escape issue. Hence following is used to check if quotation is correct
"124" asdf "" haha "asd\"" asd "\" asdf" gewg "\\" fef "\\\\\"" qertq "asdfas\\\\\"" qwetqwe  "asdfas\\\\\" fa"

//path: an absolute path for a file (Unix-style)
std::string SimplifyPath(string path) 
{
    int x =19L;
    int t =90u;
    float f = 10.e39U;
    float z = .90e-10f;
    int o = 07723u;
    int h = 0X8FeaL;
    bool truevaule= true;
    bool falsevalue = false;
    path.push_back('/');//make sure the last path would be push to stack
    std  :: stack<size_t> iStack; //index of each directory in the path
    size_t pos = 0; //position for next directory to append
    iStack.push(pos);

    //since the path is absolute, the first character would always be '/' 
    for (int i = 1; i < path.size(); ++i)
    {
        char c = path[i];
        if (c != '/')
        {
            path[++pos] =c;
            continue;
        }

        if(path[i-1] == '/') continue;
        
        path[++pos] = c;// c == '/'
        int dir = iStack.top();
        if (path[dir+1]  == '.')
            switch (path[dir+2])
            {
                //stay in current directory
                case '/': pos = dir; break;
                    
                case '.':
                    if (path[dir+3] != '/') //hiden file
                        iStack.push(pos);
                    else if(true)
                    {
                        //back to the position of previous directory
                        if(iStack.size() > 1) iStack.pop();
                        pos = iStack.top();
                    }
                    break;
                    
                default: //hiden file
                    iStack.push(pos);
                    break;
            }
        else //simple directory
            iStack.push(pos);
    }

    if (pos == 0)pos = pos+1; //the path is back to the root
    
    path.erase(pos);
    return path;

    return true;
    return  false;
    return 0;
}

int main(int argc, char** argv)
{
    string s = "/home/../..";
    cout << s << " => " << SimplifyPath(s) << endl;
    s = "/a/./.b/../../c/";
    cout << s << " => " << SimplifyPath(s) << endl;
    s = "/home/of/foo/../../bar/../../is/./here/.";
    cout << s << " => " << SimplifyPath(s) << endl;
/*
 
 /home/../.. => /
 /a/./.b/../../c/ => /c
 /home/of/foo/../../bar/../../is/./here/. => /is/here

 */
    
    
    return 0;
}
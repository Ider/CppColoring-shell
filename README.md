#Regular Expression based C++ Syntax Highlight
---

I love coding in C++, and I'd like to write articles about C++. So I would post many C++ codes on [my blogs](http://www.cnblogs.com/ider). 

Many blogs like wordpress support programming language coloring, however most of them do not support what I want to have.   
They may set color with style directly, so it is not easy to change the style. They only highlight several elements e.g. keyword.

So I begin this project to make C++ Syntax highlight coloring under my requirements.


This is **shell script** version of the C++ coloring.   
After I learned shell script, [**awk**](https://developer.apple.com/library/mac/#documentation/Darwin/Reference/Manpages/man1/awk.1.html) and [**sed**](https://developer.apple.com/library/mac/#documentation/Darwin/Reference/Manpages/man1/sed.1.html) command, I find it is much better than Javascript to coloring the C++ files to with HTML tags and CSS properties.   

It's easier to manage regex pattern and substitution. And much easier to manipulate multipe files.

##Highlighted Part

* Quotation
	> Or on other word: string.
	  
* Comment
	> C style (in /\* \*/ block)   
	> C++ Style (begin with //)

* Preprocessor Directives
	> The line begin with # and first word after #

* Keyword
	> [C++ keyword list](http://en.cppreference.com/w/cpp/keyword)   
	> Not all matched has keyword, I treat some as Built-in type and boolean value

* Built-in Number Type
	> signed, unsigned   
	> int, long, long long   
	> float, double

* Standard Libary
	> C++ standard libary: string, io stream, container   
	> C standard libary, begin with c, e.g. &lt;cmath&gt;; or end with .h e.g., &lt;stdio.h&gt;

* Right Value

	* Number   
	> Hexadecimal format   
	> Exponential format   
	> Suffix for number: U, L, LL, F 

	* Boolean   
	> true, false

	* Character   
	> Character inside of ''  
	> Escape character   
	> Presented in hexadecimal value
		
		
##CSS Trick

Each Highlighted part would be set with associated class name, the properites of CSS is set in css file.   
Because the utility would match part that inside other part, e.g. any string in comments would also be matched as string.   
So I used CSS trick: [child selectors ( > )](http://www.w3.org/TR/CSS2/selector.html#child-selectors). It would only hgihtlight the direct child of code tag. Hence it ignore the part which is inside of other part.

##Development Enviroment

Opearting System: Mac OS X 10.7.3   
Shell: bash 2.3   
Regular Expression: Extended Pattern Matching   
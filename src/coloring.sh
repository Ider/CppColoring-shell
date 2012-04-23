#!/bin/bash


#resource files
sedfile="coloring.sed"
regexfile="cpp.regex"
htmlencode="htmlencode.sed"



tmpfile[0]=".encoded$" #encoded temp file
tmpfile[1]=".body$"
#tmpfile[2]=".html$"

file="sample.cpp"
filename=${file%.*} #remove file extension
htmlfile=$filename".html"

header="<html>
    <head>
        <title>$(echo $filename | sed -E -n '{s/([^ ])([A-Z])/\1 \2/g; p;}') - Ider</title>"'
        <meta name="keywords" content="C, C++, algorithm" >
        <meta name="author" content="Ider Zheng" >
        <meta name="email" content="ider.cs@gmail.com" >
        <link rel="stylesheet" type="text/css" href="codestyle.css">
    </head>
    <body>
     
    <div><pre><code>'

bottom='</code>
            </pre>
        </div>
    <div>
        <a class="link_text" href="'$filename'.cpp">View Program Text</a>
        <br/>
        <br/>
        <br/>
        <img class="test_status" src="'$filename'.jpg" alt="Test Status">
    </div>
    </body>
</html>'

#htmlencode
sed -n -E -f $htmlencode sample.cpp | cat > ${tmpfile[0]}

#create sed substitution actions
awk -f coloring.awk -v s=$sedfile -v r=$regexfile ${tmpfile[0]} > ${tmpfile[1]};

#append header
echo $header > $htmlfile;
#append content
sed -n -E -f $sedfile ${tmpfile[1]} >> $htmlfile
#append bottom
echo $bottom >> $htmlfile

#remove all temp files
rm ${tmpfile[@]}

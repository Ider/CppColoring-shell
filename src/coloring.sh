#!/bin/bash

if [[ -z $1 ]]; then
    echo "No files specified, please pass file as parameter." >&2
    exit
fi

#resource files
sedfile="coloring.sed"
regexfile="cpp.regex"
htmlencode="htmlencode.sed"

function LineNumbers()
{
    for i in `seq 1 $1`; do
        echo '<span id="line_'$i'" class="line_number">'$i'</span>'
    done
}

tmpfile[0]=".encoded$"  #encoded temp file
tmpfile[1]=".body$"     #preprocessed body
#tmpfile[2]=".html$"

hastmp=0
directory=${1%/*}

if [[ $directory = $1 ]]; then
    directory=""
else
    directory=$directory"/"
fi

files=$(ls $1)

for file in $files; do
    
    file=${file##*/} #remove path info
    filename=${file%.*} #remove file extension
    file=$directory$file #concatenate file with directory

if [[ -f $file ]]; then


htmlfile=$directory$filename".html"


header="<html>
    <head>
        <title>$(echo $filename | sed -E -n '{s/([^ ])([A-Z])/\1 \2/g; p;}') - Ider</title>"'
        <meta name="keywords" content="C, C++, algorithm" >
        <meta name="author" content="Ider Zheng" >
        <meta name="email" content="ider.cs@gmail.com" >
        <link rel="stylesheet" type="text/css" href="codestyle.css">
    </head>
    <body>'

bottom='</tr></table>
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
sed -n -E -f $htmlencode $file | cat > ${tmpfile[0]}

#create sed substitution actions
awk -f coloring.awk -v s=$sedfile -v r=$regexfile ${tmpfile[0]} > ${tmpfile[1]}

#append header
echo $header > $htmlfile

echo '<div class="codes"><table><tr><td><div class="line_numbers"><pre><code>' >> $htmlfile
#append line numbers
#wc count the number of newline mark, so add 1 to be real line number
LineNumbers $((`wc -l < $file` + 1)) >> $htmlfile

echo '</code></pre></div></td><td width="100%"><div class="code_content"><pre><code>' >> $htmlfile
#append content
sed -n -E -f $sedfile ${tmpfile[1]} >> $htmlfile

echo '</code></pre></div></td></tr></table></div>' >> $htmlfile

#append bottom
echo $bottom >> $htmlfile

echo "Done coloring for: "$file;
hastmp=1
    
fi
    
done

#remove all temp files
if [[ $hastmp > 0 ]]; then
    rm ${tmpfile[@]}
fi


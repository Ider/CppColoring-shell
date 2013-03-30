#This awk program file is used to generate sed substitution commands

BEGIN{
    #r = regex file that read from
    #s = sed file that output to

    if(r == ""){
        system("echo  Regex file is not specified. Please use \\\"-v r={filename}\\\"" \
            " option to set file that regex patterns read from. >&2");
        exit;
    }

    if(s== ""){
        system("echo  Sed file is not specified. Please use \\\"-v s={filename}\\\"" \
            " option to set file that sed actions write to. >&2");
        exit;
    }

    #Load patterns
    FS=" {2,}| *\t[ \t]*";
    patternSize=0;
    while(getline < r > 0){
        #ignore comments and empty lines
        if ($0 ~ /^[ \t]*(#|$)/) continue;

        gsub(/\//, "\\/", $1);
        gsub(/\//, "\\/", $2);
        print "s/"$1"/"$2"/g" > s;
        patternSize=1;
    }

    # print "s/<br \\/>/<\\/span><span class=\"code\">/" > s;
    # print "s/^/<span class=\"code\">/" > s;
    # print "s/$/<\\/span>/" > s;

    #output function
    print "p" > s;

    close(r);
    close(s);

    if(patternSize <= 0){
        system("echo No pattern loaded, please use other file >&2")
        exit;
    }

    FS="[ \t]+"

    #exit;
} #end of BEGIN


#When match c style comments, concatenate multiple lines to one line
/\/\*/{
    while($0 !~ /\*\//)
    {
        printf $0;
        printf "<br />" 
        
        getline $0;
    }
}

#When match multiple line indicator, concatenate multiple lines to one line
/\\[ \t]*$/{
    while($0 ~ /\\[ \t]*$/)
    {
        printf $0;
        printf "<br />" 
        
        getline $0;
    }
}

{ print $0;}


END{

}

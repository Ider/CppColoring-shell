#This awk program file is used to generate sed substitution commands

BEGIN{
    regexfile="cpp.regex";
    sedfile="-";

    if(regexfile == ""){
        system("echo Please use \"-v regexfile={filename}\" option \to set regexfile variable >&2");
        exit;
    }

    #Load patterns
    FS=" {2,}| *\t[ \t]*";
    patternSize=0;
    while(getline < regexfile > 0){
        #ignore comments and empty lines
        if ($0 ~ /^[ \t]*(#|$)/) continue;

        gsub(/\//, "\\/", $1);
        gsub(/\//, "\\/", $2);
        print "s/"$1"/"$2"/g";
        patternSize=1;
    }
    #output function
    print "p";

    close(regexfile);
    close(sedtmpfile);

    if(patternSize <= 0){
        system("echo No pattern loaded, please use other file >&2")
        exit;
    }

    FS="[ \t]+"

    exit;
} #end of BEGIN


#When match c style comments, make multiple lines to one line
/\/\*/{
    while($0 !~ /\*\//)
    {
        printf $0;
        printf "<br />" 
        
        getline $0;
    }
}

#When match multiple line indicator, make multiple lines to one line
/\\[ \t]*$/{
    while($0 ~ /\\[ \t]*$/)
    {
        printf $0;
        printf "<br />" 
        
        getline $0;
    }
}

{ print $0;}

#!/bin/bash

#htmlencode

sed -n -E -f htmlencode.sed sample.cpp | cat > b

awk -f coloring.awk  > _sedtmp;
sed -n -E -f _sedtmp -i "" b




cat h b t > sample.html
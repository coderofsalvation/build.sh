#!/bin/bash

sourceToMarkdown(){
	:>"$2"	
	grep '*' "$1" | sed 's/\/\*/\#\#/g;s/^ \* //g;s/\*\///g;s/\*//g;s/# _/# \\_/g' >> "$2"
}

build(){
  test -d dist || mkdir dist
	grep "script src" index.html | sed 's|.*src="||g;s|".*||g' \
                 | grep -v nobundle                          \
								 | xargs cat                                 \
	   						 | sed -e '$a\'            > dist/build.js 
	cat index.html | grep -v nobundle | sed 's|.*<script src.*||g'                    > dist/index.html
	sed -i 's|</head>|<script type="text/javascript" src="build.js"></script></head>|g' dist/index.html
	sourceToMarkdown js/*.js reference.md 
}


echo building
time build

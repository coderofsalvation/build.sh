#!/bin/bash

build(){
  test -d dist || mkdir dist
  grep "script src" index.html | sed 's|.*src="||g;s|".*||g' \
                 | grep -v nobundle                          \
                 | xargs cat                                 \
                 | sed -e '$a\'            > dist/build.js 
  cat index.html | grep -v nobundle | sed 's|.*<script src.*||g'                    > dist/index.html
  sed -i 's|</head>|<script type="text/javascript" src="build.js"></script></head>|g' dist/index.html
}


echo building
time build

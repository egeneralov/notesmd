#!/bin/bash

dpkg-query -l markdown > /dev/null || apt-get install markdown #must have
clear; dir=`pwd`; echo "Static blog site generator for md files"; #init
rm $dir/html/*.html > /dev/null 2>&1; rm $dir/html/blog/*.html > /dev/null 2>&1; ##clear current html state
mkdir -p $dir/html/blog;mkdir -p $dir/blog; #check dir`s
ls ~/mynotes || ln -s $dir/blog ~/mynotes; # fast link check

echo "Old HTML removed";

## Starting blog generator

for file in `ls $dir/blog`; do
	echo "Generating blog/$file"; # Notify current file name
	name=`cat $dir"/blog/$file" | head -n 1 | sed 's/\# //g'`; # getting note name
	alias=`cat $dir"/blog/$file" | head -n 1 | sed 's/\# //g' | sed 's/ /_/g' | awk '{print tolower($0)}'`
	markdown $dir/blog/$file > $dir/html/blog/$alias.html; # generating html from note
	echo "<a class=\"menu\" href=\"/blog/$alias\">$name<\/a>" >> "$dir/menu.html"; # adding menu

done

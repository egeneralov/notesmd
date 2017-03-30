#!/bin/bash
	## Must have markdown deb packet installed in system

#echo "Static site generator for md files;"
echo ""
dir=`pwd`;


for file in `ls $dir/blog`; do
	# Notify file name
	echo "Generating blog/$file";

    # Getting name of note
	name=`cat $dir"/blog/$file" | head -n 1 | sed 's/\# //g'`
	echo "	Name: $name"
	alias=`cat $dir"/blog/$file" | head -n 1 | sed 's/\# //g' | sed 's/ /_/g' | awk '{print tolower($0)}'`
	echo "	Alias: $alias"


    # Generating html from file
	markdown $dir/blog/$file > $dir/html/blog/$alias.html
    # Adding to menu
	echo "<a href=\"/blog/$alias\">$name<\/a>"

done

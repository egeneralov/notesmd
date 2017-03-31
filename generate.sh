#!/bin/bash

dpkg-query -l markdown > /dev/null || apt-get install markdown #must have
dir=`pwd`; echo "NotesMD - Static blog site generator for md files"; #init
rm $dir/html/*.html > /dev/null 2>&1; rm $dir/html/blog/*.html > /dev/null 2>&1; ##clear current html state
mkdir -p $dir/html/blog;mkdir -p $dir/blog;mkdir -p $dir/html/images; #check dir`s
#ls ~/mynotes > /dev/null 2>&1 || ln -s $dir/blog ~/mynotes; # fast link - if you need
echo "Old HTML removed"; # notify
echo '' > $dir/menu.html; echo '' > $dir/html/index.html; cat $dir/header.html > $dir/html/index.html; # clear
cat $dir/header.html > "$dir/html/index.html"; # rewrite index.html

for file in `ls $dir/blog`; do
	echo "Generating blog/$file"; # Notify current file name
	name=`cat $dir"/blog/$file" | head -n 1 | sed 's/\# //g'`; # getting note name
	description=`cat $dir"/blog/$file" | head -n 2 | tail -n 1 | sed 's/#//g'`; # getting note description
	alias=`cat $dir"/blog/$file" | head -n 1 | sed 's/\# //g' | sed 's/ /_/g' | awk '{print tolower($0)}'` #get alias
	cat "$dir/header.html" > "$dir/html/blog/$alias.html"; # write header
cat <<< '      </header>
      <section>' >> $dir/html/blog/$alias.html # close head
	markdown $dir/blog/$file >> "$dir/html/blog/$alias.html"; # generating html from note
        cat "$dir/footer.html" >> "$dir/html/blog/$alias.html"; # write footer
	echo "<p class="view"><a href=\"blog/$alias.html\">$name<small>$description</small></a></p>" >> "$dir/menu.html"; # adding menu
done

cat <<< '      </header>
      <section>' >> $dir/html/index.html

markdown "$dir/README.md" >> "$dir/html/index.html";

cat "$dir/menu.html" >> $dir/html/index.html

#markdown "$dir/README.md" >> "$dir/html/index.html";

cat "$dir/footer.html" >> $dir/html/index.html


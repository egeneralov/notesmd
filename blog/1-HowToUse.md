# How to use
##### simple use and install

### Clone repository

	git clone https://github.com/egeneralov/notesmd.git
	cd notesmd

### Delete the my github pages site

	rm -rf docs

### Edit README.md

	This file will be **homepage**. 

#### *(optionaly)* - edit left.md

	This content will displayed in left menu on **all pages**.

### Edit *header.html*

	1. Change site name in <title>
	2. Change site name in <h1>
	3. Change site description in <p>

#### *(optionaly)* Edit *footer.html*

	1. change content in <footer>

### Delete sample content

	rm blog/*

### Write your own first post

	nano blog/`date +%d-%m-%Y`-MyFirstPost.md

*Please, dont use spaces and other special characters in file name.*

### Sample file names in folder **blog**

	1. mypost
	2. mypost.md
	3. my_new-post.md

### Generate your site

	root@nginx:~/notesmd# ./generate.sh
		NotesMD - Static blog site generator for md files
		Old HTML removed
		Generating blog/0-WhatIsIt.md
		Generating blog/1-HowToUse.md
		Generating blog/2-HowItWork.md
		Generating blog/3-ToDo.md

### Upload files

	scp -r ~/notesmd/html/* ssh@server.com:/patch/to/site/public_html

# You blog are ready!

Contact me on [GitHub](https://github.com/egeneralov) or write e-mail to **eduard@generalov.net**.

Glad to help you. 



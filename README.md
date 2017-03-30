# NotesMD - Notes Site from MD

## Dependences

apt-get install markdown

## Description

This is static blog generator from **.md** files. 

## How it work

1. Script get list of files of **./blog** folder
2. Purge **./html** folder
3. Putting content from **./header.html** file to **./html/index.html**
4. Generating menu
5. Generating blog and put it on folder **./html/blog/name.html**. In start of file putting content of **./header.html** and **./folder.html** to each file.
5. Writing **menu.html** to **./html/index.html**
6. Putting content from **./footer.html** to **./html/index.html**

## How to use

``./generate``

upload file to your site

## ToDo

0. Add git support
1. Add FTP support
2. Add ssh support
3. Add SFTP support
4. Add styles support - (it really need for someone?)
5. Add Author page
6. Add "send mail to author feature". *(I think use ajax for some temp mail services).*

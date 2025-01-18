# WGET 

## Para capturar todos os URLs de uma página:
	lynx -dump -listonly site.com > lista.txt


## Para baixar uma lista com todos os URLs a serem baixados:
	wget -i lista.txt
	


---

## How to Download an Entire Website Using Wget

To download a website with Wget, use the following command in a terminal, replacing example.com with the domain name of the site you want to download.

Warning: This command will download an entire website. Be respectful of how much bandwidth it might use when fetching a large number of pages.

`wget -m -k -K -E https://example.com`

After the command runs, you should see a directory with the name of your site. The files will be in there.

How the Command Works
The name of the command is wget. Each of the letters that begins with a dash is called a flag. Here’s what those specific flags do:

	-m — this turns on options that help Wget mirror the website.
	-k — this converts links within the pages so that they can be viewed locally.
	-K — this backs up the original downloaded files so that you have both the original files and the copies with the converted links. The original files will have .orig appended to the filenames.
	-E — this converts the file extensions of web pages to .html so that the files can be easily viewed in a browser.
	You can read more details about the options on Explain Shell.

There are additional settings that can be viewed by typing man wget in a terminal.

_Fonte: https://codingforseo.com/blog/download-website-wget/_


ver tb: 
https://codingforseo.com/blog/curl-for-web-development/


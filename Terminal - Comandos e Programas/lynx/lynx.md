# LYNX


## Extracting a List of Links from a Web Page

There’s a cleaner way to extract links with Lynx.

- The option --listonly will print out only the list of links.
- The option --nonumbers will print out the links without line numbers.
- The option --display_charset=utf-8 will get rid of weird characters in the output, if you run into problems with that.

Here’s an example command that combines all of those flags:

```bash

lynx --listonly \
    --nonumbers \
    --display_charset=utf-8 \
    --dump https://www.nytimes.com/

```



## Creating a Reusable Script

If you have a long terminal command that will be used often, you can create a reusable shell script function.

First, find your shell configuration file. It will often be called something like ~/.zshrc or ~/.bashrc. Paste this code in the bottom of that file:

``` bash

extract_links () {
    lynx --listonly \
    --nonumbers \
    --display_charset=utf-8 \
    --dump "$1" \
    | grep "^http" \
    | sort \
    | uniq
}

```

Then open a new terminal window and run the command like this:

`extract_links https://www.nytimes.com/` 


## Looping Over the URLs

Cria um script para verificar se um site tem algum link quebrado:

*verifica_links_no_site.sh*

```bash

#!/bin/bash

URLS=$(lynx \
    --listonly \
    --nonumbers \
    --display_charset=utf-8 \
    --dump "$1" \
    | grep "^http" \
    | sort \
    | uniq)

URLS_ARR=($URLS)

for URL in "${URLS_ARR[@]}"; do
    echo -e $(curl -o /dev/null -s -w "%{http_code}" "$URL") "\t$URL"
done

```


Em seguida, digite no Terminal:

`verifica_links_no_site.sh site.com.br`



Fontes: 
https://codingforseo.com/blog/extract-links-with-lynx/
https://codingforseo.com/blog/lynx-broken-link-checker/

https://codingforseo.com/blog/curl-for-web-development/
https://codingforseo.com/blog/download-website-wget/


---

ver tb:
https://commandmasters.com/commands/lynx-common/

```
	lynx -use_mouse example.com
	lynx -anonymous example.com
	lynx -color example.com
	lynx -cookie_file=path/to/file example.com

```

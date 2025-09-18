# wkhtmltopdf
Converte uma página web em um arquivo PDF:

Exemplo:
` wkhtmltopdf http://google.com google.pdf `

---

Em caso de arquivos HTML locais, para que o converta em PDF: 
` wkhtmltopdf --enable-local-file-access arq.html arq.pdf `

Fonte: https://stackoverflow.com/questions/62315246/wkhtmltopdf-0-12-6-warning-blocked-access-to-file#62315247




## Para instalar

- Vá até a página oficial do projeto: `https://wkhtmltopdf.org/downloads.html`
- Escolha e baixe a versão ideal para sua distribuição linux
- Rode o comando: `sudo dpkg -i wkhtmltox_0.12.6.1-2.bullseye_amd64.deb`


**Caso falte algua biblioteca, siga este procedimento abaixo:**

To install `libssl.so.1.1` on Debian, especially on newer versions like Debian 12 (Bookworm) where `libssl1.1` is no longer in the main repositories and has been replaced by `libssl3`, you have a few options: 

1\. Install from an older Debian release's repository (e.g., Bullseye): 

This is generally the recommended approach if you need `libssl1.1` for compatibility with specific software. You can add the Bullseye security repository to your `sources.list`. 

```
echo "deb http://security.debian.org/debian-security bullseye-security main" | sudo tee -a /etc/apt/sources.list.d/bullseye-security.listsudo apt updatesudo apt install libssl1.1
```

2\. Manually download and install the .deb package: 

You can download the `libssl1.1` package for your architecture from the Debian package archives (e.g., for Bullseye) and install it using `dpkg`. 

```
wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.1_1.1.1w-0+deb11u3_amd64.deb # Replace with the correct version and architecture if neededsudo dpkg -i libssl1.1_1.1.1w-0+deb11u3_amd64.deb
```

3\. Create a symbolic link (if `libssl.so.3` exists): 

If your system already has `libssl.so.3` (from OpenSSL 3), and the application requiring `libssl.so.1.1` is compatible with OpenSSL 3, you can create a symbolic link. This is a quick fix but might not work for all applications. 

```
cd /usr/lib/x86_64-linux-gnu # Or the appropriate directory for your architecturesudo ln -s libssl.so.3 libssl.so.1.1
```

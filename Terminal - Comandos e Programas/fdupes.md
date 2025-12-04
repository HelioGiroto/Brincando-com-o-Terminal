# FDUPES
(Finds Duplicate files)

A ferramenta **fdupes** é geralmente preferível por ser mais robusta e precisa do que um script manual para encontrar duplicatas reais. 
A maneira mais fácil e recomendada para buscar arquivos que tenham um mesmo tamanho é usar uma ferramenta projetada especificamente para essa tarefa, como o `fdupes`. 

Ele compara não apenas o tamanho, mas também as assinaturas MD5 e, finalmente, faz uma comparação byte a byte para garantir que os arquivos sejam de fato idênticos (não apenas tenham o mesmo tamanho). 

Instalação (exemplos):

    Debian/Ubuntu: `sudo apt install fdupes`
    Fedora: `sudo dnf install fdupes`
    Arch Linux: `sudo pacman -S fdupes` 


Comando básico:

```bash 
fdupes -S .
fdupes -rSd /caminho/do/diretorio
```

Opções úteis do fdupes:

    -r: Busca recursivamente em subdiretórios. 
    -S: Mostra o tamanho dos arquivos duplicados.
    -d: Permite deletar os arquivos duplicados interativamente (pedindo confirmação sobre qual manter)
    -N: Já decide preservar o primeiro arquivo e apagar os demais duplicados.


Ver tb comandos: `cmp` e `comm` e `diff`.





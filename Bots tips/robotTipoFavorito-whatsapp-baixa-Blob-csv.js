// robotTipoFavorito.js
// Script que obtem todos os contatos que aparecem da pesquisa que se faz no Whatsapp e faz download

// Para rodar no Web Whatsapp - Navegador
// Executável como código Javascript na linha de URL do navegador

// anteriormente se rodava este mesmoo script no Console do navegador.

// Autor: Helio Giroto
// Data: Terminado em 11/06/2024

// Abaixo todo o código desenvolvido e na última linha, o mesmo código que deve ser colado na barra de URL do navegador (a mesma onde está o URL www.web.whatsapp.com)


// Função para baixar como arquivo csv o conteúdo minerado:
function download(conteudo) {
	let nomearq = "filtrados.csv";
	let mimeType = "text/csv;charset=utf-8;";
	const a = document.createElement('a');
	const blob = new Blob([conteudo], {type: mimeType});
	const url = URL.createObjectURL(blob);
	a.setAttribute('href', url);
	a.setAttribute('download', nomearq);
	a.click();
};


// Função para minerar os resultados da pesquisa de contatos 
// faz scrollar a div em que saem tais resultados:
let anterior = -1;
let atual = 0;
let contatos = [];

while(atual > anterior){
	anterior = atual;		
	// let lista = document.querySelectorAll('div.g0rxnol2 > div > div > div._8nE1Y > div.y_sn4 > div._21S-L > div > span');
	let lista = document.querySelectorAll('div._ak8o > div > div > span');
	lista.forEach(a=>contatos.push(a.innerText));
	// console.log("Contatos sem filtro:", contatos.length);
	document.querySelector('#pane-side').scrollTop += 200;
	atual = document.querySelector('#pane-side').scrollTop;
	await new Promise(resolve => setTimeout(resolve, 2500)); 

};
let filtrados = [...new Set(contatos)].sort();
// await new Promise(resolve => setTimeout(resolve, 1500)); 

// anteriormente se copiava desde o console (onde se rodava este script):
copy(filtrados);
console.log('Terminado!', filtrados.length, "contatos filtrados.")

// Agora vai gerar um arquivo csv e baixá-lo:
// let lista = [1,2,3,4,5].join('\n');		// funciona tb 
filtrados.join('\n');
download(filtrados);


///////////

// Bookmarklets 

// 1. Abre o Web Whatsapp
// 2. No espaço da pesquisa coloque algum nro (2 digitos)
// 3. cola o seguinte código abaixo (acrescentar jvascript: ) no inicio do url.

// Código minificado (para ser colado na url do navegador na mesma janela onde está rodando o Web Whatspp):

javascript:void(async () =>{function download(conteudo) {let nomearq = 'filtrados.csv'; let mimeType = 'text/csv;charset=utf-8;'; const a = document.createElement('a'); const blob = new Blob([conteudo], {type: mimeType}); const url = URL.createObjectURL(blob); a.setAttribute('href', url); a.setAttribute('download', nomearq); a.click();} let anterior = -1;
let atual = 0; let contatos = []; while(atual > anterior){ anterior = atual; let lista = document.querySelectorAll('div._ak8o > div > div > span'); lista.forEach(a=>contatos.push(a.innerText)); document.querySelector('#pane-side').scrollTop += 200; atual = document.querySelector('#pane-side').scrollTop; await new Promise(resolve => setTimeout(resolve, 2500));} let filtrados = [...new Set(contatos)].sort(); let resultado = [...filtrados].join('\n'); download(resultado);})();


// 4. Adiciona um novo favorito (Navegador > Ctrl + D)
// 5. Salva
// 6. Edita esse favorito salvo = Na URL desse, cola o bookmarklet acima.




// site para formar o bookamarklet para url bar:
// https://caiorss.github.io/bookmarklet-maker/

// obsidian web clipper:
// https://stephango.com/obsidian-web-clipper
// https://gist.githubusercontent.com/kepano/90c05f162c37cf730abb8ff027987ca3/raw/9985b514cc779df3242374d2d148ba97bc492f8c/obsidian-web-clipper.js

// exemplos de bookmarklets:
// https://github.com/ThomasOrlita/awesome-bookmarklets
// https://github.com/HelioGiroto/awesome-bookmarklets

/*
	https://web.whatsapp.com/
	https://stephango.com/obsidian-web-clipper
	https://gist.github.com/HelioGiroto/a63f2b0d24c72c0c07288bc1f51da12a
	https://caiorss.github.io/bookmarklet-maker/
	https://duckduckgo.com/?q=javascritp+querySelector+a+element+that+attribute+is+not+empty&ia=web
	https://stackoverflow.com/questions/5524132/select-elements-with-empty-or-not-specified-attribute
	https://stackoverflow.com/questions/10777684/how-to-use-queryselectorall-only-for-elements-that-have-a-specific-attribute-set
	https://stackoverflow.com/questions/17248915/css-attribute-selector-for-existing-but-non-empty-attributes
	https://stackoverflow.com/questions/9271424/how-do-i-target-elements-with-an-attribute-that-has-any-value-in-css

*/


document.querySelectorAll('div#pane-side div > span[title]')
document.querySelectorAll('div#pane-side div > span[title]:not(.copyable-text)') // !!!

document.querySelectorAll('div._ak8o  span')	// ok ok ok 

// mais manual (pq terá que sempre inspectorar o nome da classe do span):
document.querySelectorAll('div#pane-side div > span._ao3e')



document.querySelectorAll('div#pane-side div > span:not([title])')

document.querySelectorAll('div#pane-side div > span:not([title=""])')



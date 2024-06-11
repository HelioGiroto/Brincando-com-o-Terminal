// fonte - https://stackoverflow.com/questions/3665115/how-to-create-a-file-in-memory-for-user-to-download-but-not-through-server

function download(conteudo) {
	let mimeType = "txt"
	// let mimeType = "application/javascript"
	let filename = "BibliaFalada"
	const a = document.createElement('a') // Create "a" element
	const blob = new Blob([conteudo], {type: mimeType}) // Create a blob (file-like object)
	const url = URL.createObjectURL(blob) // Create an object URL from blob
	a.setAttribute('href', url) // Set "a" element link
	a.setAttribute('download', filename) // Set download filename
	a.click() // Start downloading
}

// Descomentado para texto:
// O resultado sai como arq txt e numa única frase:

function download(conteudo) {
	let mimeType = "txt";
	let filename = "resultado";
	const a = document.createElement('a');
	const blob = new Blob([conteudo], {type: 'mimeType'});
	const url = URL.createObjectURL(blob);
	a.setAttribute('href', url);
	a.setAttribute('download', filename);
	a.click();
};

let valores = "1,2,3,4,5,6,7,8,9,0";
download(valores);




// OK

// Para csv:
// Sai como arquivo csv, com valores separados por vírgula em cada coluna diferente:
// fonte -  https://stackoverflow.com/questions/14964035/how-to-export-javascript-array-info-to-csv-on-client-side/#answer-68146412


function download(conteudo) {
	let nomearq = "resultado.csv";
	let mimeType = "text/csv;charset=utf-8;";
	const a = document.createElement('a');
	const blob = new Blob([conteudo], {type: mimeType});
	const url = URL.createObjectURL(blob);
	a.setAttribute('href', url);
	a.setAttribute('download', nomearq);
	a.click();
};


// CHAMANDO A FUNÇÃO ACIMA COM STRING OU COM ARRAY:

// CHAMANDO COM STRING:
// substitui vírgula por quebra de linha para ser impresso num arquivo csv onde cada elemento estará numa linha:
let entrada = "1,2,3,4,5,6,7,8,9,0"; 
// entrada = entrada.replace(/,/g, '\n');	// funciona tb
entrada = entrada.split(",").join("\n");
download(entrada);

// CHAMANDO COM ARRAY:
// ou obtem um array convertendo-o em string igual ao formato acima:
let lista = [1,2,3,4,5].join('\n');		// funciona tb 
download(lista);
typeof(lista); 		// string 



////////////////

let csv = arrayToCsv([[1, '2', '"3"'], [true, null, undefined],]);

// Result:
// "1","2","""3"""
// "true","null","undefined"


function downloadBlob(content, filename, contentType) {
  // Create a blob
  var blob = new Blob([content], { type: contentType });
  var url = URL.createObjectURL(blob);

  // Create a link to download it
  var pom = document.createElement('a');
  pom.href = url;
  pom.setAttribute('download', filename);
  pom.click();
}

downloadBlob(csv, 'export.csv', 'text/csv;charset=utf-8;')


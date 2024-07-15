javascript:(async () =>{const d = new Date(); let dia = d.getDate(); if (dia < 10) dia = `0${dia}`; let mes = d.getMonth()+1; if (mes < 10) mes = `0${mes}`; let ano = d.getFullYear(); let dataAtual = `${ano}${mes}${dia}`; let hora = d.getHours(); let minuto = d.getMinutes(); if (minuto < 10) minuto = `0${minuto}`; let horaAtual = `${hora}:${minuto}`; let anterior = -1; let atual = 0; let contatos = []; let padrao = /^\+/; const seletorCaptura = 'div[role="gridcell"] > div > div > span'; function download(conteudo){ const nomearq = `novos-contatos-${dataAtual}-H-${horaAtual.replace(':', '-')}.csv`; const mimeType = "text/csv;charset=utf-8;"; const a = document.createElement('a'); const blob = new Blob([conteudo], {type: mimeType}); const url = URL.createObjectURL(blob); a.setAttribute('href', url); a.setAttribute('download', nomearq); a.click(); }; while(atual > anterior){ await new Promise(resolve => setTimeout(resolve, 2500)); anterior = atual; let lista = document.querySelectorAll(seletorCaptura); lista.forEach(a=> {if(padrao.test(a.innerText)){ contatos.push(a.innerText);}}); document.querySelector('#pane-side').scrollTop += 300; atual = document.querySelector('#pane-side').scrollTop;}; let filtrados = [...new Set(contatos)].sort(); await new Promise(resolve => setTimeout(resolve, 2500)); let novosContatos = []; filtrados.map((e,i)=>{ let linha = `H${horaAtual} CT ${i+1} ${dataAtual},${e}`; novosContatos.push(linha);}); novosContatos.unshift("Name,Mobile Phone"); let resultado = [...novosContatos].join('\n'); download(resultado); alert(`Terminado! Foram baixados ${filtrados.length} novos contatos.\nAgora suba o arquivo baixado para o Google Contacts.`); window.open("https://contacts.google.com",  "_blank");})();


//





// H20:22 CT 9999 15072024
// antes: 
// let linha = `${i+1} CTT ${dataAtual} H.${horaAtual},${e}`; novosContatos.push(linha);

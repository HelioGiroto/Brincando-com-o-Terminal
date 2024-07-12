// Script para obter hora da internet e não da máquina local:
// http://worldtimeapi.org/api/timezone/America/Sao_Paulo


function imprimirTempo(t) {
    console.log("HORA - SP: " + t.split('T')[1].split('.')[0])
    // document.querySelector('#id').innerHTML = t
}

function obterTempo() {
    let url = 'http://worldtimeapi.org/api/timezone/America/Sao_Paulo'
    console.log(url)
    fetch(url)
        .then(res => res.json())
        .then(json => imprimirTempo(json.datetime))
}

// Dispara quando clica:
// document.querySelector('.tela').addEventListener('click', obterTempo)

// laço a cada um segundo:
// setInterval(()=>{obterTempo()},1000)

obterTempo()
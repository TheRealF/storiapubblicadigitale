

function slideSetting(index){
    foto[index].classList.add("show");
    testoFoto.innerText = listaFoto[index];
    testo[index].classList.add("show");
    testoTrascritto.innerText = arraySezione[index];
 
}
//Mappatura immagine
const area = document.querySelectorAll("area");
const b = document.querySelectorAll(".numero");
const arrayNum= Array.from(b);
let index = 0;
const listaFoto = ["statua1_ciano_pag1", "statua2_ciano_pag1", "statua3_ciano_pag1"];
const foto = document.querySelectorAll(".foto");
const testoFoto = document.querySelector("#testo_foto");


const listaSezione= document.querySelectorAll(".testo");
const arraySezione = Array.from(listaSezione);

//questa è la variabile che si occupa di creare l'evento show sulla classe
const testo = document.querySelectorAll(".testo");

const testoTrascritto = document.querySelector("#testo");
slideSetting(index);

const avanti = document.querySelector("#avanti"); //Avanti

avanti.addEventListener("click", () => {
    foto[index].classList.remove("show");
    testo[index].classList.remove("show");
    index+=1;


    if(index === foto.length){
        index = 0;
    }
    if(index === arraySezione.length){
        index = 0;
    }

    slideSetting(index);
   
})

const indietro = document.querySelector("#indietro"); //Indietro

indietro.addEventListener("click", () => {
    foto[index].classList.remove("show");
    testo[index].classList.remove("show");
    index-=1;


    if(index === -1){
        index = listaFoto.length-1;
    }
    if(index === -1){
        index = arraySezione.length-1;
    }
   
    slideSetting(index);
  
})



area.forEach( riga => {
    riga.addEventListener("click", () => {
        const verifica = `#${riga.attributes[2].value}`;
        b.forEach( numero => {
            numero.style.backgroundColor = "inherit";
            numero.style.color = "inherit";


            if(numero.attributes[0].value === verifica){
                numero.style.backgroundColor = "#fff";
                numero.style.color = "#000";
            }

        })
    })
})


//mostra expan ecc.
document.addEventListener("DOMContentLoaded", function() {
    var abbrElements = document.querySelectorAll(".abbr");
    
    abbrElements.forEach(function(abbrElement) {
        var expanElement = abbrElement.nextElementSibling;
        
        if (expanElement && expanElement.classList.contains("expan")) {
            abbrElement.addEventListener("mouseenter", function() {
                expanElement.style.display = "inline";
                expanElement.style.backgroundColor = "white";
            });
            
            abbrElement.addEventListener("mouseleave", function() {
                expanElement.style.display = "none";
            });
        }
    });
});

document.addEventListener("DOMContentLoaded", function() {
    var abbrElements = document.querySelectorAll(".orig");
    
    abbrElements.forEach(function(abbrElement) {
        var expanElement = abbrElement.nextElementSibling;
        
        if (expanElement && expanElement.classList.contains("reg")) {
            abbrElement.addEventListener("mouseenter", function() {
                expanElement.style.display = "inline";
                expanElement.style.backgroundColor = "white";
            });
            
            abbrElement.addEventListener("mouseleave", function() {
                expanElement.style.display = "none";
            });
        }
    });
});


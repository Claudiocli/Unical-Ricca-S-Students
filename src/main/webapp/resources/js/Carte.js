$(document).ready(function(){
    aggiungiCarta();
  });
  

function aggiungiCarta(){
    $("#aggiungiCarta").click(show);
}

function show(){
    $("#form").attr("hidden",false);
};

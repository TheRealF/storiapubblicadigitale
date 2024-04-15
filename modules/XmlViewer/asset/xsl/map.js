function resizeMapAreas(previousSize, currentSize, mapNames = []){
  let ratio = currentSize / previousSize;

  mapNames.forEach(map => {
    $('map[name="' + map + '"] area').each(function (){
      let coords = $(this).attr("coords").split(",");
      let newCoords = [];
      coords.forEach(element => {
        newCoords.push(element *= ratio);
      });
      $(this).attr("coords", newCoords.join(","));
    });
  });
  return currentSize;
}

function lineHighlighter(){
  let lineId;
  $('area').hover(function(){
    $(".line").css("background-color", "");
    lineId = $(this).attr("id");
    if(!lineId.startsWith("o")){
      if(lineId.includes("fv")){
        $('#lb_' + lineId + "_body").css('background-color', '#bfd6d9');
      }
      $('#' + lineId).css('background-color', '#bfd6d9');
      $('#lb_' + lineId).css('background-color', '#bfd6d9');
    }
  });
}

function sentenceHighlighter(numFolio, numSentence, mode){
  let sentence = $("#s_" + pad(numSentence));
  let sentence2;
  let sentence2Folio;

  if (mode == "prev"){
    sentence2 =  $("#s_" + pad(numSentence - 1));
  } else if (mode == "next") {
    sentence2 = $("#s_" + pad(numSentence + 1));
  }

  $(".sentence").css("background-color", "");
  sentence2.css("background-color", "coral");
  //WORKAROUND s_07
  if (sentence2.attr("id") == "s_07"){
    $("#s_07b").css("background-color", "coral");
  }

  sentence2.parents("div").each(function() {  //Restituisce l'id del folio della frase evidenziata
    let indexFolio = $.inArray($(this).attr("id"), folii);
    if (indexFolio != -1){
      sentence2Folio = indexFolio;
      return false;
    }
  });

  if (mode == "prev"){
    return [numSentence - 1, sentence2Folio];
  } else if (mode == "next") {
    return [numSentence + 1, sentence2Folio];
  }
}

function pad(x){
  if (x < 10){
    return "0" + x;
  }
  return x;
}

var currentImg;
var currentBtn;
var currentSheet = 1;
var previousWidth = [0, 1672, 1672, 1672, 2409];
const folii = ["null", "fronte-recto", "retro-recto", "retro-verso", "fronte-verso"];
var currentSentence = 0;
var zoomVal = 3;

$(window).on("resize", function(){
  adjustPic();
  resizePic();
});

$(document).ready(function (){
  //gestisce le abbreviazioni
  abbrExpand()
  //Gestisce il dropdown della toolbar
  toolbarDropdown()
  //Aggiunge i riferimenti alle note
  addReferences();

  //Workaround s_07
  $(".sentence").each(function () {
    if ($(this).text().includes("imputare")){
      $(this).attr("id", "s_07b");
    }
  });

  //Aggiunge il gestore dell'evento hover agli elementi della mappa
  lineHighlighter();

  //Aggiunge a ogni bottone numerato il gestore dell'evento click
  for (let i = 1; i < 5; i++){
    $("#pages :nth-child(" + (i + 1) + ")").click(function (){
      setImg($("#slider ul li:nth-child(" + i + ")"));
      setBtn($(this));
    });
  }

  //Aggiunge il gestore dell'evento click alla checkbox "checkbox_sentences"
  $("#checkbox_sentences").click(function (){
    if (!$(this).is(":checked")){
      $(".sentence").css("background-color", "");
    }
    $(".sentenceBtn").toggle();
  });

  //Aggiunge il gestore dell'evento click alla checkbox "checkbox_magnifier"
  $("#checkbox_magnifier").click(function (){
    if (!$(this).is(":checked")){
      magnifierOff();
    } else {
      $("#pages li").each(function () {
        if ($(this).hasClass("hovered")){
          $(this).click();
        }
      });
    }
  });

  //Aggiunge a ogni bottone il gestore dell'evento personalizzato "btnHovered"
  $("#pages :nth-child(2)").bind("btnHovered", function (){
    $("#prev").attr("disabled", true);
    $("#next").attr("disabled", false);
    adjustPic();
    setSheet();
    if ($("#checkbox_magnifier").is(":checked")){
      magnifierOff();
      magnify("pic_1", zoomVal);
    }
  });
  $("#pages :nth-child(3)").bind("btnHovered", function (){
    $("#prev").attr("disabled", false);
    $("#next").attr("disabled", false);
    adjustPic();
    setSheet();
    if ($("#checkbox_magnifier").is(":checked")){
      magnifierOff();
      magnify("pic_2", zoomVal);
    }
  });
  $("#pages :nth-child(4)").bind("btnHovered", function (){
    $("#prev").attr("disabled", false);
    $("#next").attr("disabled", false);
    adjustPic();
    setSheet();
    if ($("#checkbox_magnifier").is(":checked")){
      magnifierOff();
      magnify("pic_3", zoomVal);
    }
  });
  $("#pages :nth-child(5)").bind("btnHovered", function (){
    $("#next").attr("disabled", true);
    $("#prev").attr("disabled", false);
    adjustPic();
    setSheet();
    if ($("#checkbox_magnifier").is(":checked")){
      magnifierOff();
      magnify("pic_4", zoomVal);
    }
  });

  $('#accordionUl_1').hide();
  $('#accordionUl_2').hide();
  $("#frecciaUp_1").hide();
  $("#frecciaUp_2").hide();
  $("#slider ul li").hide();

  //Valori iniziali dell'immagine corrente e del bottone corrente
  currentImg = $('#slider ul li:nth-child(1)').show();
  setBtn($("#pages :nth-child(2)"));

  //Aggiunge ai bottoni Prev e Next il gestore dell'evento click
  $("#next").click(function (){
    sliderArrowClick("next");
  });
  $("#prev").click(function (){
    sliderArrowClick("prev");
  });

  $("#sentence_prev").click(function (){
    if ((currentSentence != 1) && (currentSentence != 0)) {
      let arr = sentenceHighlighter(currentSheet, currentSentence, "prev");
      currentSentence = arr[0];
      currentSheet = arr[1];
      if(currentSheet != getCurrentFolio()){
        $("#prev").click();
      }
    }
  });

  $("#sentence_next").click(function (){
    if (currentSentence != 12){
      let arr = sentenceHighlighter(currentSheet, currentSentence, "next");
      currentSentence = arr[0];
      currentSheet = arr[1];
      if(currentSheet != getCurrentFolio()){
        $("#next").click();
      }
    }
  });

  $("#accordionBtn_1").click(function (){
    $('#accordionUl_1').toggle();
    $("#frecciaDown_1").toggle();
    $("#frecciaUp_1").toggle();
  });
  $("#accordionBtn_2").click(function (){
    $('#accordionUl_2').toggle();
    $("#frecciaDown_2").toggle();
    $("#frecciaUp_2").toggle();
  });

  //Abilita maphilight
  $('img[usemap]').maphilight();
});

function abbrExpand(){
  $(".expan").hide();
  $(".abbr").mouseenter(function() {
    $(this).find(" span ").show();
  });
  $(".abbr").mouseleave(function() {
    $(this).find(" span ").hide();
  });
}

function adjustPic(){
  $(".pic_container").each(function(i) {
    i += 1;
    $(this).css({
      width: $("#pic_clone_" + i).width(),
      height: $("#pic_clone_" + i).height()
    });
    $(this).attr({
      width: $("#pic_clone_" + i).width(),
      height: $("#pic_clone_"+ i).height()
    });
    $(this).find("canvas").css({
      width: $("#pic_clone_"+ i).width(),
      height: $("#pic_clone_" + i).height()
    });
    $(this).find("canvas").attr({
      width: $("#pic_clone_"+ i).width(),
      height: $("#pic_clone_"+ i).height()
    });
  });
}

function getCurrentFolio(){
  let currentFolio;
  $("#slider ul li").each(function (){
    if ($(this).css("display") != "none"){
      currentFolio = $(this).attr("id").substring(1);
      return false;
    }
  });
  return parseInt(currentFolio);
}

function setSheet(){
  currentSheet = getCurrentFolio();
  $(".folio").hide();
  $("#" + folii[currentSheet]).show();
  resizePic();
}

function setImg(input){
  currentImg.hide();
  currentImg = input;
  currentImg.show()
}

function setBtn(input){
  $("#pages li").removeClass("hovered");
  currentBtn = input.addClass("hovered").trigger("btnHovered");
}

function sliderArrowClick(mode){
  if (mode == "next"){
    setImg(currentImg.next());
    setBtn(currentBtn.next());
  } else if (mode == "prev") {
    setImg(currentImg.prev());
    setBtn(currentBtn.prev());
  }
  setSheet();
}

function resizePic(){
  previousWidth[currentSheet] = resizeMapAreas(previousWidth[currentSheet], $("img[usemap='#" + currentSheet + "']").width(), [currentSheet]);
}

function toolbarDropdown(){
  $('.anchor').click(function (){
    if ($('#items').hasClass('visible')) {
      $('#items').removeClass('visible');
      $('#items').css("display", "none");
    } else {
      $('#items').addClass('visible');
      $('#items').css("display", "block");
    }
  });
  $('#items li input').click(function(){
    if ($(this).is(':checked')) {
      switch ($(this).attr('id')) {
        case 'persontag':
        $('.persName').css("background-color", "yellow").addClass("tooltip");
        $("#GG").addClass("GG_fix");
        break;
        case 'placetag':
        $('.placeName').css("background-color", "green").addClass("tooltip");
        break;
        case 'termtag':
        $('.term').css("background-color", "cyan").addClass("tooltip");
        break;
        case 'worktag':
        $('.rs').css("background-color", "purple").addClass("tooltip");
        break;
      }
    }
    else{
      switch ($(this).attr('id')) {
        case 'persontag':
        $('.persName').css("background-color","").removeClass("tooltip");
        $("#GG").removeClass("GG_fix");
        break;
        case 'placetag':
        $('.placeName').css("background-color","").removeClass("tooltip");
        break;
        case 'termtag':
        $('.term').css("background-color","").removeClass("tooltip");
        break;
        case 'worktag':
        $('.rs').css("background-color","").removeClass("tooltip");
        break;
      }
    }

  });
}

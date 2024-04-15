function addReferences() {
  $('[id="LL1_6_note1"]').css("cursor", "pointer");
  $('[id="LL1_6_note1"]').click(function (){
    $("#info_LL1_6_note1").goTo(100);
    highlight("#info_LL1_6_note1");
  });

  $('[id="LL1_6_note2"]').css({
    cursor: "pointer"
  });

  $('[id="LL1_6_note2"]').click(function (){
    $("#info_LL1_6_note2").goTo(100);
    highlight("#info_LL1_6_note2");
  });

}

(function(jQuery) {
  jQuery.fn.goTo = function(ms) {
    $('html, body').animate({
      scrollTop: 100000
    }, ms);

    return this;
  };
})(jQuery);


function highlight(id){
  $(id).addClass("highlight");
  setTimeout(function () {
    $(id).removeClass('highlight');
  }, 2000);
}

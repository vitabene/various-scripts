var filter = function(len){
     var begins = $(".marketing-input").text();
     $(document).scrollTop(480);
     var names = $(".business-name-button__name");
     for (var i = 0; i < names.length; i++) {
          $(n).text($(n).text().toLowerCase());
          var n = names[i];
          if (n.textContent.length > len || n.textContent.indexOf(begins) !== 0) $(n).parent().parent().hide();
     }
};
filter();
var nextPage = function(){
     $(".pagination__next").children()[0].click();
};

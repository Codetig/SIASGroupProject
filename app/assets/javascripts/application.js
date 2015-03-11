// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs  
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
  var edgyAudio = new Audio("https://p.scdn.co/mp3-preview/0b046dcd66e5bd91df44352490e587bbf8b579b7");
  var happyAudio = new Audio("https://p.scdn.co/mp3-preview/6b00000be293e6b25f61c33e206a0c522b5cbc87");
  var nostAudio = new Audio("https://p.scdn.co/mp3-preview/6f0bab1d0b816bff19813a1847032e1f45dc3045");
  var icon = ["glyphicon glyphicon-play-circle","glyphicon glyphicon-pause"];
  

  $('#happy').on('click',function(e){
    if($(this).attr("class") === icon[0]){
      happyAudio.play();
      $(this).attr("class",icon[1]);
    } else {
      happyAudio.pause();
      $(this).attr("class",icon[0]);
    }

  });


   $('#edgy').on('click',function(e){
    if($(this).attr("class") === icon[0]){
      edgyAudio.play();
      $(this).attr("class",icon[1]);
    } else {
      edgyAudio.pause();
      $(this).attr("class",icon[0]);
    }

  });

    $('#nost').on('click',function(e){
    if($(this).attr("class") === icon[0]){
      nostAudio.play();
      $(this).attr("class",icon[1]);
    } else {
      nostAudio.pause();
      $(this).attr("class",icon[0]);
    }

  });

});


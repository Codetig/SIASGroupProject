//=======  Get tracks search result =========//
$(document).ready(function () {
$('iframe').hide(); //hiding iframes
//variable to store spotify result and track titles
  var spResult ={};
  var audioObject = {};
  var audio = new Audio();
  // the title and artist help pick the right title and right artist
  var title = function(context){return context.parent().find($('.tr-title')).text();};
  var artist = function(context){return context.parent().find($('.tr-artist')).text();};
  var currentPreview = null;

 $("#search form").on("submit", function (event) {
   event.preventDefault();
   $('#results ul').empty();  //this clears out old search results
   var query = this.searchTerm.value;
   
   $.getJSON("https://api.spotify.com/v1/search?q=" + query + "&type=track,artist&market=US", function(data) {
     
     var resultList = $("#results ul");  // changed this variable name from $results to resultList to avoid confusion 
     for (var i = 0; i < data.tracks.items.length; i++) {
        var title = data.tracks.items[i].name;
        var artist = data.tracks.items[i].artists[0].name;
        var preview = data.tracks.items[i].preview_url;
        spResult[title+artist] = data.tracks.items[i];
        audioObject[title+artist] = new Audio(data.tracks.items[i].preview_url);
        resultList.append("<li class='list-group-item hover'><span class='tr-title'><b>" + title + "</b></span> - " + "<span class='tr-artist'>" + artist + "</span> <a href='' class='create_track' remote = 'true'><button class='glyphicon glyphicon-plus' aria-hidden='true'></button></a><br><a href='#' id='play' class='glyphicon glyphicon-play' aria-hidden='true'></a>&nbsp;&nbsp;<a href='#' id='pause' class='glyphicon glyphicon-pause' aria-hidden='true'></a></li>");
        // <a href="+ preview + ">Preview</a>

        //removed on click listener on <li>s from here -Ife
        // resultList = resultList.append("<iframe src=\"https://embed.spotify.com/?uri=" + data.tracks.items[i].uri+"\" width=\"300\" height=\"80\" frameborder=\"0\" allowtransparency=\"true\"></iframe>");
      }
  }); //end of getJSON
 }); //end of searh form submit

  //Ife's changed listener
  //using the artist and title functions define at the top in the events below
 $('#results ul').on('click', '#play',function (e) { 
  e.preventDefault();
  currentPreview? currentPreview.pause() : null; //to prevent multiple songs from playing
  currentPreview = audioObject[title($(this))+artist($(this))]; 
  // console.log(audioObject);
  currentPreview.play(); 
 });
 $('#results ul').on('click', '#pause',function (e) { 
  e.preventDefault();
  // console.log('audioObject:',audioObject);
  audioObject[title($(this))+artist($(this))].pause();
 });     

  $('#results ul').on('click', '.create_track',function (e) { 
    e.preventDefault(); 
    var formURL = $("#search").attr("data-url");
    // var title = $(this).parent().find($('.tr-title')).text();
    // var artist = $(this).parent().find($('.tr-artist')).text();
    var postData = spResult[title($(this))+artist($(this))];
    console.log(postData.preview_url);
    $.ajax({
      url : formURL,
      type: "POST",
      data : {track: {spotify_track_id: postData.id, title: postData.name, track_uri: postData.uri, artist: postData.artists[0].name}},
      success:function(data, textStatus, jqXHR) 
      {
        location.reload();
          //data: return data from server
          // data
      }
       });
    $('#results ul').empty();    
  });

  $('.playbtn').on('click',function (e) {
    e.preventDefault();
      $('iframe').hide(); //hiding iframes
      
      if($(this).text() === "Hide"){
        $('.playbtn').text('Show'); //turning all show-hide link to show
        $(this).parent().parent().find('iframe').hide();
        $(this).text('Show');
      } else {
        $('.playbtn').text('Show'); //turning all show-hide link to show
        $(this).parent().parent().find('iframe').show();
        $(this).text('Hide');
      }

   });

  $('#play-all').on('click',function (e) {
    e.preventDefault();
    $(this).parent().find('iframe').toggle();
  }); //end of play all


//testing Iframe click-approximator technique
  var trkObj = {
    iframeMouseOver: false,
    currTrk: null
  };
  $(window).on("blur",function(e){
    if(trkObj.iframeMouseOver){
      console.log("ok click approximated!");
      console.log(e);
      // console.log(harry);
      $.ajax({
      url : "/playcount/" + trkObj.currTrk,
      type: "GET",
      success: function(){
        console.log("We did it!");
      }

      }); //end of AJAX call
    }
  }); //end of window listener
  $('.if-div').on('mouseover', function(){
    trkObj.iframeMouseOver = true;
    trkObj.currTrk = $(this).attr('data-trackid');
  });
  $('.if-div').on('mouseout', function(){trkObj.iframeMouseOver = false;});

  // $('#tracks').on('click', '#tracks ol li div', function(e){
  //   console.log("Oh me!!");
    

  // });
  // //Ife's changed listener/modified by Sue
  // $('#results ul').on('click', '.create_track',function (e) { 
  //   e.preventDefault(); 
  //   var formURL = $("#search form").attr("action");
  //   var title = $(this).parent().find($('.tr-title')).text();
  //   var artist = $(this).parent().find($('.tr-artist')).text();
  
  //   var postData = spResult[title+artist];
  //   $.ajax({
  //     url : formURL,
  //     type: "POST",
  //     data : {track: {spotify_track_id: postData.id, title: postData.name, track_uri: postData.uri, artist: postData.artists[0].name}},
  //     success:function(data, textStatus, jqXHR) 
  //     {
  //         //data: return data from server
  //         // data
  //     }
  //      });
  //   $(this).parent().fadeOut(); 
   
  // });


  // ---delete_track----
  $('.delete_track').on('click', function (e) {
    e.preventDefault();
    $('.delete_track').bind('ajax:success', function() {  
      $(this).closest('p').fadeOut();
    });
  });


});



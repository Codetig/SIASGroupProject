//=======  Get tracks search result =========//
$(document).ready(function () {

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
        resultList.append("<li class='list-group-item hover'><span class='tr-title'><b>" + title + "</b></span> - " + "<span class='tr-artist'>" + artist + "</span> <button id='play'>play preview</button><button id='pause'>pause</button> <a href='' class='create_track' remote = 'true'><button class='glyphicon glyphicon-plus' aria-hidden='true'></button></a></li>");
        // <a href="+ preview + ">Preview</a>

        //removed on click listener on <li>s from here -Ife
        // resultList = resultList.append("<iframe src=\"https://embed.spotify.com/?uri=" + data.tracks.items[i].uri+"\" width=\"300\" height=\"80\" frameborder=\"0\" allowtransparency=\"true\"></iframe>");
      }
  }); //end of getJSON
 }); //end of searh form submit

  //Ife's changed listener
  //using the artist and title functions define at the top in the events below
 $('#results ul').on('click', '#play',function (e) { 
  currentPreview? currentPreview.pause() : null; //to prevent multiple songs from playing
  currentPreview = audioObject[title($(this))+artist($(this))]; 
  // console.log(audioObject);
  currentPreview.play(); 
 });
 $('#results ul').on('click', '#pause',function (e) { 
  // console.log('audioObject:',audioObject);
  audioObject[title($(this))+artist($(this))].pause();
 });     

  $('#results ul').on('click', '.create_track',function (e) { 
    e.preventDefault(); 
    var formURL = $("#search").attr("data-url");
    var title = $(this).parent().find($('.tr-title')).text();
    var artist = $(this).parent().find($('.tr-artist')).text();
    var postData = spResult[title+artist];
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



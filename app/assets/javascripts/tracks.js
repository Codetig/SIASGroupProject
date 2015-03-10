//=======  Get tracks search result =========//

$(document).ready(function () {

//variable to store spotify result and track titles
  var spResult ={};



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
        
        resultList.append("<li class='list-group-item'><span class='tr-title'><b>" + title + "</b></span> - " + "<span class='tr-artist'>" + artist + "</span> <a href="+ preview + ">Preview</a>  <a href='' class='create_track'  remote = 'true'><span class='glyphicon glyphicon-plus' aria-hidden='true'></span></a></li>");
        //removed on click listener on <li>s from here -Ife
        // resultList = resultList.append("<iframe src=\"https://embed.spotify.com/?uri=" + data.tracks.items[i].uri+"\" width=\"300\" height=\"380\" frameborder=\"0\" allowtransparency=\"true\"></iframe>");
      }
  }); //end of getJSON
 }); //end of searh form submit

  //Ife's changed listener
  $('#results ul').on('click', '.create_track',function (e) { 
    e.preventDefault(); 
    var formURL = $("#search").attr("data-url");
    // console.log(formURL);
    console.log($(this).parent().find($('.tr-title')).text());
    var title = $(this).parent().find($('.tr-title')).text();
    var artist = $(this).parent().find($('.tr-artist')).text();
    // console.log(harry);
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

});



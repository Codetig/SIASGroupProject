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
        
        resultList.append("<li><span class='tr-title'><b>" + title + "</b></span> - " + "<span class='tr-artist'>" + artist + "</span> <a href="+ preview + ">Preview</a>  <a href='' class='create_track'  remote = 'true'><span class='glyphicon glyphicon-plus' aria-hidden='true'></span></a></li>");
        //removed on click listener on <li>s from here -Ife
        // resultList = resultList.append("<iframe src=\"https://embed.spotify.com/?uri=" + data.tracks.items[i].uri+"\" width=\"300\" height=\"380\" frameborder=\"0\" allowtransparency=\"true\"></iframe>");
      }
  }); //end of getJSON
 }); //end of searh form submit

  //Ife's changed listener
  $('#results ul').on('click', '.create_track',function (e) { 
    e.preventDefault(); 
    var formURL = $("#search form").attr("action");
    console.log($(this).parent().find($('.tr-title')).text());
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
        console.log("It worked!");
          //data: return data from server
          // data
      }
       });
    $('#results ul').empty();    
  });

  //Sue's original list listener
  // $('li').click('#create_track',function (event) { 
  //   event.preventDefault(); 
  //   var formURL = $("form").attr("action");
  //   //var index = spResult.indexOf($('#tr-title').text());
  //   var postData = spResult[$('#tr-title').text()];
  //   console.log(postData);
  //   $.ajax({
  //     url : formURL,
  //     type: "POST",
  //     data : postData,
  //     success:function(data, textStatus, jqXHR) 
  //     {
  //         //data: return data from server
  //         // data
  //     }
  //      });
  //   $(this).fadeOut();    
  // });

});



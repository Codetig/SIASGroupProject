//=======  Get tracks search result =========//

$(document).ready(function () {
 $("form").on("submit", function (event) {
   event.preventDefault();

   var query = this.searchTerm.value;
   $.getJSON("https://api.spotify.com/v1/search?q=" + query + "&type=track,artist&market=US", function(data) {
     var $results = $("#results");   
     for (var i = 0; i < data.tracks.items.length; i++) {
        var title = data.tracks.items[i].name;
        var artist = data.tracks.items[i].artists[0].name;
        var preview = data.tracks.items[i].preview_url;
        
        $results.append("<li><strong>"+title + "</strong> - " + artist + " <a  href="+ preview + ">Preview</a>&nbsp;<a href='' id='create_track'  remote = 'true'><span class='glyphicon glyphicon-plus' aria-hidden='true'></span></li><br>");
  
        $('li').click('#create_track',function (event) { 
          event.preventDefault(); 
          var formURL = $("form").attr("action");
          var postData = data.tracks;
          $.ajax({
            url : formURL,
            type: "POST",
            data : postData,
            success:function(data, textStatus, jqXHR) 
            {
                //data: return data from server
                // data
            }
             });
          $(this).fadeOut();    
        });
        // $results = $results.append("<iframe src=\"https://embed.spotify.com/?uri=" + data.tracks.items[i].uri+"\" width=\"300\" height=\"380\" frameborder=\"0\" allowtransparency=\"true\"></iframe>");
      }
  });
 });
});



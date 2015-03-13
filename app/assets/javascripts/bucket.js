$(document).ready(function(){
  $('#add-form').fadeOut(0);
  $('.edit-form').fadeOut(0);
  $('.add-link').on('click', function(e){
    e.preventDefault();
    $('#edit-form').fadeOut(0);
    $('#add-form').fadeIn(0);
    // $('#add-form').append('<h2>Add New Bucket</h2><form action="/users/:user_id/buckets"><label for="name">Name: </label><input type="text" name="name" id="name"><br><label for="desc">Description: </label><input type="text" name="desc" id="desc"><input type="submit" value="Add Bucket"></form>');
  }); //end of add-link click

  $('.edit').on('click', function(e){
    e.preventDefault();
    $('#add-form').fadeOut(0);
    $('.edit-form').fadeOut(0);

    // console.log($(this).parent().parent().find('form')); //testing selection
    var editForm = $(this).parent().parent().find('.edit-form');
    editForm.fadeIn(0);
  }); //end of add-link click

  $('.play-all').on('click',function (e) {
    e.preventDefault();
  $(this).parent().find('iframe').toggle();
  }); //end of play all



  

});
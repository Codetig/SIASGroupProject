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
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $('#add-form').fadeOut(0);
  $('#edit-form').fadeOut(0);
  $('.add-link').on('click', function(e){
    e.preventDefault();
    $('#edit-form').fadeOut(0);
    $('#add-form').fadeIn(0);
    // $('#add-form').append('<h2>Add New Bucket</h2><form action="/users/:user_id/buckets"><label for="name">Name: </label><input type="text" name="name" id="name"><br><label for="desc">Description: </label><input type="text" name="desc" id="desc"><input type="submit" value="Add Bucket"></form>');
  }); //end of add-link click

  $('.edit-link').on('click', function(e){
    e.preventDefault();
    $('#add-form').fadeOut(0);
    $('#edit-form').fadeIn(0);
  }); //end of add-link click

});
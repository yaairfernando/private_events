import $ from "jquery";

$(() => $('.comming_request').bind("ajax:beforeSend", function(){
  }).bind("ajax:success", function(event){
    $('.content_custom_event').html(event.originalEvent.detail[0].html) 
  }).bind('ajax:complete', function(){
  }).bind("ajax:error", function(){
  })
)

$(() => $('.passed_request').bind("ajax:beforeSend", function(){
  }).bind("ajax:success", function(event){
    $('.content_custom_event').html(event.originalEvent.detail[0].html) 
  }).bind('ajax:complete', function(){
  }).bind("ajax:error", function(){
  })
)
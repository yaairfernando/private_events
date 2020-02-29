import $ from "jquery";

$(() => $('.comming_request').bind("ajax:beforeSend", function(){
  }).bind("ajax:success", function(event){
    console.log(event.originalEvent.detail)
    if(event.originalEvent.detail[0].data.length === 0) {
      console.log("jfjfj")
    }
    $('.content_custom_event').html(event.originalEvent.detail[0].html) 
  }).bind('ajax:complete', function(){
  }).bind("ajax:error", function(){
  })
)

$(() => $('.passed_request').bind("ajax:beforeSend", function(){
  }).bind("ajax:success", function(event){
    console.log(event.originalEvent.detail)
    if(event.originalEvent.detail[0].data.length === 0) {
      console.log("jfjfj")
    }
    $('.content_custom_event').html(event.originalEvent.detail[0].html) 
  }).bind('ajax:complete', function(){
  }).bind("ajax:error", function(){
  })
)
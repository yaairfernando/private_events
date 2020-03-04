import $ from 'jquery';

$(() => {
  if($(".alert-dismissible").length) {
    setInterval(() => {
      $(".alert-dismissible").attr('style', 'display: none !important');
    },8000)
  }
});
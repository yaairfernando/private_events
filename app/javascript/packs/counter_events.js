require('jquery-counter');
import $ from "jquery";

$(() => {
  if($(".events_counter").length) {
    $('.events_counter').counter({
      decimals: 0,
      decPoint: ".",
      thousandsSep: "20"
    });
  }
});
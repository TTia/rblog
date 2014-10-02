// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
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

function switch_search_input_text() {
    var search_input_text = document.getElementById('search_input_text');

    if (search_input_text.style.display != "inline") {
        search_input_text.style.display = "inline";
        //search_input_text.value = '';
    } else {
        hide_search_input_text(search_input_text);
    }
}

/*
function on_key_pressed(event) {
    if (typeof event == 'undefined' && window.event) {
        event = window.event;
    }
    var code = event.charCode || event.keyCode;
    if (code == 27) {
        hide_search_input_text(search_input_text);
    }
}
*/

function hide_search_input_text(search_input_text) {
    search_input_text.style.display="none";
}
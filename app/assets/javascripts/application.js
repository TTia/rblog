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
//= require jquery-ui
//= require turbolinks
//= require_tree .

function cb(data) {
    console.log(data);
    return data;
}

$(document).ready(function () {
    if ($("#search_input_text").length) {
        $("#search_input_text").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "/posts/autocomplete_title?title=" + $("#search_input_text").val(),
                    success: function (data) {
                        console.log("Ok");
                        console.log(data);
                        response(data);
                    },
                    failure: function () {
                        console.log("Failure");
                    }
                })
            },
            minLength: 2,
            focus: function (event, ui) {
                event.preventDefault();
                $("#search_input_text").val(ui.item.value);
            },
            select: function (event, ui) {
                event.preventDefault();
                $("#search_input_text").val(ui.item.value);
            }
        });
    }
});

function switch_search_input_text() {
    var search_input_text = document.getElementById('search_input_text');

    if (search_input_text.style.display != "inline") {
        search_input_text.style.display = "inline";
    } else {
        search_input_text.style.display = "none";
    }
}
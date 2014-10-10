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
//= require autocomplete-rails
//= require turbolinks
//= require_tree .

function switch_search_input_text() {
    var search_input_text = document.getElementById('search_input_text');

    if (search_input_text.style.display != "inline") {
        search_input_text.style.display = "inline";
        //search_input_text.value = '';
    } else {
        search_input_text.style.display = "none";
    }
}

function autocomplete_search() {
    var search_input_text = document.getElementById('search_input_text');
    var string = search_input_text.value;
    //alert(string);
    $("#search_input_text").autocomplete({
        source: function (request, response) {
            alert(string);
            $.ajax({
                url: "http://localhost:3000/posts/autocomplete_post_title=" + string,
                dataType: "json",
                success: function (data) {
                    response($.map(data, function (item) {
                        return {
                            label: item.state,
                            title: item.title
                        };
                    }));
                }
            });
        },
        delay: 500,
        minLength: 2,
        select: function (event, ui) {
            $('#search_input_text').val(ui.item.title);
        }
    });
    /*
     $.getJSON("http://localhost:3000/posts/autocomplete_post_title?title=" + string,
     function (result) {
     alert(result);
     var header_div = document.getElementById('search_input_text');
     $.each(result, function (i, field) {
     header_div.append(field + " ");
     });
     });
     */
    //alert(string);
    /*
     $("#search_input_text").autocomplete({
     source: function( request, response ) {
     alert(string);
     $.ajax({
     url: "http://localhost:3000/posts/autocomplete_post_title="+string,
     dataType: "json",
     success: function(data) {
     response($.map(data, function(item) {
     return {
     label: item.state,
     title: item.title
     };
     }));
     }
     });
     },
     delay: 500,
     minLength: 2,
     select: function(event, ui) {
     $('#search_input_text').val(ui.item.title);
     }
     });
     */
    //alert(string);
}
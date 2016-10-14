// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/autocomplete
//= require turbolinks
//= require_tree .
var ready;
// ready = (function() {
//   $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
//   $("#searchfield").autocomplete({
//     source: '/recherche/autocomplete.json',
//     select: function( event, ui ) {
//       // $('#searchfield').value += ui.item.value
//     }
//   });
// });

ready = (function() {
  function split( val ) {
    return val.split( /,\s*/ );
  }
  function extractLast( term ) {
    return split( term ).pop();
  }

  $( "#searchfield" )
    // don't navigate away from the field on tab when selecting an item
    .on( "keydown", function( event ) {
      if ( event.keyCode === $.ui.keyCode.TAB &&
          $( this ).autocomplete( "instance" ).menu.active ) {
        event.preventDefault();
      }
    })
    .autocomplete({
      source: function( request, response ) {
        $.getJSON( "/recherche/autocomplete.json", {
          term: extractLast( request.term )
        }, response );
      },
      search: function() {
        // custom minLength
        var term = extractLast( this.value );
        if ( term.length < 1 ) {
          return false;
        }
      },
      focus: function() {
        // prevent value inserted on focus
        return false;
      },
      select: function( event, ui ) {
        var terms = split( this.value );
        // remove the current input
        terms.pop();
        // add the selected item
        terms.push( ui.item.value );
        // add placeholder to get the comma-and-space at the end
        terms.push( "" );
        this.value = terms.join( ", " );
        return false;
      }
    });
});

$(document).ready(ready);
$(document).on('page:load', ready);

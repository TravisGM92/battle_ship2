// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require jquery_ujs
//= require_tree .

$(document).ready(function( $ ) {
  AOS.init({
    easing: 'ease-in-quad',
  });
});

$(document).ready(function( $ ) {
  $(".first-play-button").click (function(){
    // Close all open windows
    // $(".content").stop().slideUp(100);
    $(".rules").toggle("slow")
    // Toggle this window open/close
    $(this).next(".content").stop().slideToggle(100);
  });
});

// $(document).ready(function ( $ ) {
//   $(".test_button").click(function() {
//       $("#test").text($("#how_many_ships").val());
//   });
// });

$(document).ready(function ( $ ) {
  $(".test_button").click(function() {
      $.ajax({
          type: "GET",
          url: "http://localhost:3000/test",
          data: {"user_name": $("#user_name").val()},
          success: function(result) {
              $("#test").html(result);
          }
      });
    $("#game").load(location.href + " #game"); //updates the #game div. Can update <p> as well
  });
});


// the code below goes with the JS above.
// It will update the #game div with the new name
// inputted from the text field on the HTML page

// <div class="test_content">
//   <form class="test-form" action="/game" method="put">
//     <input type="text" name="user_name" placeholder="Give us your name" id="user_name" required><br>
//     <input type="submit" class="test_button"></input>
//     <%= hidden_field_tag :authenticity_token, form_authenticity_token %>
//   </form>
// </div>
// <div id="game">
//   <%=@user.name%>
// </div>


window.onload = function () {
            setTimeout(appeardiv,2100);
        };
function appeardiv() {
  document.getElementById('message1').style.display= "block";
};
function appeardiv() {
  document.getElementById('message2').style.display= "block";
};


$(document).ready(function () {
  setTimeout(function () {
      $('#message1').animate({opacity: 0});
  }, 6200);
  setTimeout(function () {
    $('.first1').animate({ opacity: 0 });
  }, 6400);
  setTimeout(function () {
    $('.first2').animate({ opacity: 0 });
  }, 6400);
  setTimeout(function () {
    $('.computer_board').animate({ opacity: 1 });
  }, 7000);
  setTimeout(function () {
    $('.user_board').animate({ opacity: 1 });
  }, 8800);
  setTimeout(function () {
      $('.game_board_form').animate({ opacity: 1 });
  }, 6600);
});
//
// $(document).ready(function () {
//   setTimeout(function () {
//       $('.first1').fadeOut(2000);
//       $('.space').fadeIn(2000);
//   }, 6300);
//   // setTimeout(function () {
//   //   $('.space').fadeOut(2100);
//   // }, 6400);
//   setTimeout(function () {
//     $('.computer_board').fadeIn(2100);
//   }, 6400);
// });

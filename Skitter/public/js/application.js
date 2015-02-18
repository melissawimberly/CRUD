$(document).ready(function() {

    $(".login_btn").on("click", function(event){
      event.preventDefault();
      console.log("you clicked!")
      $(".login_form").toggle();
    });

    $(".signup_btn").on("click", function(event){
      event.preventDefault();
      console.log("you clicked!")
      $(".signup_form").toggle();
    });

    $(".add_btn").on("click", function(event){
      event.preventDefault();
      console.log("you clicked!")
      $(".new_post").toggle();
    });


    $(".login_ajax").on("submit", function(event){
      event.preventDefault();
      var $form = $(event.target);
      $.ajax({
        url:  $form.attr('action'),
        type: $form.attr('method'),
        data: $form.serialize(),
        success: function(response){
          $(".auth_btns").remove();
          $(".container").prepend(response);
          console.log(response);
          // not to content bc thats the whole thing. im just dealing with the container
        },
        error: function(response){
          console.log("YOU'VE FAILED");
          errorMod.show('Username or Password is incorrect');
        }
      });
    });


      $(".signup_form").on("submit", function(event){
        event.preventDefault();
        var $form = $(event.target);
        $.ajax({
          url:  $form.attr('action'),
          type: $form.attr('method'),
          data: $form.serialize(),
          success: function(response){
            $(".auth_btns").remove();
            $(".container").prepend(response);
            console.log(response);
            // not to content bc thats the whole thing. im just dealing with the container
          },
          error: function(response){
            console.log("YOU'VE FAILED");
            errorMod.show("OOPS! You didn't fill out all of the fields!");
          }
        });
      });

// ajax (or anything in js) call is on the client side -its making a request to my server 
// and its expecting a response. the server is my sinatra app, its my ruby


      var errorMod = (function(){
        var errorDiv = '#error';
        var showError = function(message){
          $(errorDiv).text(message);
          $(errorDiv).show();
        };
        return {
          show: showError
        };
      })();

});


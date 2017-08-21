$(document).ready(function(){
        $("#login").click(function(){
           $("#form_before_lounch").toggle();
          $("#form_before_lounch").animate({height:"250px", width:"400px"});
          $("#form_before_lounch").children("p").animate({fontSize:"25px"});

          // $("form").delay(500).fadeIn();
        })
        $("#submit").click(function(){
          var u_name = $("#username").val();
          var pass = $("#password").val();

          if(u_name != "" && pass != "") {
            $("#form_before_lounch").fadeOut();
            $("h1").fadeIn();
            $("h1").html("Welcome " +u_name);
            $("h1").animate({marginTop:"200px"});
          };
        })
        $('.right').click(function() {
          $('#form_before_lounch').hide();
          })
      })
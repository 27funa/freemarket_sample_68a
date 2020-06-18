$(document).on('turbolinks:load', function() {

  $(".ImageTopLists").eq(0).addClass("show1")
  $(".show__image__grid__list").eq(0).addClass("active")


let tabs30 = $('.show__image__grid__list a[href^="#"]')
 
    tabs30.click(function(){

    event.preventDefault();
    $('.active').removeClass("active");
    $(this).addClass("active");  
    const index30 = tabs30.index(this);
    $(".ImageTopLists").removeClass("show1").eq(index30).addClass("show1");

    return false;
  });

});
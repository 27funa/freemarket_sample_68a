$(document).on('turbolinks:load', function() {

  $(".ImageTopLists").eq(0).addClass("show1")
  $(".show__image__grid__list").eq(0).addClass("active")


let tabs = $('.show__image__grid__list a[href^="#"]')
 
    tabs.click(function(){

    event.preventDefault();
    $('.active').removeClass("active");
    $(this).addClass("active");  
    const index = tabs.index(this);
    $(".ImageTopLists").removeClass("show1").eq(index).addClass("show1");

    return false;
  });

});
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
//= require turbolinks
//= require jquery

//= require bootstrap-sprockets
//= require_tree .
//= require cocoon

$(function () {
    $(".effect div").css("opacity", "0");
    $(window).scroll(function () {
        $(".effect").each(function () {
            var imgPos = $(this).offset().top;
            var scroll = $(window).scrollTop();
            var windowHeight = $(window).height();
            if (scroll > imgPos - windowHeight + windowHeight / 5) {
                $("div", this).css("opacity", "1");
            } else {
                $("div", this).css("opacity", "0");
            }
        });
    });

    $(document).on('click','.artist_button', function(){
        $('.artist_modal_wrapper').show();
        $('.artist_modal').show();
        $('.create_artist_modal').show();
    })
    $(document).on('click', '.fa_wrapper', function(){
        $('.artist_modal_wrapper').hide();
        $('.artist_modal').hide();
        $('.artist_modal_content').hide();
    })

    $(document).on('click','.genre_button', function(){
        $('.genre_modal_wrapper').show();
        $('.genre_modal').show();
        $('.create_genre_modal').show();
    })
    $(document).on('click', '.fa_wrapper', function(){
        $('.genre_modal_wrapper').hide();
        $('.genre_modal').hide();
        $('.genre_modal_content').hide();
    })

    $(document).on('click','.label_button', function(){
        $('.label_modal_wrapper').show();
        $('.label_modal').show();
        $('.create_label_modal').show();
    })
    $(document).on('click', '.fa_wrapper', function(){
        $('.label_modal_wrapper').hide();
        $('.label_modal').hide();
        $('.label_modal_content').hide();
    })




});



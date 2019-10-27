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

//= require bootstrap-sprockets
//= require_tree .
//= require cocoon
//= require popper
//= require tether

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
    

    $('.artist_button').on('click', function(){
        $('.artist_modal_wrapper').show();
        $('.artist_modal').show();
        $('.create_artist_modal').show();
    })
    $( '.fa_wrapper').on('click', function(){
        $('.artist_modal_wrapper').hide();
        $('.artist_modal').hide();
        $('.artist_modal_content').hide();
    })

    $('.genre_button').on('click',function(){
        $('.genre_modal_wrapper').show();
        $('.genre_modal').show();
        $('.create_genre_modal').show();
    })
    $('.fa_wrapper').on('click', function(){
        $('.genre_modal_wrapper').hide();
        $('.genre_modal').hide();
        $('.genre_modal_content').hide();
    })

    $('.label_button').on('click', function(){
        $('.label_modal_wrapper').show();
        $('.label_modal').show();
        $('.create_label_modal').show();
    })
    $('.fa_wrapper').on('click', function(){
        $('.label_modal_wrapper').hide();
        $('.label_modal').hide();
        $('.label_modal_content').hide();
    })


});

$(function () {
    $('#artist_submit').off('click');
    $('#artist_submit').on('click', function(e){
        e.preventDefault();
        var artist = $('#artist_artist_name').val();
        console.log(artist)
        $.ajax({
            url:  "../artists",
            type: 'POST',
            data: {
                artist: artist
            },
            dataType: 'json',
          })
          .done(function(data){
              console.log(data)
            $('.artist_wrapper').prepend('<span>' + data.artist_name + '</span>');
          })
          .fail(function(data){
            console.log(data)
          })
          .always(function(data){
            $('.submit-btn').prop('disabled', false);　//ここで解除している
          })
    })
});


// $(function () {
//     $(document).on('ajax:success', 'artist', function(e){
//         $('#artist_artist_name').val('');
//         $('.artist_wrapper').prepend('<p>' + e.detail[0] + '</p>');
//     })
// });

$(function () {
    $('#genre_submit').off('click');
    $('#genre_submit').on('click', function(e){
        e.preventDefault();
            $(document).off('click',".genre_delete2" );

        var genre = $('#genre_genre_name').val();
        console.log(genre)
        $.ajax({
            url:  "../genres",
            type: 'POST',
            data: {
                genre: genre
            },
            dataType: 'json',
          })
          .done(function(data){
              console.log(data)
            $('.genre_wrapper').prepend('<span>' + data.genre_name + '<button type="button" name="削除" value="' + data.id + '"class="genre_delete2">削除</button></span>');
            $('#genre_genre_name').val("");
          })
          .fail(function(data){
            console.log(data)
          })
          .always(function(data){
            $('.submit-btn').prop('disabled', false);　//ここで解除している
          })
    })
});



// $(function () {
//     $(document).on('ajax:success', 'form', function(e){
//         $('#label_label_name').val('');
//         $('.label_wrapper').prepend('<p>' + e.detail[0] + '</p>');
//     })
// });

$(function () {
    $('#label_submit').off('click');
    $('#label_submit').on('click', function(e){
        e.preventDefault();
        var label = $('#label_label_name').val();
        console.log(label)
        $.ajax({
            url:  "../labels",
            type: 'POST',
            data: {
                label: label
            },
            dataType: 'json',
          })
          .done(function(data){
              console.log(data)
            $('.label_wrapper').prepend('<span>' + data.label_name + '</span><a ></a>');
          })
          .fail(function(data){
            console.log(data)
          })
          .always(function(data){
            $('.submit-btn').prop('disabled', false);　//ここで解除している
          })
    })
});

// $(function(){
//     $('.genre_delete').on('click', function(e){
//       e.preventDefault();
//       e.stopPropagation();
//       let href = $(this).attr('href');
//       let genre_id = $(this)[0].dataset['genreId'];
//       $.ajax({
//         type: 'DELETE',
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         dataType: 'json',
//         url: href,
//         data: JSON.stringify({genre_id: genre_id}),
//         success: function(res) {
//           $(".row[data=" + genre_id + "]").empty();
//           $(".row[data=" + genre_id + "]").html(
//             `<span>削除</span>`
//           );
//           return false;
//         },
//         error: function(res) {
//           return false;
//         }
//       })
//     });
//   });

$(function() {
    $('.genre_delete').off('click');
    $(".genre_delete").on('click', function(e) {
        e.preventDefault();
         var clickEle = $(this)
        // // 削除ボタンにユーザーIDをカスタムデータとして埋め込。
        var genreID = clickEle.val();
        $.ajax({
            url: '../genres/' + genreID,
            type: 'DELETE',
          data: {'id': genreID}, // DELETE リクエストだよ！と教えてあげる。
          dataType: 'json'
        ,
        success: function(res) {
            // 親要素のspanを削除
            clickEle.parents('span').remove();
        },
        error: function(res) {
            alert('エラー');
        }
    })
    });
});

$(function($){
    $(document).on('click',".genre_delete2", function(e) {
        e.preventDefault();
        var clickEle = $(this)
        // 削除ボタンにユーザーIDをカスタムデータとして埋め込。
        var genreID = clickEle.val();
        $.ajax({
            url: '../genres/' + genreID,
            type: 'DELETE',
            data: {'id': genreID}, // DELETE リクエストだよ！と教えてあげる。
            dataType: 'json'
            ,
            success: function(res) {
                // 親要素のspanを削除
                clickEle.parents('span').remove();
            },
            error: function(res) {
            }
        })
    });
});

//   $.ajaxSetup({
//     headers: {
//       'X-CSRF-TOKEN': $('meta[name="token"]').attr('content')
//     }
//   });
  
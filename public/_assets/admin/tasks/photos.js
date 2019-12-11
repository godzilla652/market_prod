$(document).ready(function() {

  /*****************img 1******************/
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        $('#thumbnail_wrap').show()
        $('#task_thumbnail').attr('src', e.target.result);
        $('#task_gallery').attr('href', e.target.result);
        $('#task_reset').show();
        $('#task_thumbnail').addClass('insert-img');
        $('#task_delete_photo').prop('checked', false);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $('#task_reset').click(function() {
    $('#task_photo').value = "";
    $('#thumbnail_wrap').hide();
    $('#task_thumbnail').attr('src', '');
    $('#task_gallery').attr('href', '');
    $('#task_reset').hide();
    $('#task_thumbnail').removeClass('insert-img');
  })
  $("#task_photo").change(function() {
    readURL(this);
  });

  /*****************img 2******************/
  function readURL1(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        $('#thumbnail_wrap1').show()
        $('#task_thumbnail1').attr('src', e.target.result);
        $('#task_gallery1').attr('href', e.target.result);
        $('#task_reset1').show();
        $('#task_thumbnail1').addClass('insert-img');
        $('#task_delete_photo').prop('checked', false);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $('#task_reset1').click(function() {
    $('#task_photo1').value = "";
    $('#thumbnail_wrap1').hide();
    $('#task_thumbnail1').attr('src', '');
    $('#task_gallery1').attr('href', '');
    $('#task_reset1').hide();
    $('#task_thumbnail1').removeClass('insert-img');
  })
  $("#task_photo1").change(function() {
    readURL1(this);
  });
  /*****************img 3******************/
  function readURL2(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        $('#thumbnail_wrap2').show()
        $('#task_thumbnail2').attr('src', e.target.result);
        $('#task_gallery2').attr('href', e.target.result);
        $('#task_reset2').show();
        $('#task_thumbnail2').addClass('insert-img');
        $('#task_delete_photo').prop('checked', false);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $('#task_reset2').click(function() {
    $('#task_photo2').value = "";
    $('#thumbnail_wrap2').hide();
    $('#task_thumbnail2').attr('src', '');
    $('#task_gallery2').attr('href', '');
    $('#task_reset2').hide();
    $('#task_thumbnail2').removeClass('insert-img');
  })
  $("#task_photo2").change(function() {
    readURL2(this);
  });
  /*****************img 4******************/
  function readURL3(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        $('#thumbnail_wrap3').show()
        $('#task_thumbnail3').attr('src', e.target.result);
        $('#task_gallery3').attr('href', e.target.result);
        $('#task_reset3').show();
        $('#task_thumbnail3').addClass('insert-img');
        $('#task_delete_photo').prop('checked', false);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $('#task_reset3').click(function() {
    $('#task_photo3').value = "";
    $('#thumbnail_wrap3').hide();
    $('#task_thumbnail3').attr('src', '');
    $('#task_gallery3').attr('href', '');
    $('#task_reset3').hide();
    $('#task_thumbnail3').removeClass('insert-img');
  })
  $("#task_photo3").change(function() {
    readURL3(this);
  });

});


/**************Image Counter*******************/
$(document).ready(function() {
  var countImg = 0;

  $('.thumbnail').each(function() {
    if ($(this).attr('src')) {
      $(this).addClass('insert-img');
      countImg = 4 - $('.insert-img').length;
      $('#cont_img').text(countImg);
    }
  })

  $('.file-reset').click(function() {
    countImg = 4 - $('.insert-img').length;
    $('#cont_img').text(countImg);
  })
  $('.task-photo').change(function() {
    setTimeout(function() {
      countImg = 4 - $('.insert-img').length;
      $('#cont_img').text(countImg);
    }, 300);

  })
});

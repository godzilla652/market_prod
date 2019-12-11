/*****************Select category*******************/
$(document).ready(function() {
  
  updateUsers($('#category_select').val(), $('#city_select').val());
  
  $('#category_select').change(function(){
    updateUsers($(this).val(), $('#city_select').val());
  })
  $('#city_select').change(function(){
    updateUsers($('#category_select').val(), $(this).val());
    
  })
});


function updateUsers(catVal, cityName){
  $.getJSON("/admin/users", {type_work: catVal, city: cityName}, function(data){
    
    var contractors = data;
    $('#task_concierge_id').find('option').remove().end();


    $.each(contractors, function(index, contractor){
      $('#task_concierge_id').append($("<option></option>").attr("value", contractor.user.id).attr("data-gst", contractor.user.gst_percent).text(contractor.user.full_name));
    });
    countBudget();
  })
}


$('#task_concierge_id').change(function(){
  // var contractorGst = $(this).find(':selected').attr('data-gst')
  // console.log(contractorGst)

  // var task_budget = $('#task_budget').val();

  // var sales_tax = 0;
  // var task_total = 0;

  // let page_variables = document.getElementById('page_variables');
  // let line_sum = parseFloat(page_variables.dataset.line_sum);
  // var gst_tax = task_budget * contractorGst/100;

  // var gst_taxNew = gst_tax.toFixed(2);
  // gst_taxNew = parseFloat(gst_taxNew);

  // task_budget = parseFloat(task_budget);

  // task_total = task_budget + gst_taxNew;
  // task_total = task_total.toFixed(2);

  // $('#gst_tax').html(gst_taxNew);
  // if(isNaN(task_total)) {
  //   $('#task_total').html('0.00');
  // }
  // else{
  //   $('#task_total').html(task_total);
  // }

  countBudget();


})


/*********** Budget ******************/

function countBudget(){
  if($('#task_concierge_id option:selected').length > 0){
    var task_budget = $('#task_budget').val();
    var sales_tax = 0;
    var task_total = 0;

    let page_variables = document.getElementById('page_variables');
    let line_sum = parseFloat(page_variables.dataset.line_sum);
    // var gst_tax = task_budget * 5/100;
    var contractorGst = $('#task_concierge_id').find(':selected').attr('data-gst');
    var gst_tax = task_budget * contractorGst/100;


    var gst_taxNew = gst_tax.toFixed(2);
    gst_taxNew = parseFloat(gst_taxNew);
    var gst_taxNew2 = gst_taxNew.toFixed(2);

    task_budget = parseFloat(task_budget);

    task_total = task_budget + gst_taxNew;
    task_total = task_total.toFixed(2);

    $('#gst_tax').html(gst_taxNew2);
    if(isNaN(task_total)) {
      $('#task_total').html('0.00');
    }
    else{
      $('#task_total').html(task_total);
    }

    console.log($('#task_concierge_id').find(':selected').val())
  }
  else if($('#task_concierge_id option').length == 0){
    var task_budget = $('#task_budget').val();
    var sales_tax = 0;
    var task_total = 0;

    let page_variables = document.getElementById('page_variables');
    let line_sum = parseFloat(page_variables.dataset.line_sum);
    
    var gst_tax = task_budget * 5/100;

    var gst_taxNew = gst_tax.toFixed(2);
    gst_taxNew = parseFloat(gst_taxNew);
    var gst_taxNew2 = gst_taxNew.toFixed(2);

    task_budget = parseFloat(task_budget);

    task_total = task_budget + gst_taxNew;
    task_total = task_total.toFixed(2);

    $('#gst_tax').html(gst_taxNew2);
    if(isNaN(task_total)) {
      $('#task_total').html('0.00');
    }
    else{
      $('#task_total').html(task_total);
    }
  }
  else{
    var task_budget = $('#task_budget').val();
    var sales_tax = 0;
    var task_total = 0;

    let page_variables = document.getElementById('page_variables');
    let line_sum = parseFloat(page_variables.dataset.line_sum);
    
    var gst_tax = task_budget * 5/100;

    var gst_taxNew = gst_tax.toFixed(2);
    gst_taxNew = parseFloat(gst_taxNew);
    var gst_taxNew2 = gst_taxNew.toFixed(2);

    task_budget = parseFloat(task_budget);

    task_total = task_budget + gst_taxNew;
    task_total = task_total.toFixed(2);

    $('#gst_tax').html(gst_taxNew2);
    if(isNaN(task_total)) {
      $('#task_total').html('0.00');
    }
    else{
      $('#task_total').html(task_total);
    }
  }
}
$(document).ready(function() {
  $('#task_budget').keyup(function() {
    countBudget();
  });
});

/****************************************/
$(document).ready(function() {
  // $('#form-submit-btn').prop('disabled', true);
  console.log('test2')

  $('#task_tender').addClass('check-field');

  if ($('#task_tender').is(':checked')) {
    $('#task_concierge_id').prop('disabled', true);
    $('#task_concierge_id').val('');
    $('#task_concierge_id').removeClass('req-field');
    $('#req-mark').hide();
  } else {
    $('#task_concierge_id').prop('disabled', false);
    $('#task_concierge_id').addClass('req-field');
    $('#req-mark').show();
  }

  $('#task_tender').change(function() {
    if ($(this).is(':checked')) {
      $('#task_concierge_id').prop('disabled', true);
      $('#task_concierge_id').val('');
      $('#task_concierge_id').prop('required', false);
      $('#task_concierge_id').removeClass('req-field');
      $('#task_concierge_id').prev('label').css({
        'opacity': '0.5'
      });
      $('#req-mark').hide();
    } else {
      $('#task_concierge_id').prop('disabled', false);
      $('#task_concierge_id').addClass('req-field');
      $('#task_concierge_id').prev('label').css({
        'opacity': '1'
      })
      $('#req-mark').show();
    }
  });

  $('.from-project-btn').click(function(){
    var projectAddress = $('.project-address').text();

    $('#task_place_attributes_address').val(projectAddress);

    var titleVal = $('#task_title').val().length;
    var addressVal = $('#task_place_attributes_address').val().length;
    var dateVal = $('#datepicker-1').val().length;
    var dateVal2 = $('#datepicker-2').val().length;
    var budgetVal = $('#task_budget').val() > 0;

    if ($('#task_concierge_id').hasClass('req-field')) {
      if (titleVal && addressVal && dateVal && dateVal2 && budgetVal && $('#task_concierge_id.req-field').val().length && $('.chosen-single span').html() != 'Set category') {
        $('#task-form-submit-btn').prop('disabled', false);
      } else {
        $('#task-form-submit-btn').prop('disabled', true);
      }
    } else {
      if (titleVal && addressVal && dateVal && dateVal2 && budgetVal && $('.chosen-single span').html() != 'Set category') {
        $('#task-form-submit-btn').prop('disabled', false);
      } else {
        $('#task-form-submit-btn').prop('disabled', true);
      }
    }
  })

  $('.req-field').on('change keypress input', function(){
    $('.req-field').each(function() {
      var fieldVal = $(this).val().length;
      if(fieldVal && $('.chosen-single span').html() != 'Set category'){
        $('#task-form-submit-btn').prop('disabled', false);
      }
    })
  })

  $('.check-field').on('change keypress input', function(){
    var titleVal = $('#task_title').val().length;
    var addressVal = $('#task_place_attributes_address').val().length;
    var dateVal = $('#datepicker-1').val().length;
    var dateVal2 = $('#datepicker-2').val().length;
    var budgetVal = $('#task_budget').val() > 0;

    if ($('#task_concierge_id').hasClass('req-field')) {
      if (titleVal && addressVal && dateVal && dateVal2 && budgetVal && $('#task_concierge_id.req-field').val().length && $('.chosen-single span').html() != 'Set category') {
        $('#task-form-submit-btn').prop('disabled', false);
      } else {
        $('#task-form-submit-btn').prop('disabled', true);
      }
    } else {
      if (titleVal && addressVal && dateVal && dateVal2 && budgetVal && $('.chosen-single span').html() != 'Set category') {
        $('#task-form-submit-btn').prop('disabled', false);
      } else {
        $('#task-form-submit-btn').prop('disabled', true);
      }
    }
  })
});



/****************Modal map*****************/
$(document).ready(function() {

  $('.address-btn').click(function() {
    $('#modal-map').show();
  })

  $(document).keyup(function(e) {
    if (e.keyCode === 27) {
      $('#modal-map').hide();
    }
  });

  $('.modal-close-btn').click(function() {
    $('#modal-map').hide();
  })

});


/**************** Attach File *****************/
// var selDiv = "";
// var storedFiles = [];
    
//     $(document).ready(function() {
//       $("#fileupload").click(function(){
//             $("#files").click();
//         });
//         $("#files").on("change", handleFileSelect);
        
//         selDiv = $(".fileupload-list");

//         $("body").on("click", ".destroy_doc", removeFile);
//     });
        
//     function handleFileSelect(e) {
//         var files = e.target.files;
//         var filesArr = Array.prototype.slice.call(files);
//         filesArr.forEach(function(f) {          

//           var ext = f.name.split('.').pop();     
          
//           storedFiles.push(f);

//           var reader = new FileReader();
//           reader.onload = function (e) {
//             var html = '<li><img src="/img/metal-paper-clip.svg"><span class=name>' + f.name + '</span> <span class="destroy_doc">X</span><br></li>';
//             selDiv.append(html);
//           }
//           reader.readAsDataURL(f);
             
//           console.log(storedFiles);
//         });
        
//     }

//     function removeFile(e) {
//     var ele = $(e.target).parent().find(".name")[0]
//         var file = ele.innerText;
//         for(var i=0;i<storedFiles.length;i++) {
//             if(storedFiles[i].name === file) {
//                 storedFiles.splice(i,1);
//                 break;
//             }
//         }
//         $(this).parent().remove();
//         console.log(storedFiles);
//     }

$(document).ready(function() {
  $("#fileupload").click(function(){
    $('.fileupload-list').append('<div class="fileupload-list__item"><label></label><input class="files" type="file" name="task[documents][]"></div>');
    $('.files').eq(-1).click().change(function(e){
        var fileName = e.target.files[0].name; 
        $(this).prev('label').html('<img src="/img/metal-paper-clip.svg"> ' + fileName + ' <span class="destroy_doc">X</span>');
    });
  });

  $(document).on('click', '.destroy_doc', function(){
    console.log($(this).parent('.fileupload-list__item'));
    $(this).closest('.fileupload-list__item').remove()
  })
  
       
});
$(function(){
  $('.project-table').tablesorter();

  $('#confirm-delete').on('show.bs.modal', function(e) {
    let deleting_resource = $(e.relatedTarget).data('deleting_resource')
    $(this).find('.btn-confirm-delete').on('click', function(e) {
      $(`#${deleting_resource}`).click();
    });
  });
});

/*********** Add Change Order **************/
$(document).ready(function() {

  $('#task_budget3').keyup(function() {
    var task_budget3 = $('#task_budget3').val();
    var gst_tax_value = $('#gst_tax_value').val()
    var sales_tax = 0;
    var task_total = 0;

    var gst_tax = (task_budget3)*gst_tax_value/100;

    var gst_taxNew = gst_tax.toFixed(2);
    gst_taxNew = parseFloat(gst_taxNew);

    task_budget3 = parseFloat(task_budget3);

    task_total = (task_budget3 + gst_taxNew);
    task_total = task_total.toFixed(2);
    //task_total = parseFloat(task_total);

    $('#gst_tax3').html(gst_taxNew);
    if(isNaN(task_total)) {
      $('#task_total3').html('0.00');
    }
    else{
      $('#task_total3').html(task_total);
    }
  });
});

/*********** Edit Change Order **************/
// $(document).ready(function() {
//   $('#eco_gst_tax').text('5%');

//   $('#eco_task_budget').keyup(function() {
//     var eco_task_budget = $('#eco_task_budget').val();

//     var sales_tax = 0;
//     var task_total = 0;

//     var gst_tax = (eco_task_budget)*5/100;

//     var gst_taxNew = gst_tax.toFixed(2);
//     gst_taxNew = parseFloat(gst_taxNew);

//     eco_task_budget = parseFloat(eco_task_budget);

//     task_total = (eco_task_budget + gst_taxNew);
//     task_total = task_total.toFixed(2);
//     task_total = parseFloat(task_total);

//     $('#eco_gst_tax').html(gst_taxNew);
//     $('#eco_task_total').html(task_total);
//   });
// });

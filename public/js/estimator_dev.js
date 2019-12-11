$(document).ready(function(){
	$('.phone-mask').mask('(999) 999-9999');
});

$('.check-email').blur(function(){
    var reVal = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var emailVal = $(this).val();

      if(!reVal.test(emailVal)){
        $(this).next('.error-msg-general').remove();
        $(this).after('<p class="fw300 italic error-msg-general">Please enter valid email address (for example mail@example.com)</p>')
      }
      else{
        $(this).next('.error-msg-general').remove();
      }
});

$('.check-radio').change(function(){
	if($('#new-kitchen-1').is(':checked')){
		$('#paint-new-kitchen-1').prop('disabled', true);
		$('#paint-new-kitchen-1').prop('checked', false);
	}
	else{
		$('#paint-new-kitchen-1').prop('disabled', false);
	}
})
// $(document).ready(function () {
//     $('.check-number').prop('maxLength', 10);
// });
$(document).ready(function() {

  $('input[type=number][max]:not([max=""])').on('input', function(ev) {
    var $this = $(this);
    var maxlength = $this.attr('max').length;
    var value = $this.val();
    if (value && value.length >= maxlength) {
      $this.val(value.substr(0, maxlength));
    }
  });

});

$('.check-number').keypress(function(event){
	$(this).val($(this).val().replace(/[^\d].+/, ""));
    if ((event.which < 48 || event.which > 57)) {
        event.preventDefault();
    }
})

$('#estimator-form .required-field').change(function(){
	let cityVal = $('#city').val().length,
		addressVal = $('#address').val().length,
		nameVal = $('#name').val().length,
		phoneVal = $('#phone').val().length,
		emailVal = $('#email').val().length;


	if(cityVal && addressVal && nameVal && phoneVal && emailVal){
		$('#estimator-form .estimator-btn').prop('disabled', false);
	}
	else{
		$('#estimator-form .estimator-btn').prop('disabled', true);
	}
})

$('#estimator-chs-form .required-field').change(function(){
	let codeVal = $('#chs-code').val().length,
		unitVal = $('#chs-unit').val().length,
		addressVal = $('#chs-address').val().length,
		pmVal = $('#chs-project-manager').val().length,
		nameVal = $('#chs-name').val().length,
		phoneVal = $('#chs-phone').val().length,
		emailVal = $('#chs-email').val().length;


	if(codeVal && unitVal && addressVal && pmVal && nameVal && phoneVal && emailVal){
		$('#estimator-chs-form .estimator-btn').prop('disabled', false);
	}
	else{
		$('#estimator-chs-form .estimator-btn').prop('disabled', true);
	}
})



$('input[type=radio][name="estimator-chs[flooring]"]').change(function() {
  switch ($(this).val()) {
    case 'true':
      $('#flooring-hide').fadeIn('slow');
      break;
    case 'false':
      $('#flooring-hide').fadeOut('slow');
      break;
  }
});

$('input[type=radio][name="estimator-chs[tub-tile]"]').change(function() {
  switch ($(this).val()) {
    case 'true':
      $('#tub-tile-hide').fadeIn('slow');
      break;
    case 'false':
      $('#tub-tile-hide').fadeOut('slow');
      break;
  }
});

$('input[type=radio][name="estimator-chs[cabinetry]"]').change(function() {
  switch ($(this).val()) {
    case 'true':
      $('#cabinetry-hide').fadeIn('slow');
      break;
    case 'false':
      $('#cabinetry-hide').fadeOut('slow');
      break;
  }
});

$('input[type=radio][name="estimator-chs[interior]"]').change(function() {
  switch ($(this).val()) {
    case 'true':
      $('#interior-hide').fadeIn('slow');
      break;
    case 'false':
      $('#interior-hide').fadeOut('slow');
      break;
  }
});

$('input[type=radio][name="estimator-chs[paint]"]').change(function() {
  switch ($(this).val()) {
    case 'true':
      $('#paint-hide').fadeIn('slow');
      break;
    case 'false':
      $('#paint-hide').fadeOut('slow');
      break;
  }
});


$('#form-select').change(function() {
	if( $(this).val() == 'avenue-living' ){
		$('#estimator-form').fadeIn('slow');
      	$('#estimator-chs-form').hide();
	}
	else{
		$('#estimator-form').hide();
      	$('#estimator-chs-form').fadeIn('slow');
	}
});

$('.check-number').click(function(){
	if($(this).val() == 0){
		$(this).val('')
	}
})
$('.check-number').focusout(function(){
	if($(this).val() == ''){
		$(this).val('0')
	}
})



// $('.estimator-btn').click(function(){
// 		var name = $('#name').val();
// 		var email = $('#email').val();
// 		var phone = $('#phone').val();
// 		var comment = $('#comment').val();

// 		if(name.length==0){
// 			alert('Enter your name !');
// 		}else if(email.length==0){
// 			alert('Enter your email !');
// 		}else if(!validateEmail(email)){
// 			alert('Enter right email !');
// 		}else if(phone.length==0){
// 			alert('Enter your phone !');
// 		}else{
// 			$.post('php/mail.php',{name:name,email:email,phone:phone,comment:comment},function(data){
// 				$('#name').val("");
// 				$('#email').val("");
// 				$('#phone').val("");
// 				$('#comment').val("");
// 				alert('Thank you! Your message sent.');
// 			});
// 		}
		
// 	});



// function validateEmail(email) {
//     var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
//     return re.test(email);
// }
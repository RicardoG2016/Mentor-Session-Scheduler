$(document).ready(function() {
	$(function(){
	  $.datepicker.setDefaults(
	    $.extend( $.datepicker.regional[ '' ] )
	  );
	  $( '#datepicker' ).datepicker();
	});
});

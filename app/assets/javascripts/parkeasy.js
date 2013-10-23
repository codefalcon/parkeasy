$(document).ready(function() 
{
    $(function() 
    {
   	    $('.datetimepicker2').datetimepicker({
	      language: 'en',
	      pick12HourFormat: true
	    });
	    $('.datepicker2').datetimepicker({
	      language: 'en',
	      pickTime: false
	    });
	    $('.timepicker2').datetimepicker({
	      language: 'en',
	      pickDate: false,
	      pickSeconds: false,
	      pick12HourFormat: true
	    });
	 });
});
  
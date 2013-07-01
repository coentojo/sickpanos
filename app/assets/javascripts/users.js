$(document).ready(function(){
	$("#bg").height(window.innerHeight);
	
	$("#code").keyup(function(){
		console.log($(this).val());
		if($(this).val() === "imakesickpanos") {
			$("#signup").removeAttr("disabled");
		}
		else {
			$("#signup").attr('disabled', 'disabled');
		}
	});
});
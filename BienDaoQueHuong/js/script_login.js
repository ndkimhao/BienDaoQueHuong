$(document).ready(function(){
	$("#frmLogin").validate({
		rules: {
			txtUsername: {
				required: true,
				minlength: 6,
				maxlength: 16
			},
			txtPassword: {
				required: true,
				minlength: 6,
				maxlength: 16
			}
		}
	});
});
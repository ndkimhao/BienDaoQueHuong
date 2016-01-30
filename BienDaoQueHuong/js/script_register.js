function setAvatar(id){
	$("#imgAvatar").attr("src", "image/avatar/"+id+".png");
	$("#hidAvatarID").attr("value", id);
}

$(document).ready(function(){
	$("#frmRegister").validate({
		rules: {
			txtUsername: {
				required: true,
				minlength: 6,
				maxlength: 16,
				remote: "registerAJAXCheck.aspx"
			},
			txtPassword: {
				required: true,
				minlength: 6,
				maxlength: 16
			},
			txtConfirmPassword: {
				required: true,
				minlength: 6,
				maxlength: 16,
				equalTo: "#txtPassword"
			},
            txtEmail: {
				required: true,
				email: true,
				minlength: 6,
				maxlength: 50,
				remote: "registerAJAXCheck.aspx"
			},
			txtCharacterName: {
				required: true,
				minlength: 6,
				maxlength: 16
			}
		}
	});

	MAX_AVATAR = 26;
	currentAvatar = 1;
	$("#btnNextAvatar").click(function(){
    	currentAvatar++;
		if(currentAvatar > MAX_AVATAR){
			currentAvatar = 1;
		}
		setAvatar(currentAvatar);
	});
	$("#btnPreviousAvatar").click(function(){
    	currentAvatar--;
		if(currentAvatar == 0){
			currentAvatar = MAX_AVATAR;
		}
		setAvatar(currentAvatar);
	});
});
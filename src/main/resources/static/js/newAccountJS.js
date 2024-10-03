var captchacode = '';

function show() {
    captchacode = '';
    var character = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890';
	
    for (let i = 0; i < 6; i++) {
        var store = character.charAt(Math.floor(Math.random() * character.length));
        captchacode = captchacode + store;
    }
    document.getElementById('cap').innerHTML = captchacode;
}

function refreshCaptcha(event) {
    event.preventDefault();
    show();
}


function submitForm(event) {
    event.preventDefault();
    
    var enteredcaptchacode = document.getElementById('enteredcaptchacode').value.trim();
    var uname = document.getElementById('username').value;
    var pass = document.getElementById('password').value;
    var repass = $('#repassword').val();
	var role = $('input[name="role"]:checked').val();
	var email = $('#email').val();
	const token = document.querySelector('meta[name="_csrf"]').getAttribute('content');
	const header = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');
  
    if( (pass == repass) && (captchacode === enteredcaptchacode)){
		
		
		var data = {
			username : uname,
			password : pass,
			role : role,
			emailId : email
		}
		
		$.ajax({
			url: '/MeTime/newUser',
		    type: 'POST',
		    data: JSON.stringify(data),
		    contentType: 'application/json', 
		    headers : {[header]: token},
		    success: function(response) {
				document.getElementById('errorusername').innerHTML= "";
				document.getElementById('errorpass').innerHTML= "";
		        Swal.fire({
		            toast: true,
		            icon: 'success',
		            title: 'Account Created Successfully',
		            animation: false,
		            position: 'top',
		            showConfirmButton: false,  // Removed the confirm button
		            timer: 3000,  // Timer set to 3 seconds
		            timerProgressBar: true,
		            didOpen: (toast) => {
		                toast.addEventListener('mouseenter', Swal.stopTimer)
		                toast.addEventListener('mouseleave', Swal.resumeTimer)
		            },
		            willClose: () => {
		                window.location.href = "/MeTime/home";  // Redirect after timer ends
		            }
		        });
		    },
			error: function(xhr, status, error){
				
				if(xhr.status == 409){
					/*Swal.fire({
						    toast: true,
						    icon: 'error',
						    title: 'User Name already exists !!',
						    animation: false,
						    position: 'top-right',
						    showConfirmButton: false,
						    timer: 3000,
						    timerProgressBar: true,
						    didOpen: (toast) => {
						      toast.addEventListener('mouseenter', Swal.stopTimer)
						      toast.addEventListener('mouseleave', Swal.resumeTimer)
						    }
					});*/
					document.getElementById('errorusername').innerHTML= "Username already exists";
					document.getElementById('errorpass').innerHTML= "";
				}
				else{			
					Swal.fire({
							icon: 'error',
							title: 'ERROR',
							text: 'Something went wrong'
						});
					}
				}
		});
	}
	else if(pass!=repass){
		document.getElementById('errorpass').innerHTML = "Passwords don't match";
	}
	else if(captchacode != enteredcaptchacode){	
         Swal.fire({
			    toast: true,
			    icon: 'error',
			    title: 'Wrong Captcha',
			    animation: false,
			    position: 'center-right',
			    showConfirmButton: false,
			    timer: 3000,
			    timerProgressBar: true,
			    didOpen: (toast) => {
			      toast.addEventListener('mouseenter', Swal.stopTimer)
			      toast.addEventListener('mouseleave', Swal.resumeTimer)
			    }
		});
	}
}

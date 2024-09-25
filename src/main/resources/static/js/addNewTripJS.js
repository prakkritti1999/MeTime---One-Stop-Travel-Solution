/* $(function() {
	  $('input[name="journeyDate"]').daterangepicker({
		locale: {
		  format: 'DD-MM-YYYY'
		},
		opens: 'left'
	  });
	}); */



$(document).ready(function() {
	
	function getCsrfToken() {
	    const token = document.querySelector('meta[name="_csrf"]').getAttribute('content');
	    const header = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');
	    return { header: header, token: token };
	}
	// Handle form submission
	$('#addForm').on('submit', function(event) {
		event.preventDefault();  // Prevent the form from submitting the traditional way

		var id = $('#tripId').val();
		var od = $('#OD').val();
		var date = $('#journeyDate').val();
		var duration = $('#tripDuration').val();
		var category = $('#tripCategory').val();
		var charges = $('#tripCharges').val();
		var desc= document.getElementById('tripDesc').value;
		var imagepath = document.getElementById('tripImg').value;

		var formData = {
			trId: id,
			OD: od,
			journeyDate: date,
			tripDuration: duration,
			tripCategory: category,
			tripCharges: charges,
			imgpth : imagepath,
			desc :desc
		};

		const csrf = getCsrfToken();
		$.ajax({
			url: '/MeTime/addtrip',
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded',
			headers: {
	            [csrf.header]: csrf.token // Add CSRF token to the headers
	        },
			data: $.param(formData),
			success: function(response) {
				console.log(response);
				 Swal.fire({
					icon: 'success',
					title: 'Success',
					text: 'Trip Added !!!'
				}).then((result) => {
					if (result.isConfirmed) {
						window.location.href = '/MeTime/home';
					}
				});
		    },
			error: function(xhr, status, error) {
				console.log("xhr: " + xhr)
				console.log("status: " + status)
				console.log(error)
				
				if(xhr.status === 409){
					Swal.fire({
						icon: 'error',
						title: 'Error',
						text: 'Sorry !! Duplicate Entry for TripId ' + error
					});
				}
				else if(xhr.status == 403){
					Swal.fire({
		            toast: true,
		            icon: 'error',
		            title: 'Permission Denied !!',
		            text : 'You are not Authorized to Add New Trip..',
		            animation: false,
		            position: 'center-left',
		            showConfirmButton: false,  // Removed the confirm button
		            timer: 3000,  // Timer set to 3 seconds
		            timerProgressBar: true,
		            didOpen: (toast) => {
		                toast.addEventListener('mouseenter', Swal.stopTimer)
		                toast.addEventListener('mouseleave', Swal.resumeTimer)
		            }
            });
				}
			}
		});
	});
});

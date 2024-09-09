function openUpdateModal(tripId, OD, startDate, endDate, duration, category, charges) {
	$('#updateId').val(tripId);
	/*document.getElementById('updateId').value = tripId;*/
	$('#updateOD').val(OD);
	$('#journeyDate').val(startDate + '  to  ' + endDate);
	$('#updateDuration').val(duration);
	$('#updateCategory').val(category);
	$('#updateCharges').val(charges);
	$('#updateModal').modal('show');
}

function getCSRF(){
	var token = document.querySelector('meta[name="_csrf"]').getAttribute("content");
	var headers =  document.querySelector('meta[name="_csrf_header"]').getAttribute('content');
	return {
		headers : headers,
		csrf_token: token
	}
}

var csrf = getCSRF();
function updateTripsData() {
	//var updateForm = $('#updateForm').serialize();
	var id = $('#updateId').val();
	var charges = $('#updateCharges').val();
	var Od = $('#updateOD').val();
	var category = $('#updateCategory').val();
	$.ajax({
		url: '/MeTime/updatetrip/' + id,
		type: 'PUT',
		contentType: 'application/x-www-form-urlencoded',
		headers :{
			[csrf.headers] : [csrf.csrf_token]
		},
		data: {
			OD: Od,
			tripcategory: category,
			tripcharges: charges
		},
		success: function(response) {
			console.log("updateData.." + response);
			//var jsonResponse = JSON.parse(response);
			Swal.fire({
				icon: 'success',
				title: 'Success',
				text: 'Details Updated !!!'
			}).then((result) => {
				if (result.isConfirmed) {
					window.location.href = '/MeTime/home';
				}
			});
		},
		error: function(xhr, status, error) {
			console.log('Error updating trip: ' + error);
			Swal.fire({
		            toast: true,
		            icon: 'error',
		            title: 'Permission Denied !!',
		            text : 'You are not Authorized to Edit this..',
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
	});
}


function deleteData(id) {

	Swal.fire({
		title: 'Are you sure?',
		text: "You won't be able to revert this!",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Yes, delete it!',
		cancelButtonText: 'No, cancel!'
	}).then((result) => {
		if (result.isConfirmed) {
			// Proceed with delete operation if confirmed
			$.ajax({
				url: '/MeTime/deleteTrips/' + id,
				contentType: 'application/x-www-form-urlencoded',
				type : 'DELETE',
				headers:{
					[csrf.headers]:[csrf.csrf_token]
				},
				success: function(response) {
					console.log("deleteData.." + response);
					Swal.fire({
						icon: 'success',
						title: 'Deleted!',
						text: 'Trip Deleted!!'
					}).then((result) => {
						if (result.isConfirmed) {
							window.location.href = '/MeTime/home';
						}
					})
				},
				error: function(xhr, status, error) {
					Swal.fire({
						icon: 'error',
						title: 'Permission Denied',
						text: 'OOPS !! You are not Authorized to Delete this ' + error
					});
				}
			});
		}
	});
}

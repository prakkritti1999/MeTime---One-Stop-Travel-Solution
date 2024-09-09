function openDetailsModal(tripId, OD, startDate, endDate, duration, category, charges){
    /*$('#detailsModalLabel').text(tripId + ' - ' + category);*/
    document.getElementById('hiddenTripId').value = tripId;
    document.getElementById('detailsModalLabel').innerText = OD + ' ( ' + category + ' ) '; 
	$('#detailsModal').modal('show');
 }
 
 
 
 
 function downloadPDF() {
	
	var id = document.getElementById('detailsModalLabel').innerHTML.split(' - ')[1];
	var tripId = $('#hiddenTripId').val();
	//alert(tripId)
    var fileName =  'itinerary'+ tripId +'.pdf';
  //var Id = tripId;
    
    $.ajax({
        url: '/MeTime/downloaditinerary',
        type: 'GET',
        data: { 
			filename: fileName,
			id : tripId 
		},
        xhrFields: {
            responseType: 'blob'  // Important to handle binary data
        },
        success: function(data) {
            var blob = new Blob([data], { type: 'application/pdf' });
            var url = window.URL.createObjectURL(blob);
            var a = document.createElement('a');
            a.href = url;
            a.download = fileName;
            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);

            Swal.fire({
		            toast: true,
		            icon: 'info',
		            title: 'Itinerary Downloaded !!',
		            animation: false,
		            position: 'top',
		            showConfirmButton: false,  // Removed the confirm button
		            timer: 3000,  // Timer set to 3 seconds
		            timerProgressBar: true,
		            didOpen: (toast) => {
		                toast.addEventListener('mouseenter', Swal.stopTimer)
		                toast.addEventListener('mouseleave', Swal.resumeTimer)
		            }
            });
        },
        error: function() {
            swal.fire({
                icon: 'error',
                title: 'Error!',
                text: 'Could not download the PDF. Please try again later.'
            });
        }
    });
}



let items = document.querySelectorAll('.carousel .carousel-item')

		items.forEach((el) => {
			const minPerSlide = 4
			let next = el.nextElementSibling
			for (var i=1; i<minPerSlide; i++) {
				if (!next) {
            // wrap carousel by using first child
            next = items[0]
        }
        let cloneChild = next.cloneNode(true)
        el.appendChild(cloneChild.children[0])
        next = next.nextElementSibling
    }
})
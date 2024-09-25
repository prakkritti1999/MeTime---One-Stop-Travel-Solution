function payNow(charges, tripId){
	var amount = charges;
	var tripid=tripId;
	const token = document.querySelector('meta[name="_csrf"]').getAttribute('content');
	const header = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');
	
	$.ajax({
		
		url: "/MeTime/createorder",
		type: "POST",
		data : JSON.stringify({amount :amount, tripid:tripId}),
		contentType : 'application/json',
		dataType: 'json',
		headers : {[header]:token}, //add csrf token
		success : function(response){
			console.log(response)
			if(response.status == 'created'){	
				let options = {	
					key : 'rzp_test_ciwRhHLwsUuPyr',
					amount : response.amount,
					currency: 'INR',
					name : 'MeTime Trips Booking',						
					order_id : response.id,
					description : 'Bookings',
					image: '/images/rupee.jpg',
					handler : function(success){
						console.log(success.razorpay_payment_id)
						console.log(success.razorpay_order_id)
						console.log(success.razorpay_signature)
						console.log('payment done')					
						/*updatePaymentOnServer(
							success.amount, 
							success.razorpay_order_id, 
							success.status,
							tripid
						);	*/
						
						sendConfirmationEmail(tripid);
						Swal.fire({
						    title: 'Bookings Successful !!! You will recieve confirmation soon over mail',
						    fontWeight: '50',
						    imageUrl: '/images/thumbsup.jpeg', // URL of your custom icon					    imageWidth: 150,
							imageHeight: 150,						   
							imageAlt: 'Custom image',
							showConfirmButton: false
						});
					},
						
					prefill:{
						name: "",
						email:"",
						contact:""
					},
					notes:{
						address: "Razorpay Corporate Office",
					},
						
					theme:{
						color : "#3399cc"
					}
				};
				
				let rzp = new Razorpay(options);
				rzp.on("payment.failed", function(response){			
					alert(response.error.code);
				});
					
				rzp.open();
			}
			
		},
		error: function(error){
			alert("payment failed!! try again")
		}
	});
}


function sendConfirmationEmail(tripid){

	const token = document.querySelector('meta[name="_csrf"]').getAttribute('content');
	const header = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');
	const bookingData = {
        tripId: tripid,
    };
	
	$.ajax(
		{
			url: "/MeTime/sendConfirmationEmail",
			contentType: 'application/x-www-form-urlencoded',
			type: "POST",
			headers: {[header]:token},
			data : bookingData,	
			success: function(response){	
				alert("mail sent!!")
			},
			error: function(error){
				alert("mail failed!!")
			}
		}
	);
}
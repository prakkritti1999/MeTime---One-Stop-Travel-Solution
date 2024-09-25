function searchResults() {	
	var keyword = document.getElementById("searchInput").value;
	if (!keyword) {
		alert("Please enter a keyword");
		 $("div#AllCds").show();
		 $('#feedbackCarousel').show();
       	$("#searchDiv").empty(); // Clear the search results
        return;
	}
	//alert(keyword)
	$("div#AllCds").hide();
	$('#feedbackCarousel').hide();

	$.ajax({
		url: '/MeTime/getTrips/' + keyword,
		type: 'GET',
		dataType: 'json',
		success: function(data) {
			console.log("searchResults.."+JSON.stringify(data));
			if (!data || Object.keys(data).length === 0) {
			    $('#searchDiv').html('<div class="alert alert-danger">No Trips Available..Try Again...<i class="fa-solid fa-face-sad-cry"></i></div>');
			}
			else {
				console.log("data : " + JSON.stringify(data));
				var cardHTML= '';
				cardHTML += '<div class="row">'

				for (var i = 0; i < data.length; i++) {
					
					var item = data[i];
				/*
					console.log("ITme::" +item);
					console.log(typeof(item));*/
					console.log("ITEM:: "+JSON.stringify(item));
					cardHTML += '<div class="col-md-4 mb-3">';
					cardHTML += '<div class="card">';
					//cardHtml += '<img class="card-img-top" style="padding: 8px;">';
					cardHTML += '<div class="card-body">' ;
					cardHTML += '<h5 class="card-title">' + item.OD+ '</h5>';
					cardHTML += '<p class="card-text">' + item.category + '</p>';
					cardHTML += '<p class="card-text">' + item.duration + '&nbsp;&nbsp;'+item.charges + '/- onwards</p>';
					cardHTML += '<button type="submit" class="btn btn-primary" onclick="openModalDetails()"> Know More <i class="fa fa-arrow-right"></i></button>'; 
					cardHTML += '</div>';
					cardHTML += '</div>';
					cardHTML += '</div>';
				}
				cardHTML += '</div>'; 	
				$('#searchDiv').html(cardHTML);
			}			
			
		},
		error: function(xhr, status, error) {
			//alert(url);
			console.log("Status: " + status);
			console.log("Error: " + error);
			console.log("Response: " + xhr.responseText);
			console.log("ERROR: " + error);
			$('#searchDiv').html('<div class="alert alert-danger">An error occurred: ' + error + '</div>');
		}
	});
}
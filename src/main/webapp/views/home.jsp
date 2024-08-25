<%@page import="com.metime.dao.Trips"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>It's ME TIME NOW!!!!</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="/css/homeCSS.css">

</head>
<body>

<jsp:include page="navbar.jsp"></jsp:include>


<div class="container" style="padding-bottom: 50px;">
    <div class="row">
        <div class="col-md-12 text-right search-bar">
            <input type="text" id="searchInput" name="keyword" class="form-control" placeholder="Search Tours/Destinations....." style="max-width: 300px; display: inline-block;">
            <button type="button" class="btn btn-primary" onclick="searchResults()"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
        
        <div id="searchDiv"></div>
    </div>

    <div class="row" id="AllCds">
        <%  
            List<Trips> listofTrips = (List<Trips>) request.getAttribute("listofTrips");
            if (listofTrips.isEmpty()) {
                out.println("<div class='col-md-12'><h3 style='text-align: center;'>No Upcoming Trips found.");
                out.println("<a href='/MeTime/addForm' style='color: black;'>Add a New Trip</a>");
                out.println("</h3></div>");
            } else {
                int index = 1;
                for (Trips trips : listofTrips) {
                    String imagePath = "/images/" + index + ".jpeg";
                    out.println("<div class='col-md-3 mb-3'>");
                        out.println("<div class='card'>");
                            out.println("<img class='card-img-top' style='padding: 8px; height: 200px;' src='" + imagePath + "' alt='Trip Image'>");
                            out.println("<div class='card-body'>");
                                out.println("<h5 class='card-title'>" + trips.getOD() + "</h5>");
                                out.println("<p class='card-text'>" + trips.getCategory() + "</p>");
                                out.println("<p class='card-text' style='justify-content: space-between;'>" + trips.getDuration() + "&nbsp&nbsp&nbsp&nbsp;" +trips.getCharges() + "/- onwards</p>");
                                /* out.println("<div class='row'>"); */
                                out.println("<button type='submit' class='btn btn-primary' onclick=\"openDetailsModal('" + trips.getTripId() + "', '" + trips.getOD() + "', '" + trips.getStartDate() + "', '" + trips.getEndDate() + "', '" + trips.getDuration() + "', '" + trips.getCategory() + "', '" + trips.getCharges() + "')\">Know More <i class='fa fa-arrow-right'></i></button>");
                                out.println("<button type='submit' class='btn' data-bs-toggle='tooltip' data-bs-placement='top' title='Remove' onclick='deleteData(\"" + trips.getTripId() + "\")'><i class='fa fa-trash'></i></button>");
                                out.println("<button type='submit' class='btn' data-bs-toggle='tooltip' data-bs-placement='top' title='Edit'  onclick=\"openUpdateModal('" + trips.getTripId() + "', '" + trips.getOD() + "', '" + trips.getStartDate() + "', '" + trips.getEndDate() + "', '" + trips.getDuration() + "', '" + trips.getCategory() + "', '" + trips.getCharges() + "')\"><i class='fa fa-pen-to-square'></i></button>");
                                /* out.println("</div>");  */   
                            out.println("</div>");
                        out.println("</div>");
                    out.println("</div>");
                    
                    index++;
                }
            }
        %>
    </div>
</div>


<!-- Details Modal -->
<div class="modal fade" id="detailsModal" tabindex="-1" role="dialog" aria-labelledby="detailsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="detailsModalLabel">Amazing Trip Details</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="detailsContent">
            <input type="hidden" id="hiddenTripId" value="">
                <p>This is an amazing trip with a well-planned itinerary that will take you through the most beautiful places. The journey includes a stay in luxurious accommodations, guided tours, and exciting activities that cater to all interests. Experience the best of nature, culture, and adventure, and create lasting memories with this trip. Explore scenic landscapes, historical landmarks, and local cuisine, all while enjoying the comfort and convenience of a well-organized travel plan. This trip is perfect for those looking for a blend of relaxation and exploration, offering something special for every traveler.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum. Aenean ut orci vitae nunc fringilla pharetra. Duis gravida nunc ac fringilla pretium. Proin cursus auctor justo, non tincidunt ante laoreet a. Suspendisse potenti. Nam tempor, lectus sed consectetur varius, nisi augue tincidunt nulla, a pellentesque arcu dolor a lacus. Curabitur sed velit ut justo varius tincidunt. Integer ac risus et ex cursus auctor.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="downloadPDF()">Download Itinerary</button>
            	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



<!-- 	Update Records Modal-->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
	aria-labelledby="updateModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="updateModalLabel">---- Update
					Trips As Required ----</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="updateForm">
					<div class="form-group mb-3">
						<label for="updateId">ID</label> <input type="text"
							class="form-control" id="updateId" name="updateId" required
							disabled>
					</div>
					<div class="form-group mb-3">
						<label for="updateOD">Source - Destination</label> <input
							type="text" class="form-control" id="updateOD" name="updateOD"
							required>
					</div>

					<div class="form-group mb-3">
						<label for="journeyDate" class="form-label" for="journeyDate">Journey
							Date</label> <input type="text" class="form-control" id="journeyDate"
							name="journeyDate" placeholder="Enter date of journey"
							disabled="disabled">
					</div>

					<div class="form-group mb-3">
						<label for="updateDuration">Duration</label> <input type="text"
							class="form-control" id="updateDuration" name="updateDuration"
							disabled="disabled">
					</div>
					<div class="form-group mb-3">
						<label for="updateCategory">Category</label> <input type="text"
							class="form-control" id="updateCategory" name="updateCategory"
							required>
					</div>
					<div class="form-group mb-3">
						<label for="updateCharges">Charges</label> <input type="text"
							class="form-control" id="updateCharges" name="updateCharges"
							required>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary"
					onclick="updateTripsData();">Save changes</button>
			</div>
		</div>
	</div>
</div>



<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/homeSearchJS.js"></script>

<script type="text/javascript" src="/js/homeModalJS.js"></script>
<script src="/js/displayJS.js"></script>
</body>
</html>

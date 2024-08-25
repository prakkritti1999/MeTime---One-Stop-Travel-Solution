<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.List"%>
<%@page import="com.metime.dao.Trips"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>All Trips</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<jsp:include page="headers.jsp"></jsp:include>

</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<%
	List<Trips> listofTrips = (List<Trips>) request.getAttribute("listofTrips");
	if (listofTrips.isEmpty()) {
		out.println("<h3 style='align-items : center;'>No Upcoming Trips found.");
		out.println("<a href='/MeTime/addForm' style='color: black;'>Add a New Trip</a>");

		out.println("</h3>");
	} else {
		out.println(
		"<table class='table table-responsive table-bordered border-success table-striped table-hover table-success'>");
		out.println("<thead class='table-dark'>");
		out.println("<tr>");
		out.println("<td>Trip ID</td>");
		out.println("<td>Source - Destination</td>");
		out.println("<td>Journey Date</td>");
		out.println("<td>Duration of Trip</td>");
		out.println("<td>Category</td>");
		out.println("<td>Charges</td>");
		out.println("<td></td>");
		out.println("<td></td>");
		out.println("</tr>");
		out.println("</thead>");
		
		for (Trips trips : listofTrips) {
			out.println("<tbody>");
			out.println("<tr>");

			out.println("<td>" + trips.getTripId() + "</td>");
			out.println("<td>" + trips.getOD() + "</td>");
			out.println("<td>" + trips.getStartDate() + "&nbsp to &nbsp " + trips.getEndDate() + "</td>");
			out.println("<td>" + trips.getDuration() + "</td>");
			out.println("<td>" + trips.getCategory() + "</td>");
			out.println("<td>" + trips.getCharges() + "/- per person" + "</td>");

			out.println("<td>");
			out.println("<a data-bs-toggle='tooltip' data-bs-placement='top' title='Update' href='#'>"
					+"<button class='btn btn-success' onclick=\"openUpdateModal('" + trips.getTripId() + "', '" + trips.getOD() + "', '" + trips.getStartDate() + "', '" + trips.getEndDate() + "', '" + trips.getDuration() + "', '" + trips.getCategory() + "', '" + trips.getCharges() + "')\"><i class='glyphicon glyphicon-ok'></i></button>" + "</a>");
			out.println("</td>");

			out.println("<td>");
			/* out.println("<form action='deleteTrips/" + trips.getTripId() + "' method='GET'>"); */
			out.println("<a data-bs-toggle='tooltip' data-bs-placement='top' title='Remove' href='#'>"
			    + "<button class='btn btn-danger' onclick='deleteData(\"" + trips.getTripId() + "\")'><i class='glyphicon glyphicon-remove'></i></button>"
			    + "</a>");


			out.println("</tr>");
			out.println("</tbody>");
		}
		out.println("</table>");
	}
	%>
	
	
	<!-- 	Update Records Modal-->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">---- Update Trips As Required ----</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="updateForm">
                        <div class="form-group mb-3">
                            <label for="updateId">ID</label>
                            <input type="text" class="form-control" id="updateId" name="updateId" required disabled>
                        </div>
                        <div class="form-group mb-3">
                            <label for="updateOD">Source - Destination</label>
                            <input type="text" class="form-control" id="updateOD" name="updateOD" required>
                        </div>
                        
                        <div class="form-group mb-3">
                             <label for="journeyDate" class="form-label" for="journeyDate">Journey Date</label>
                             <input type="text" class="form-control" id="journeyDate" name="journeyDate" placeholder="Enter date of journey" disabled="disabled">
                        </div>
                        
                        <div class="form-group mb-3">
                            <label for="updateDuration">Duration</label>
                            <input type="text" class="form-control" id="updateDuration" name="updateDuration" disabled="disabled">
                        </div>
                        <div class="form-group mb-3">
                            <label for="updateCategory">Category</label>
                            <input type="text" class="form-control" id="updateCategory" name="updateCategory" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="updateCharges">Charges</label>
                            <input type="text" class="form-control" id="updateCharges" name="updateCharges" required>
                        </div>
                    </form>
                </div>    
                <div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="updateTripsData();">Save changes</button>
				</div>
            </div>
        </div>
    </div>	
    
<jsp:include page="footer.jsp"></jsp:include>
</body>

<script src="/js/displayJS.js"></script>
</html>

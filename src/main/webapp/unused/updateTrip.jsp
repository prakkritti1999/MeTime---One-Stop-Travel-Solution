<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Trip Details</title>
<jsp:include page="headers.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>
	
	<div class="container" id="div2">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h2 id="h2">-- Update Trip Details As Required --</h2>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="/MeTime/updatetrip/<%= request.getParameter("tripId") %>">
                            <div class="mb-3">
                                <label for="tripId" class="form-label">Trip ID:</label>
                                <input type="text" class="form-control" id="tripId" name="tripId" value="<%= request.getParameter("tripId") %>" placeholder="Enter Unique six-character Trip ID Eg: MT2401" readonly="readonly">
                            </div>
                            <div class="mb-3">
                                <label for="OD" class="form-label">Source - Destination</label>
                                <input type="text" class="form-control" id="OD"  name="OD"  value = "<%= request.getParameter("OD") %>"  placeholder="Enter Starting and Ending Point" required="required">
                            </div>
                            <div class="mb-3">
                                <label for="journeyDate" class="form-label">Journey Date</label>
                                <input type="text" class="form-control" id="journeyDate" name="journeyDate"  value="<%= request.getParameter("startDate") + " - " + request.getParameter("endDate") %>"  placeholder="Enter date of journey" readonly="readonly">
                            </div>
                            <div class="mb-3">
                                <label for="tripDuration" class="form-label">Trip Duration</label>
                                <input type="text" class="form-control" id="tripDuration" name="tripDuration"  value="<%= request.getParameter("duration") %>" placeholder="Duration of trip" readonly="readonly">
                            </div>
                            <div class="mb-3">
                                <label for="tripCategory" class="form-label">Trip Category</label> 
                                <input type="text" class="form-control" id="tripCategory" name="tripcategory"  value="<%= request.getParameter("category") %>" placeholder="Category eg: Long Weekend trip" required="required">
                                
                            </div>
                            <div class="mb-3">
                                <label for="tripCharges" class="form-label">Trip Charges</label>
                                <input type="number" class="form-control" id="tripCharges" name="tripcharges" min="4000" max="6000"  value="<%= request.getParameter("charges") %>"  placeholder="Enter Charges per person" required="required">
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Update</button>
                        </form>
                    </div>    
                </div>          
            </div>
        </div>
    </div>
</body>
</html>
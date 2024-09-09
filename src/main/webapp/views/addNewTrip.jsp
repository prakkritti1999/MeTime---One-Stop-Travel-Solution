<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Trip Here...</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment/min/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/addform.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>


</head>
<body>
    <jsp:include page="navbar.jsp"></jsp:include>
    <div class="container" style="padding-bottom: 50px;">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h2 class="text-center">Add a New Trip</h2>
                    </div>
                    <div class="card-body">
                        <form id="addForm">
                            <div class="mb-3">
                                <label for="tripId" class="form-label">Trip ID:</label>
                                <input type="text" class="form-control" id="tripId" name="tripId" placeholder="Enter Unique six-character Trip ID Eg: MT2401" required>
                            </div>
                            <div class="mb-3">
                                <label for="OD" class="form-label">Source - Destination</label>
                                <input type="text" class="form-control" id="OD"  name="OD" placeholder="Enter Starting and Ending Point" required>
                            </div>
                            <div class="mb-3">
                                <label for="journeyDate" class="form-label">Journey Date</label>
                                <input type="text" class="form-control" id="journeyDate" name="journeyDate" placeholder="Enter Date of Journey" required>
                            </div>
                            <div class="mb-3">
                                <label for="tripDuration" class="form-label">Trip Duration</label>
                                <input type="text" class="form-control" id="tripDuration" name="tripDuration" placeholder="Enter Duration of trip" required>
                            </div>
                            <div class="mb-3">
                                <label for="tripCategory" class="form-label">Trip Category</label>
                                <select class="form-control" id="tripCategory" name="tripCategory" required>                                
                                    <option selected disabled>Select Category</option>                                
                                    <option value="Long Weekend Trip">Long Weekend Trip</option>
                                    <option value="Honeymoon Trip">Honeymoon Trip</option>
                                    <option value="Solo Travellers Trip">Solo Travellers Trip</option>
                                    <option value="Adventure Trip">Adventure Trip</option>
                                    <option value="Weekend Getaways">Weekend Getaways</option> 
                                    <option value="International Trip">International Trip</option>                           
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="tripCharges" class="form-label">Trip Charges</label>
                                <input type="number" class="form-control" id="tripCharges" name="tripCharges" min="6000" placeholder="Enter Charges per person" required>
                            </div>
                            
                            <button type="submit" class="btn btn-primary w-100">Add</button>
                        </form>
                    </div>    
                </div>          
            </div>
        </div>
    </div>
    
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/js/addNewTripJS.js"></script>
</html>

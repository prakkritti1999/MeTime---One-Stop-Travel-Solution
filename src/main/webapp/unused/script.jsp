<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

/*  const keyword = document.getElementById('searchInput').value.trim();
    const encodedKeyword = encodeURIComponent(keyword);
    const url = `/MeTime/getTrips/${encodedKeyword}`;
    console.log("Encoded Keyword:", encodedKeyword); 
    console.log("URL:", url); 

    fetch(url, {
        method: 'get'
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok ' + response.statusText);
        }
        return response.json();
    })
    .then(data => {
        console.log("Response data type:", typeof data);
        console.log("Response data:", data);

        // Check if the response is an array
        if (!Array.isArray(data)) {
            throw new Error('Expected an array but received ' + typeof data);
        }

        const trips = data; // Assuming data is the array of trips
        const searchDiv = document.getElementById('searchDiv');
        searchDiv.innerHTML = ''; // Clear previous results

        // Create table and populate it
        const table = document.createElement('table');
        table.setAttribute('class', 'table table-responsive table-striped table-dark');

        // Create table head
        const thead = table.createTHead();
        const headerRow = thead.insertRow();
        const headers = ['Trip ID', 'Source - Destination', 'Journey Date', 'Trip Duration', 'Category', 'Charges'];
        headers.forEach(headerText => {
            const th = document.createElement('th');
            th.textContent = headerText;
            headerRow.appendChild(th);
        });

        // Create table body
        const tbody = table.createTBody();
        trips.forEach(trip => {
            const row = tbody.insertRow();
            row.insertCell(0).textContent = trip.tripId;
            row.insertCell(1).textContent = trip.OD;
            row.insertCell(2).textContent = new Date(trip.startDate).toLocaleDateString(); // Format date
            row.insertCell(3).textContent = trip.duration;
            row.insertCell(4).textContent = trip.category;
            row.insertCell(5).textContent = trip.charges;
        });

        // Append table to the searchDiv
        searchDiv.appendChild(table);
    })
    .catch(error => {
        console.error('Fetch error:', error);
    }); */
}

</body>
</html>



























<!DOCTYPE html>
<html>
<head>
    <title>Submit MainModel Data</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control {
            border-radius: 0;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Submit MainModel Data</h1>
        <form id="userForm">
            <div class="form-group">
                <label for="crisGroup">Cris Group</label>
                <input type="text" class="form-control" id="crisGroup" name="crisGroup" placeholder="Enter Cris Group" required>
            </div>
            <div class="form-group">
                <label for="crisGm">Cris GM</label>
                <input type="text" class="form-control" id="crisGm" name="crisGm" placeholder="Enter Cris GM" required>
            </div>
            <div class="form-group">
                <label for="crisPpe">Cris PPE</label>
                <input type="text" class="form-control" id="crisPpe" name="crisPpe" placeholder="Enter Cris PPE" required>
            </div>
            <div class="form-group">
                <label for="crisGmAptDt">Cris GM Apt Date</label>
                <input type="date" class="form-control" id="crisGmAptDt" name="crisGmAptDt" required>
            </div>
            <button type="button" class="btn btn-primary" onclick="submitData();">Submit</button>
            <button type="button" class="btn btn-secondary" onclick="fetchData();">Show Data</button>
        </form>
        <div id="responseMessage" class="mt-3"></div>
        <div id="dataContainer" class="mt-3"></div>
    </div>

    <!-- Update Modal -->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">Update MainModel Data</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="updateForm">
                        <div class="form-group">
                            <label for="updateId">ID</label>
                            <input type="text" class="form-control" id="updateId" name="updateId" placeholder="Enter ID to Fetch Data" required>
                        </div>
                        <button type="button" class="btn btn-primary" onclick="fetchDataById();">Fetch Data</button>
                        <div id="updateFields" class="mt-3"></div>
                        <button type="button" class="btn btn-success" onclick="updateData();">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
    function submitData() {
        // Gather form data
        var crisGroup = $('#crisGroup').val();
        var crisGm = $('#crisGm').val();
        var crisPpe = $('#crisPpe').val();
        var crisGmAptDt = $('#crisGmAptDt').val();
        
        // Create URL-encoded data string
        var formData = $.param({
            crisGroup: crisGroup,
            crisGm: crisGm,
            crisPpe: crisPpe,
            crisGmAptDt: crisGmAptDt
        });

        // Send AJAX request
        $.ajax({
            url: '/CRIS/saveDt',
            type: 'POST',
            contentType: 'application/x-www-form-urlencoded',
            data: formData,
            success: function(response) {
                $('#responseMessage').html('<div class="alert alert-success">' + response + '</div>');
            },
            error: function(xhr, status, error) {
                $('#responseMessage').html('<div class="alert alert-danger">An error occurred: ' + error + '</div>');
            }
        });
    }

    function fetchData() {
        $.ajax({
            url: '/CRIS/showDt',
            type: 'GET',
            success: function(data) {
console.log("fetchData data.."+data);
                // Create table and header
                var tableHtml = '<table class="table table-bordered">';
                tableHtml += '<thead><tr><th>ID</th><th>Cris Group</th><th>Cris GM</th><th>Cris PPE</th><th>Cris GM Apt Date</th><th>Actions</th></tr></thead>';
                tableHtml += '<tbody>';

                // Iterate through data using a for loop
                for (var i = 0; i < data.length; i++) {
                    var item = data[i];
                    tableHtml += '<tr>';
                    tableHtml += '<td>' + item.crisId + '</td>';
                    tableHtml += '<td>' + item.crisGroup + '</td>';
                    tableHtml += '<td>' + item.crisGm + '</td>';
                    tableHtml += '<td>' + item.crisPpe + '</td>';
                    tableHtml += '<td>' + item.crisGmAptDt + '</td>';
                    tableHtml += '<td><button class="btn btn-warning btn-sm" onclick="openUpdateModal(' + item.id + ')">Update</button></td>';
                    tableHtml += '</tr>';
                }

                tableHtml += '</tbody></table>';
                $('#dataContainer').html(tableHtml);
            },
            error: function(xhr, status, error) {
                $('#dataContainer').html('<div class="alert alert-danger">An error occurred: ' + error + '</div>');
            }
        });
    }

    function openUpdateModal(id) {
        $('#updateId').val(id);
        $('#updateModal').modal('show');
    }

    function fetchDataById() {
        var id = $('#updateId').val();

        // Fetch data based on ID
        $.ajax({
            url: '/CRIS/getDataById/' + id,
            type: 'GET',
            success: function(data) {
                // Populate form fields with fetched data
                var formHtml = '<div class="form-group">' +
                    '<label for="crisGroup">Cris Group</label>' +
                    '<input type="text" class="form-control" id="crisGroup" name="crisGroup" value="' + data.crisGroup + '" required>' +
                    '</div>' +
                    '<div class="form-group">' +
                    '<label for="crisGm">Cris GM</label>' +
                    '<input type="text" class="form-control" id="crisGm" name="crisGm" value="' + data.crisGm + '" required>' +
                    '</div>' +
                    '<div class="form-group">' +
                    '<label for="crisPpe">Cris PPE</label>' +
                    '<input type="text" class="form-control" id="crisPpe" name="crisPpe" value="' + data.crisPpe + '" required>' +
                    '</div>' +
                    '<div class="form-group">' +
                    '<label for="crisGmAptDt">Cris GM Apt Date</label>' +
                    '<input type="date" class="form-control" id="crisGmAptDt" name="crisGmAptDt" value="' + data.crisGmAptDt + '" required>' +
                    '</div>';
                
                $('#updateFields').html(formHtml);
            },
            error: function(xhr, status, error) {
                $('#responseMessage').html('<div class="alert alert-danger">An error occurred while fetching data: ' + error + '</div>');
            }
        });
    }

    function updateData() {
        var id = $('#updateId').val();
        var crisGroup = $('#crisGroup').val();
        var crisGm = $('#crisGm').val();
        var crisPpe = $('#crisPpe').val();
        var crisGmAptDt = $('#crisGmAptDt').val();

        // Create URL-encoded data string
        var formData = $.param({
            crisGroup: crisGroup,
            crisGm: crisGm,
            crisPpe: crisPpe,
            crisGmAptDt: crisGmAptDt
        });

        // Send AJAX request to update data
        $.ajax({
            url: '/CRIS/updateDt/' + id,
            type: 'PUT',
            contentType: 'application/x-www-form-urlencoded',
            data: formData,
            success: function(response) {
                $('#responseMessage').html('<div class="alert alert-success">' + response + '</div>');
                $('#updateModal').modal('hide');
                fetchData(); // Refresh data table
            },
            error: function(xhr, status, error) {
                $('#responseMessage').html('<div class="alert alert-danger">An error occurred while updating data: ' + error + '</div>');
            }
        });
    }
    </script>
</body>
</html>



























<!DOCTYPE html>
<html>
<head>
    <title>Submit MainModel Data</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control {
            border-radius: 0;
        }
        .btn {
            border-radius: 20px;
        }
        .modal-content {
            border-radius: 15px;
        }
        .modal-header {
            background-color: #007bff;
            color: #fff;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Submit MainModel Data</h1>
        <form id="userForm">
            <div class="form-group">
                <label for="crisGroup">Cris Group</label>
                <input type="text" class="form-control" id="crisGroup" name="crisGroup" placeholder="Enter Cris Group" required>
            </div>
            <div class="form-group">
                <label for="crisGm">Cris GM</label>
                <input type="text" class="form-control" id="crisGm" name="crisGm" placeholder="Enter Cris GM" required>
            </div>
            <div class="form-group">
                <label for="crisPpe">Cris PPE</label>
                <input type="text" class="form-control" id="crisPpe" name="crisPpe" placeholder="Enter Cris PPE" required>
            </div>
            <div class="form-group">
                <label for="crisGmAptDt">Cris GM Apt Date</label>
                <input type="date" class="form-control" id="crisGmAptDt" name="crisGmAptDt" required>
            </div>
            <button type="button" class="btn btn-primary" onclick="submitData();">Submit</button>
            <button type="button" class="btn btn-secondary" onclick="fetchData();">Show Data</button>
        </form>
        <div id="responseMessage" class="mt-3"></div>
        <div id="dataContainer" class="mt-3"></div>
    </div>

    <!-- Update Modal -->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">Update MainModel Data</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="updateForm">
                        <div class="form-group">
                            <label for="updateId">ID</label>
                            <input type="text" class="form-control" id="updateId" name="updateId" placeholder="Enter ID to Fetch Data" required disabled>
                        </div>
                        <div class="form-group">
                            <label for="updateCrisGroup">Cris Group</label>
                            <input type="text" class="form-control" id="updateCrisGroup" name="updateCrisGroup" required>
                        </div>
                        <div class="form-group">
                            <label for="updateCrisGm">Cris GM</label>
                            <input type="text" class="form-control" id="updateCrisGm" name="updateCrisGm" readonly>
                        </div>
                        <div class="form-group">
                            <label for="updateCrisPpe">Cris PPE</label>
                            <input type="text" class="form-control" id="updateCrisPpe" name="updateCrisPpe" required>
                        </div>
                        <div class="form-group">
                            <label for="updateCrisGmAptDt">Cris GM Apt Date</label>
                            <input type="date" class="form-control" id="updateCrisGmAptDt" name="updateCrisGmAptDt" required>
                        </div>
                        <button type="button" class="btn btn-success" onclick="updateData();">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
    function submitData() {
    var crisGroup = $('#crisGroup').val();
    var crisGm = $('#crisGm').val();
    var crisPpe = $('#crisPpe').val();
    var crisGmAptDt = $('#crisGmAptDt').val();

    var formData = $.param({
        crisGroup: crisGroup,
        crisGm: crisGm,
        crisPpe: crisPpe,
        crisGmAptDt: crisGmAptDt
    });

    $.ajax({
        url: '/CRIS/saveDt',
        type: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        data: formData,
        success: function(response) {
console.log("submitData.." + response);
            var jsonResponse = JSON.parse(response);
            if (jsonResponse.status === 'success') {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: jsonResponse.message
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: jsonResponse.message
                });
            }
        },
        error: function(xhr, status, error) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'An error occurred while saving data: ' + error
            });
        }
    });
}


function fetchData() {
    $.ajax({
        url: '/CRIS/showDt',
        type: 'GET',
        success: function(data) {
            console.log("fetchData data:", data); // Log the data object directly

            // Create table and header
            var tableHtml = '<table class="table table-bordered">';
            tableHtml += '<thead><tr><th>ID</th><th>Cris Group</th><th>Cris GM</th><th>Cris PPE</th><th>Cris GM Apt Date</th><th>Actions</th></tr></thead>';
            tableHtml += '<tbody>';

            // Iterate through data
            for (var i = 0; i < data.length; i++) {
                var item = data[i];
                tableHtml += '<tr>';
                tableHtml += '<td>' + item.crisId + '</td>';
                tableHtml += '<td>' + item.crisGroup + '</td>';
                tableHtml += '<td>' + item.crisGm + '</td>';
                tableHtml += '<td>' + item.crisPpe + '</td>';
                tableHtml += '<td>' + item.crisGmAptDt + '</td>';
                tableHtml += '<td>';
                tableHtml += '<button class="btn btn-warning btn-sm" onclick="openUpdateModal(\''+ item.crisId +'\',\''+ item.crisGroup +'\',\''+ item.crisGm +'\',\''+ item.crisPpe +'\',\''+ item.crisGmAptDt +'\')">Update</button>';
                tableHtml += ' <button class="btn btn-danger btn-sm" onclick="deleteData(\''+ item.crisId +'\')">Delete</button>';
                tableHtml += '</td>';
                tableHtml += '</tr>';
            }

            tableHtml += '</tbody></table>';
            $('#dataContainer').html(tableHtml);
        },
        error: function(xhr, status, error) {
            $('#dataContainer').html('<div class="alert alert-danger">An error occurred: ' + error + '</div>');
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
                url: '/CRIS/delteDt/' + id,
                type: 'DELETE',
                success: function(response) {
               console.log("deleteData.." + response);
                    var jsonResponse = JSON.parse(response);
                    if (jsonResponse.status === 'success') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Deleted!',
                            text: jsonResponse.message
                        });
                        fetchData(); // Refresh data table
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: jsonResponse.message
                        });
                    }
                },
                error: function(xhr, status, error) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'An error occurred while deleting data: ' + error
                    });
                }
            });
        }
    });
}


    function openUpdateModal(id, crisGroup, crisGm, crisPpe, crisGmAptDt) {
        $('#updateId').val(id);
        $('#updateCrisGroup').val(crisGroup);
        $('#updateCrisGm').val(crisGm);
        $('#updateCrisPpe').val(crisPpe);
        $('#updateCrisGmAptDt').val(crisGmAptDt);
        $('#updateModal').modal('show');
    }

   function updateData() {
    var id = $('#updateId').val();
    var crisGroup = $('#updateCrisGroup').val();
    var crisGm = $('#updateCrisGm').val();
    var crisPpe = $('#updateCrisPpe').val();
    var crisGmAptDt = $('#updateCrisGmAptDt').val();

  alert("id.." + id);
  alert("crisGroup.." + crisGroup);
  alert("crisGm.." + crisGm);
  alert("crisPpe.." + crisPpe);
  alert("crisGmAptDt.." + crisGmAptDt);


    var formData = $.param({
        crisGroup: crisGroup,
        crisGm: crisGm,
        crisPpe: crisPpe,
        crisGmAptDt: crisGmAptDt
    });
  alert("Update.." +formData);
    $.ajax({
        url: '/CRIS/updateDt/' + id,
        type: 'PUT',
        contentType: 'application/x-www-form-urlencoded',
        data: formData,
        success: function(response) {
      console.log("updateData.." + response);
            var jsonResponse = JSON.parse(response);
            if (jsonResponse.status === 'success') {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: jsonResponse.message
                });
                $('#updateModal').modal('hide');
                fetchData(); // Refresh data table
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: jsonResponse.message
                });
            }
        },
        error: function(xhr, status, error) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'An error occurred while updating data: ' + error
            });
        }
    });
}

    </script>
</body>
</html>






















<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.List"%>
<%@page import="com.metime.dao.Trips"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Trips</title>
<jsp:include page="headers.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        "<table class='table table-responsive table-bordered border-success table-striped table-hover table-dark'>");
        out.println("<thead>");
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
            + "<button class='btn btn-success' onclick='updateTrips(" + trips.getTripId() + ", \"" + trips.getOD() + "\", \"" + trips.getStartDate() + "\", \"" + trips.getEndDate() + "\", \"" + trips.getDuration() + "\", \"" + trips.getCategory() + "\", " + trips.getCharges() + ")'><i class='glyphicon glyphicon-ok'></i></button>" + "</a>");
            out.println("</td>");

            out.println("<td>");
            out.println("<form action='deleteTrips/" + trips.getTripId() + "' method= 'GET'>");
            out.println("<a data-bs-toggle='tooltip' data-bs-placement='top' title='Remove' href='#'>"
            + "<button class='btn btn-danger'><i class='glyphicon glyphicon-remove'></i></button>" + "</a>");
            out.println("</form>");
            out.println("</td>");

            out.println("</tr>");
            out.println("</tbody>");
        }
        out.println("</table>");
    }
    %>
    
    <!-- Update Records Modal -->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">---- Update Trips As Required ----</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="updateForm">
                        <div class="form-group">
                            <label for="updateId">ID</label>
                            <input type="text" class="form-control" id="updateId" name="updateId" required disabled>
                        </div>
                        <div class="form-group">
                            <label for="updateOD">Source - Destination</label>
                            <input type="text" class="form-control" id="updateOD" name="updateOD" required>
                        </div>
                        <div class="form-group">
                            <label for="updateStartDate">Start Date</label>
                            <input type="date" class="form-control" id="updateStartDate" name="updateStartDate" required>
                        </div>
                        <div class="form-group">
                            <label for="updateEndDate">End Date</label>
                            <input type="date" class="form-control" id="updateEndDate" name="updateEndDate" required>
                        </div>
                        <div class="form-group">
                            <label for="updateDuration">Duration</label>
                            <input type="text" class="form-control" id="updateDuration" name="updateDuration" required>
                        </div>
                        <div class="form-group">
                            <label for="updateCategory">Category</label>
                            <input type="text" class="form-control" id="updateCategory" name="updateCategory" required>
                        </div>
                        <div class="form-group">
                            <label for="updateCharges">Charges</label>
                            <input type="number" class="form-control" id="updateCharges" name="updateCharges" required>
                        </div>
                        <button type="button" class="btn btn-success" onclick="updateData();">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>

<script>
    $(document).ready(function() {
        $('[data-toggle="tooltip"]').tooltip();
    });

    function updateTrips(tripId, OD, startDate, endDate, duration, category, charges) {
        $('#updateId').val(tripId);
        $('#updateOD').val(OD);
        $('#updateStartDate').val(startDate);
        $('#updateEndDate').val(endDate);
        $('#updateDuration').val(duration);
        $('#updateCategory').val(category);
        $('#updateCharges').val(charges);
        $('#updateModal').modal('show');
    }

    function updateData() {
        // Add your update logic here, such as an AJAX call to update the trip in the backend.
        var updatedTrip = {
            tripId: $('#updateId').val(),
            OD: $('#updateOD').val(),
            startDate: $('#updateStartDate').val(),
            endDate: $('#updateEndDate').val(),
            duration: $('#updateDuration').val(),
            category: $('#updateCategory').val(),
            charges: $('#updateCharges').val()
        };
        
        console.log("Updated Trip Data:", updatedTrip);
        // Make AJAX call to update the trip in the backend
        // $.ajax({
        //     url: '/MeTime/updateTrip', // Update this URL to your backend endpoint
        //     type: 'POST',
        //     data: JSON.stringify(updatedTrip),
        //     contentType: 'application/json',
        //     success: function(response) {
        //         console.log("Update successful:", response);
        //         $('#updateModal').modal('hide');
        //         // Optionally, refresh the trip list or show a success message
        //     },
        //     error: function(xhr, status, error) {
        //         console.error("Update failed:", error);
        //         // Optionally, show an error message
        //     }
        // });
    }
</script>
</html>

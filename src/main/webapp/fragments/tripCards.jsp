<%@page import="com.metime.dao.Feedback"%>
<%@page import="com.metime.dao.Trips"%>
<%@page import="java.util.List"%>


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
                    out.println("<div class='col-md-4 mb-4'>");
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
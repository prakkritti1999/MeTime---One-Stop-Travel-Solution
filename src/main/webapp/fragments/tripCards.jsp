<%@page import="java.util.Random"%>
<%@page import="com.metime.dao.TripDetails"%>
<%@page import="com.metime.dao.Feedback"%>
<%@page import="com.metime.dao.Trips"%>
<%@page import="java.util.List"%>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<div class="row" id="AllCds">
        <%  
            List<Trips> listofTrips = (List<Trips>) request.getAttribute("listofTrips");
        	List<TripDetails> listofTripDetails = (List<TripDetails>) request.getAttribute("tripDetails");
            if (listofTrips.isEmpty()) {
                out.println("<div class='col-md-12'><h3 style='text-align: center;'>No Upcoming Trips found.");
                out.println("<a href='/MeTime/addForm' style='color: black;'>Add a New Trip</a>");
                out.println("</h3></div>");
            } else {
                int index = 1;
                for (Trips trips : listofTrips) {
                    
                    TripDetails tripDetail = null;
	                for (TripDetails detail : listofTripDetails) {
	                    if (detail.getTrip().getTripId().equals(trips.getTripId())) {
	                        tripDetail = detail;
	                        break;
	                    }
	                }
	                
	                // Use the tripDetail to get the image path
	                String imagePath = "/images/smiley.jpeg"; // Fallback to default image

                    //String imagePath = tripDetail.getImagePath();
	                if (tripDetail != null && tripDetail.getImagePath() != null) {
	                	
	                	//to generate random images related to trip
	                	String selectedimage = tripDetail.getImagePath();
	                    String[] images = selectedimage.split(",");
	                    Random random = new Random();
	                    imagePath = images[random.nextInt(images.length)];
	                    
	                    out.println("<div class='col-md-4 mb-4'>");
	                        out.println("<div class='card'>");
	                            out.println("<img class='card-img-top' style='padding: 8px; height: 15rem; border-radius: 1.2rem;' src='" + imagePath + "' alt='Trip Image'>");
	                            out.println("<div class='card-body'>");
	                                out.println("<h5 class='card-title'>" + trips.getOD() + "</h5>");
	                                out.println("<p class='card-text'>" + trips.getCategory() + "</p>");
	                                out.println("<p class='card-text' style='justify-content: space-between;'>" + trips.getDuration() + "&nbsp&nbsp&nbsp&nbsp;" +trips.getCharges() + "/- onwards</p>");
	                                out.println("<button type='submit' class='btn btn-primary' onclick=\"openDetailsModal('" + trips.getTripId() + "', '" + tripDetail.getDesc() + "', '" + trips.getOD() + "','" + trips.getCharges() + "','" + trips.getStartDate() + "', '" + trips.getEndDate() + "', '" + trips.getDuration() + "', '" + trips.getCategory() + "', '" + trips.getCharges() +"')\">Know More <i class='fa fa-arrow-right'></i></button>");
	                                out.println("<button type='submit' class='btn' data-bs-toggle='tooltip' data-bs-placement='top' title='Remove' onclick='deleteData(\"" + trips.getTripId() + "\")'><i class='fa fa-trash'></i></button>");
	                                out.println("<button type='submit' class='btn' data-bs-toggle='tooltip' data-bs-placement='top' title='Edit'  onclick=\"openUpdateModal('" + trips.getTripId() + "', '" + tripDetail.getDesc() + "' ,  '" + tripDetail.getImagePath() + "' , '" + trips.getOD() + "', '" + trips.getStartDate() + "', '" + trips.getEndDate() + "', '" + trips.getDuration() + "', '" + trips.getCategory() + "', '" + trips.getCharges() + "')\"><i class='fa fa-pen-to-square'></i></button>"); 
	                                out.println("<button type='button' class='btn' style='background-color: orange; color:white;' onclick='payNow(\"" + trips.getCharges() + "\", \"" + trips.getTripId() + "\")'>" + "Book Now" + "</button>");
	                            out.println("</div>");
	                        out.println("</div>");
	                    out.println("</div>");
                	}
                }
            }
        %>
    </div>
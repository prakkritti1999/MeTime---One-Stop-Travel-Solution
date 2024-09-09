<%@page import="com.metime.dao.Feedback"%>
<%@page import="com.metime.dao.Trips"%>
<%@page import="java.util.List"%>


<div id="feedbackCarousel" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-inner">
		<% 
            List<Feedback> feedbackList = (List<Feedback>) request.getAttribute("userfeedbacks");
            boolean isActive = true;
            for (Feedback feedback : feedbackList) {
                String activeClass = isActive ? "active" : "";
                isActive = false;
        %>
		<% if(feedback.getRatings()>=3){ %>
		<div class="carousel-item <%=activeClass%>">
			<div class="feedback-content text-center">
				<h5 class="username"><%=feedback.getUser().getUsername()%></h5>
				<p class="ratings">
					<%
                        for (int i = 0; i < feedback.getRatings(); i++) {
                        %>
					<i class="fa fa-star"></i>
					<%
                         }
                        %>
				</p>
				<blockquote class="feedback-text">
					<p>
						<i class="fa-solid fa-quote-left"></i>&nbsp;&nbsp;<%= feedback.getReviews() %>&nbsp;&nbsp;<i class="fa-solid fa-quote-right"></i>
					</p>
					<footer class="text-muted"><%= feedback.getTimestamp() %></footer>
				</blockquote>
			</div>
		</div>
		<% }} %>
	</div>
	<a class="carousel-control-prev bg-transparent w-aut"
		href="#recipeCarousel" role="button" data-bs-slide="prev"> <span
		class="carousel-control-prev-icon" aria-hidden="true"></span>
	</a> <a class="carousel-control-next bg-transparent w-aut"
		href="#recipeCarousel" role="button" data-bs-slide="next"> <span
		class="carousel-control-next-icon" aria-hidden="true"></span>
	</a>
</div>
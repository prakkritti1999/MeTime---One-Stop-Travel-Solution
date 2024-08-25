<%@page import="com.metime.dao.Trips"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>It's ME TIME NOW!!!!</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
body {
    background-color: #8f4df8;
}
</style>

<link rel="stylesheet" type="text/css" href="/css/homeCSS.css">

</head>
<body>

<jsp:include page="navbar.jsp"></jsp:include>    

<div class="container">
    <div>
        <form>
            <div class="main-search-input-wrap">
                <div class="main-search-input fl-wrap">
                    <div class="main-search-input-item">
                        <input type="text" id="searchInput" name="keyword" placeholder="Search Tours/Destinations.....">
                    </div>
                    <button type="button" class="main-search-button" onclick="searchResults()">Search</button>
                </div>
            </div>
        </form>
    </div>
    <div class="searchDiv" id="searchDiv" style="margin: 15px;">
        <!-- Search results will be displayed here -->
    </div>
</div>

<script type="text/javascript" src="/js/homeJS.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>

<jsp:include page="headers.jsp"></jsp:include>

<link rel="stylesheet" href="/css/signup.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
</head>

<body onload="show()">

<jsp:include page="navbar.jsp"></jsp:include>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-header">
                    <h2>Create New Account</h2>
                </div>
                <div class="card-body">
                    <form id="newAccount" onsubmit="submitForm(event)" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">User Name:</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password:</label>
                            <input type="password" class="form-control" id="password"  name="password" placeholder="Enter a Unique password" required min="8" maxlength="15">
                        </div>
                        <div class="mb-3">
                            <label for="repassword" class="form-label">Re-enter Password:</label>
                            <input type="password" class="form-control" id="repassword" name="repassword" placeholder="Confirm Password" required min="8" maxlength="15">
                        	<div id="error"></div>
                        </div>
                        <div class="mb-3">
                            <label for="role" class="form-label">Specify Role:</label><br>
                            
                            <input type="radio" id="admin" name="role" value="ADMIN">
                            <label for="admin">ADMIN</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            <input type="radio" id="user" name="role" value="USER" checked="checked">
                            <label for="user">USER</label><br>
                        </div>
                        
                        <div style="display: flex; align-items: center;" class="captcha-container">
                            <div id="cap" style="margin-right: 10px;"></div>
                            <input type="text" id="enteredcaptchacode" class="form-control" placeholder="Enter CAPTCHA" required maxlength="6">
                            <button type="button" onclick="refreshCaptcha(event)" class="btn btn-light" style="margin-left: 10px;">
                                <i class="fa fa-refresh"></i>
                            </button>
                        </div>
                        
                        <div class="mt-3">
                            <button type="submit" class="btn btn-primary w-100">Register</button>
                        </div>
                    </form>
                </div>    
            </div>          
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript" src="/js/newAccountJS.js"></script>

</body>
</html>

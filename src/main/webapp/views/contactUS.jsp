<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | MeTime</title>
    <style>
        .contact-section {
            padding: 80px 0;
        }

        .contact-section h2 {
            font-size: 3rem;
            font-weight: 700;
            color: #1c1c1c;
            margin-bottom: 30px;
            text-align: center;
        }

        .contact-details {
            margin-bottom: 40px;
            color: #333;
        }

        .contact-details h4 {
            font-weight: 600;
        }

        .social-links i {
            font-size: 1.5rem;
            margin: 10px;
            color: #007bff;
        }

        .social-links a:hover {
            color: #0056b3;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.85);
            border: none;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
	<jsp:include page="navbar.jsp"></jsp:include>
    <section class="contact-section">
        <div class="container">
            <h2>Contact Us</h2>

            <div class="row">
                <!-- Contact Info -->
                <div class="col-lg-6 contact-details">
                    <h4>Reach Us At</h4>
                    <p><strong>Address:</strong> MeTime Travel Agency, 123 Wanderlust Street, Dream City, India</p>
                    <p><strong>Phone:</strong> +91 9876543210 / +91 9988776655</p>
                    <p><strong>Email:</strong> <a href="mailto:support@metime.com">support@metime.com</a></p>
                    <p><strong>Working Hours:</strong> Mon - Fri | 9 AM to 6 PM</p>

                    <h4>Follow Us</h4>
                    <div class="social-links">
                        <a href="#" target="_blank"><i class="fab fa-facebook"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>

                <!-- Contact Form -->
                <div class="col-lg-6">
                    <form>
                        <div class="form-group">
                            <label for="name"><b>Full Name</b></label>
                            <input type="text" class="form-control" id="name" placeholder="Enter your full name">
                        </div>
                        <div class="form-group">
                            <label for="email"><b>Email address</b></label>
                            <input type="email" class="form-control" id="email" placeholder="Enter your email">
                        </div>
                        <div class="form-group">
                            <label for="subject"><b>Subject</b></label>
                            <input type="text" class="form-control" id="subject" placeholder="Subject">
                        </div>
                        <div class="form-group">
                            <label for="message"><b>Message</b></label>
                            <textarea class="form-control" id="message" rows="4" placeholder="Enter your message"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Font Awesome icons for social media -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>

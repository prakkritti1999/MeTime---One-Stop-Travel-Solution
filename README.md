MeTime - Luxurious Travel and Tour Packages

Overview
MeTime is a travel and tour management platform designed to offer luxurious, customizable, and affordable travel packages. Whether you're seeking adventure, honeymoon experiences, or international getaways, MeTime provides seamless planning and booking with the best tour guides and services.

Features
1. Dynamic Travel Packages: Adventure, honeymoon, and international tours.
2. User-Friendly Interface: Responsive UI designed for seamless browsing.
3. Dynamic PDF Itinerary: Generate and download customized trip itineraries.
4. Category-Based Search: Quickly find packages by category.
5. Real-Time Data Updates: AJAX-powered features for smooth interactions.

Tech Stack
1. Backend : Spring Boot, Java
2. Frontend : Java Server Pages (JSP), CSS, Bootstrap
3. Database : MySQL
4. PDF Generation : iText Library
5. Payment Gateway: RazorPay Library
6. Tools : SweetAlerts for Alerts, AJAX for dynamic interaction
7. IDE : Eclipse, IntelliJ Idea

Project Architecture
This project follows a monolithic architecture for simplicity and ease of deployment

Prerequisites
1. Java 17+
2. Maven
3. Databases

Setup and Installation
1. Clone the repository : git clone https://github.com/prakkritti1999/MeTime---One-Stop-Travel-Solution
2. Setup the MySQL database and create cris database
3. Configure application.properties file and update the database credentials
    3.i.   spring.datasource.url=jdbc:mysql://localhost:3306/cris
    3.ii.  spring.datasource.username=your_username
    3.iii. spring.datasource.password=your_password
4. Start the application by running the main().
5. Access the homepage via the following url : http://localhost:8080/MeTime/home

How to Use
1. Browse Packages: Explore the range of travel packages based on your preferences.
2. Download Itinerary: Generate a detailed itinerary for your trip as a PDF.
3. Book a Trip: Select a package and click "Book Now" to confirm.
4. Search for Trips: Use the search bar for quick navigation to relevant trips.

Planned Features
1. User authentication and role-based access using JWT/OAuth.
2. Microservices architecture for scalability.

Contributions are welcome! Feel free to submit a pull request or open an issue to report bugs or suggest new features.

Few pages of the project are attached below
1) The Home Page :![Screenshot 2024-10-02 151849](https://github.com/user-attachments/assets/a1081832-0dbc-4462-a49e-3f7fa46b6ddf)
2) Bookings Page :![Screenshot (16)](https://github.com/user-attachments/assets/f21eb494-47b8-4c14-92a6-b9fe3b446458)
![Screenshot (18)](https://github.com/user-attachments/assets/d90f25e0-bbaf-46da-810c-7ba07903807e)



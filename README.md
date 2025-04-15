# ☕ Online Café Ordering System

A Java Servlet-based web application designed for efficient café order management. This system allows customers to browse the menu, place orders, and make secure payments while providing the admin with the ability to manage products and orders effectively.

---

## 📑 Table of Contents

- [📌 About the Project](#-about-the-project)
- [🌟 Features](#-features)
- [🛠️ Tech Stack](#️-tech-stack)
- [🧩 System Design](#-system-design)
- [🖼️ Screenshots](#-screenshots)
- [⚙️ Installation & Setup](#️-installation--setup)
- [🗃️ Database Design](#️-database-design)
- [🔐 Security Measures](#-security-measures)
- [🧪 Testing and Results](#-testing-and-results)
- [📈 Output and Results](#-output-and-results)
- [🧠 Challenges Faced](#-challenges-faced)
- [✅ Conclusion](#-conclusion)
- [📚 References](#-references)
- [👨‍💻 Author](#-author)

---

## 📌 About the Project

This Online Café Ordering System simplifies the traditional food ordering process by introducing a web-based application for café customers and administrators. The system enables users to:

- Register and log in.
- Browse the food menu.
- Add items to cart and checkout.
- View order confirmation and status.

Admins can manage the menu, view orders, and control user access via a dedicated dashboard.

---

## 🌟 Features

- 👤 User Registration & Login
- 📋 Dynamic Menu Browsing
- 🛒 Cart Management & Checkout
- 💳 Order Confirmation & View Orders
- 🧑‍💼 Admin Dashboard Access
- 🔒 Secure Authentication
- 📱 Responsive UI

---

## 🛠️ Tech Stack

| Layer       | Technology              |
|-------------|--------------------------|
| Frontend    | HTML, CSS, JavaScript    |
| Backend     | Java (Servlets)          |
| Database    | MySQL                    |
| Server      | Apache Tomcat            |
| Tools       | NetBeans, MySQL Workbench, Git, GitHub |

---

## 🧩 System Design

- **Frontend & Backend Integration** through Servlet architecture.
- **MVC Pattern** used for code separation.
- **Entity-Relationship Diagram (ERD)** used for relational database modeling.
- **Use Case Diagram** for process flow.

---

## 🖼️ Screenshots

> 📌 Place all images in a `screenshots/` folder in your repo and reference them here.

1. **Login Page**  
   ![Login](screenshots/login.png)

2. **Register Page**  
   ![Register](screenshots/register.png)

3. **Admin Dashboard**  
   ![Dashboard](screenshots/dashboard.png)

4. **View Menu Page**  
   ![Menu](screenshots/view_menu.png)

5. **Cart & Checkout Page**  
   ![Cart](screenshots/cart_checkout.png)

6. **Order Success Page**  
   ![Success](screenshots/order_success.png)

7. **View Orders Page**  
   ![Orders](screenshots/view_orders.png)

---

## ⚙️ Installation & Setup

### Prerequisites:
- Java JDK
- NetBeans or IntelliJ
- Apache Tomcat Server
- MySQL

### Steps:
1. Clone the repository:
   ```bash
   git clone https://github.com/SUNILNAGRKOTI/online-cafe-ordering-system.git
Import the project in NetBeans.

Setup MySQL database using the provided SQL file.

Configure database credentials in your servlet files.

Deploy the project using Apache Tomcat.

Open in browser and test the app.

🗃️ Database Design
Tables Used:
users – Stores user credentials and profiles.

menu – Stores food item details.

cart – Stores user's temporary order list.

orders – Stores placed order details.

ER Diagram
Include ER diagram image here

🔐 Security Measures
✔️ User Authentication using sessions

✔️ Authorization for admin panel

✔️ Password field masked

✔️ SQL injection prevented using prepared statements

🧪 Testing and Results
Testing Types:
✅ Unit Testing for individual servlets and classes

✅ Integration Testing for full feature flows

✅ UI Testing using browser tools

Debugging:
Fixed form validation issues

Handled server session timeout errors

Debugged cart and order status logic

📈 Output and Results
1. Expected Output
Successful user registration, login, and logout.

Real-time menu view with images.

Cart and checkout with correct order calculation.

Confirmation message and order view.

2. Performance Metrics
⚡ Fast page loads using lightweight HTML & JS

✅ Accurate data processing and order updates

3. User Feedback
Easy to use and navigate

Mobile friendly

Smooth checkout process

🧠 Challenges Faced
Session Management: Fixed auto-logout after inactivity.

Database Connectivity: Resolved issues in JDBC driver and SQL syntax.

UI Consistency: Enhanced form alignment and responsiveness.

✅ Conclusion
Summary of Achievements:
Fully working café ordering system with all required features.

MVC structure and clean coding practices followed.

Focus on responsive, user-friendly design.

Limitations:
No OTP-based login or real-time chat.

Limited to local deployment; not hosted online.

📚 References
Oracle Java Documentation

Java Servlet API

W3Schools, GeeksForGeeks

MySQL Documentation

👨‍💻 Author
Sunil Nagarkoti
📚 MCA Student, Chandigarh University
🌐 GitHub: SUNILNAGRKOTI
📧 Email: sunilsinghnagarkoti108@gmail.com


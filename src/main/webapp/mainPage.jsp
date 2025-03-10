<%--
    Document   : mainPage
    Created on : Mar 8, 2025, 1:00:36 PM
    Author     : giaph
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Main Page - Library</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
    <style>
        /* Dark mode tổng thể */
        body {
            background-color: #1a1a1a;
            color: #e0e0e0;
        }

        /* Thiết kế tên người dùng và logout */
        .navbar-brand {
            display: flex;
            align-items: center;
        }
        .user-greeting {
            color: #e0e0e0;
            font-weight: 700;
            font-size: 1rem;
        }
        
        /* Thiết kế FPT với khung nền */
        .fpt-logo {
            display: flex;
            align-items: center;
            font-family: 'Roboto', sans-serif;
            font-weight: 700;
            font-size: 1.0rem;
            margin-right: 5px;
        }
        .fpt-letter {
            color: #ffffff;
            padding: 4px 8px;
            border-radius: 5px;
            margin: 0 2px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }
        .fpt-f {
            background-color: #0066CC;
        }
        .fpt-p {
            background-color: #FF6200;
        }
        .fpt-t {
            background-color: #28a745;
        }

        /* Thiết kế chữ Library */
        .library-text {
            font-family: 'Dancing Script', cursive;
            font-size: 2.0rem;
            color: #e0e0e0;
            margin-left: 5px;
            font-style: italic;
        }

        /* Thiết kế navbar chính */
        .navbar {
            background-color: #2c2c2c;
            padding: 10px 20px;
            border-bottom: 1px solid #404040;
        }

        .navbar-nav {
            flex-grow: 1;
            justify-content: center;
        }
        .nav-link {
            color: #e0e0e0 !important;
            font-size: 1.1rem;
            margin: 0 20px;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        .nav-link:hover {
            color: #1a73e8 !important;
        }

        /* Thiết kế Log out */
        .logout-link {
            color: #e0e0e0 !important;
            font-size: 1.1rem;
            margin-left: 15px;
            font-weight: 500;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .logout-link:hover {
            color: #eb3313 !important;
        }

        /* Thiết kế nút Log in và Sign up */
        .login-btn {
            background-color: #0066CC;
            color: #ffffff !important;
            font-weight: 500;
            padding: 5px 15px;
            border-radius: 5px;
            text-decoration: none;
            margin-left: 10px;
            transition: background-color 0.3s ease;
            border: 1px solid #004d99;
        }
        .login-btn:hover {
            background-color: #004d99;
            color: #ffffff !important;
        }

        .signup-btn {
            background-color: #28a745;
            color: #ffffff !important;
            font-weight: 500;
            padding: 5px 15px;
            border-radius: 5px;
            text-decoration: none;
            margin-left: 10px;
            transition: background-color 0.3s ease;
            border: 1px solid #218838;
        }
        .signup-btn:hover {
            background-color: #218838;
            color: #ffffff !important;
        }

        /* Thiết kế ô tìm kiếm */
        .search-container {
            display: flex;
            align-items: center;
            margin: 0 20px;
        }
        .search-form {
            display: flex;
            align-items: center;
            position: relative;
        }
        .search-input {
            background-color: #404040; /* Nền tối cho ô nhập */
            border: 1px solid #606060;
            color: #e0e0e0;
            padding: 5px 30px 5px 10px; /* Để chừa chỗ cho kính lúp */
            border-radius: 5px;
            font-size: 1rem;
            width: 200px; /* Độ rộng ô tìm kiếm */
        }
        .search-input::placeholder {
            color: #b0b0b0; /* Màu chữ placeholder */
        }
        .search-input:focus {
            outline: none;
            border-color: #1a73e8; /* Viền xanh khi focus */
            box-shadow: 0 0 5px rgba(26, 115, 232, 0.5);
        }
        .search-icon {
            position: absolute;
            right: 10px;
            color: #e0e0e0;
            font-size: 1.2rem;
            pointer-events: none; /* Không cho click vào kính lúp */
        }

        /* Nội dung chính */
        .container {
            background-color: #252525;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }
        .container h1 {
            color: #e0e0e0;
        }
        .container p {
            color: #b0b0b0;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <!-- Chào mừng người dùng bên trái -->
            <%
                session = request.getSession(false);
                String userGreeting = "FPT Library";
                if (session != null && session.getAttribute("user") != null) {
                    Users user = (Users) session.getAttribute("user");
                    userGreeting = "Hi, " + (user.getFullname() != null ? user.getFullname() : user.getRollNumber());
                }
            %>
            <a class="navbar-brand" href="#">
                <% if (userGreeting.equals("FPT Library")) { %>
                    <span class="fpt-logo">
                        <span class="fpt-letter fpt-f">F</span>
                        <span class="fpt-letter fpt-p">P</span>
                        <span class="fpt-letter fpt-t">T</span>
                    </span>
                    <span class="library-text">Library</span>
                <% } else { %>
                    <span class="user-greeting"><%= userGreeting %></span>
                <% } %>
            </a>

            <!-- Nút toggle cho mobile -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Các liên kết nằm chính giữa và ô tìm kiếm -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Introduction</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="books?action=list">My Book</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">FAQs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                </ul>
                <!-- Ô tìm kiếm -->
                <div class="search-container">
                    <form class="search-form" action="search" method="get">
                        <input type="text" class="search-input" placeholder="Search" name="query">
                        <span class="search-icon">🔍</span>
                    </form>
                </div>
            </div>

            <!-- Log out hoặc Log in/Sign up -->
            <div class="ms-auto">
                <%
                    if (session != null && session.getAttribute("user") != null) {
                %>
                    <a class="logout-link" href="Logout">Log out</a>
                <%
                    } else {
                %>
                    <a class="login-btn" href="login.jsp">Log in</a>
                    <a class="signup-btn" href="register.jsp">Sign up</a>
                <%
                    }
                %>
            </div>
        </nav>

        <div class="container mt-5">
            <h1 class="text-center">Welcome to Library Management System</h1>
            <p class="text-center">Manage your books and accounts efficiently.</p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
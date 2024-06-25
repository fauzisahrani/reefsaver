<%-- 
    Document   : forgetPasswordForm
    Created on : 6 Jan 2024, 9:39:20 am
    Author     : Pojie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta Tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Title -->
        <title>Reef Saver</title>

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@300;900&display=swap"
              rel="stylesheet">

        <!-- Include Stylesheet -->
        <style>
            <%@ include file="css/styleOthers.css"%>
        </style>
    </head>
    <body>
        <section class="form-section">
            <div class="reset-form">
                <div class="prompt">
                    <h1>Forgot Password</h1>
                </div>
                <form action="/reset-password" method="POST">
                    <div>
                        <input type="email" id="email" name="email" required placeholder="Email">
                    </div>
                    <a href="#" class="btn-reset">Reset Password</a>
                </form>
                <div class="message">
                    <p>We will send you an email to reset your password.</p>
                    <a href="LoginForm.jsp">Back to Login Page</a>
                </div>
            </div> 
        </section>
    </body>
</html>

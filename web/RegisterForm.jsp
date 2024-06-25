<%-- 
    Document   : RegisterForm
    Created on : 19 Jun 2023, 10:32:37 pm
    Author     : Pojie
    Display Register Page and accept input
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@300;900&display=swap"
              rel="stylesheet">
        <style><%@ include file="css/styleUser.css"%></style>
    </head>
    <body>
        <div class="card">
            <div class="card-body">
                <c:if test="${user == null}">
                    <form action="insertUser" method="post" onsubmit="return validatePassword();">
                    </c:if>

                    <div class="form-head">
                        <h2>
                            Register
                        </h2>
                        <div class="form-group">
                            <div>
                                <input type="text" value="<c:out value='${user.userName}'/>"
                                       class="form-control" name="userName" placeholder="Full Name" required="required">
                            </div>
                            <div>
                                <input type="email" value="<c:out value='${user.userEmail}'/>"
                                       class="form-control" name="userEmail" placeholder="Email" required="required">
                            </div>
                            <div class="password-box">
                                <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="Password" required="required">
                            </div>
                            <div class="popup">
                                <button>ℹ</button>
                                <div class="popup-content">
                                    <h3>Password Requirements:</h3>
                                    <ul>
                                        <li>Password must be at least <strong>8 characters</strong> long.</li>
                                        <li>Must contain at least one <strong>uppercase letter (A-Z)</strong>.</li>
                                        <li>Must contain at least one <strong>lowercase letter (a-z)</strong>.</li>
                                        <li>Must contain at least one <strong>digit (0-9)</strong>.</li>
                                        <li>Must contain at least one <strong>special character (!@#$%^&*)</strong>.</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="confirm-password-form">
                                <input type="password" class="form-control" id="userConfirmPassword" name="userConfirmPassword" placeholder="Confirm Password" required="required">
                            </div>
                            <div class="radiobtn">
                                <input type="radio" id="option1" name="userType" value="Public User" required="">
                                <label for="option1">Public User</label><br>

                                <input type="radio" id="option2" name="userType" value="Researcher">
                                <label for="option2">Researcher</label><br>
                            </div>

                            <button type="submit" class="submit-button">Register</button>
                            <a href="LoginForm.jsp">Already have an Account?</a>
                        </div>

                    </div>        
                </form>
            </div>
        </div>
    </body>
    <script src="js/main.js" type="text/javascript"></script>
</html>

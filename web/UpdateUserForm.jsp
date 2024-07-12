<%-- 
    Document   : userForm
    Created on : 19 Jun 2023, 10:32:37 pm
    Author     : Pojie
    used for create and update process
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User Details</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@300;900&display=swap"
              rel="stylesheet">
        <style><%@ include file="css/styleUser.css"%></style>
    </head>
    <body>

        <form action="updateUser" method="post" enctype="multipart/form-data" onsubmit="return validatePassword()">
            <div class="form-head-update">
                <h2>
                    Update User Details
                </h2>

                <input type="hidden" name="userID" value="<c:out value='${user.userID}' />"/>
                <div class="form-group">
                    <input type="text" value="<c:out value='${user.userName}'/>"
                           class="form-control" name="userName"required="required">
                    <input type="text" value="<c:out value='${user.userEmail}'/>"
                           class="form-control" name="userEmail">
                    <input type="text" value="<c:out value='${user.userField}'/>"
                           class="form-control" name="userField" placeholder="Field of Study (Optional)">
                    <input type="text" value="<c:out value='${user.userInstitution}'/>"
                           class="form-control" name="userInstitution" placeholder="Institution (Optional)">


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

                    <!--upload image here-->
                    <input class="form-control"
                           type="file" 
                           accept="image/*" 
                           name="userImage" 
                           required="required">

                    <input type="hidden" value="<c:out value='${user.userType}'/>"
                           class="form-control" name="userType">

                    <span>
                        <h4>Account Type: </h4><c:out value="${user.userType}"/>
                    </span>

                    <div class="button-container">
                        <button type="submit" class="submit-button">Update Details</button>
                        <button type="button" class="submit-button" onclick="return confirm('Are you sure you want to cancel?') ? window.history.back() : false;">Cancel</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
    <script src="js/main.js" type="text/javascript"></script>
</html>

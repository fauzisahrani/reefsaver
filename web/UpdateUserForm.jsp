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
        <style><%@ include file="css/styleuser.css"%></style>
    </head>
    <body>
        <form action="update" method="post">
            <div class="form-head">
                <h2>
                    Update User Details
                </h2>

                <c:if test="${user != null}">
                    <input type="hidden" name="userID" value="<c:out value='${user.userID}' />"/>
                </c:if>
                <div class="form-group">
                    <input type="text" value="<c:out value='${user.userName}'/>"
                           class="form-control" name="userName"required="required">
                    <input type="text" value="<c:out value='${user.userEmail}'/>"
                           class="form-control" name="userEmail">
                    <input type="password" value="" placeholder="Enter New Password"
                           class="form-control" name="userPassword">
                    <input type="password" value="" placeholder="Confirm New Password"
                           class="form-control" name="userPassword">
                    <div class="radiobtn">
                        <input type="radio" id="option1" name="userType" value="Public User" required="">
                        <label for="option1">Public User</label><br>

                        <input type="radio" id="option2" name="userType" value="Researcher">
                        <label for="option2">Researcher</label><br>
                    </div>
                    <button type="submit" class="submit-button">Update Details</button>
                    <button type="button" class="submit-button" onclick="return confirm('Are you sure you want to cancel?') ? window.history.back() : false;">Cancel</button>

                    </body>
                </div>
            </div>
        </form>
    </body>
</html>

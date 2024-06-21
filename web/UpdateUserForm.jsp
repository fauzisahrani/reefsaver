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
        <header>
            <div class="wrapper">
                <nav>
                    <div class="logo">Reef Saver</div>
                    <ul>
                        <li><a href="Homepage.jsp">Home</a></li>
                        <li><a href="<%=request.getContextPath()%>/listbiodiversity">Coral Reefs Data</a></li>
                        <li><a href="<%=request.getContextPath()%>/listactivity">Conservation Activities</a></li>
                        <li><a href="News.jsp">News</a></li>
                        <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers</a></li>
                        <li><a href="<%=request.getContextPath()%>/listUser" class="btn light">User</a></li>
                        <li><a href="UserProfile.jsp">Profile</a></li>
                        <li><a href="LoginForm.jsp">Log Out</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <form action="updateUser" method="post" enctype="multipart/form-data">
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
                    <!--upload image here-->
                    <input type="file" 
                           accept="image/*" 
                           name="userImage" 
                           required="required">
                    <button type="submit" class="submit-button">Update Details</button>
                    <button type="button" class="submit-button" onclick="return confirm('Are you sure you want to cancel?') ? window.history.back() : false;">Cancel</button>
                </div>
            </div>
        </form>
        <!--include footer-->
        <jsp:include page="footer.jsp" />
    </body>
</html>

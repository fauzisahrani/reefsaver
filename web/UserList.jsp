x<%-- 
   Document   : userList
   Created on : 19 Jun 2023, 10:33:54 pm
   Author     : Pojie
   this jsp used to display all user records
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*, java.io.*, java.util.Base64" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management Page</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@300;900&display=swap"
              rel="stylesheet">
        <style>
            <%@ include file="css/styleUser.css"%>
        </style>
    </head>
    <body>
        <header>
            <div class="wrapper">
                <nav>
                    <div class="logo">Reef Saver</div>
                    <ul>
                        <li><a href="Homepage.jsp">Home</a></li>
                        <li><a href="<%=request.getContextPath()%>/BiodiversityLanding.jsp">Coral Reefs Data</a></li>
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
        <br>
        <div class="row">
            <div class="container">
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Category</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${listUser}">
                            <tr>
                                <td>
                                    <c:out value="${user.userID}"/>
                                </td>
                                <td>
                                    <c:out value="${user.userName}"/>
                                </td>
                                <td>
                                    <c:out value="${user.userEmail}"/>
                                </td>
                                <td>
                                    <c:out value="${user.userType}"/>
                                </td>
                                <td class="action-column">
                                    <a class="button"href="editUser?userID=<c:out value='${user.userID}'/>">Edit</a> 
                                    <script>
                                        function deleteUser(userId) {
                                            if (confirm("Are you sure you want to delete this user?")) {
                                                window.location.href = "deleteUser?userID=" + userId;
                                            }
                                        }
                                    </script>
                                    <a class="button" onclick="deleteUser('<c:out value='${user.userID}'/>')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!--include footer-->
        <jsp:include page="footer.jsp" />

        <!--include JavaScript-->
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>

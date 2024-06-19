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
                            <th>Password</th>
                            <th>Category</th>
                            <th>Profile Picture</th>
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
                                    <input class="userlistpassword" type="password" value="${user.userPassword}" readonly style="border: none; background: none;">
                                </td>
                                <td>
                                    <c:out value="${user.userType}"/>
                                </td>
                                <%
                                    // Establish database connection
                                    Connection conn = null;
                                    Statement stmt = null;
                                    ResultSet rs = null;

                                    try {
                                        String url = "jdbc:mysql://localhost:3306/reefsaver";
                                        String user = "root";
                                        String password = "admin";

                                        Class.forName("com.mysql.jdbc.Driver");
                                        conn = DriverManager.getConnection(url, user, password);

                                        // Retrieve BLOB data from the database
                                        stmt = conn.createStatement();
                                        rs = stmt.executeQuery("SELECT userImage FROM user WHERE userID = 1");

                                        if (rs.next()) {
                                            // Convert BLOB data to Base64
                                            Blob blob = rs.getBlob("userImage");
                                            InputStream inputStream = blob.getBinaryStream();
                                            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                                            byte[] buffer = new byte[4096];
                                            int bytesRead = -1;

                                            while ((bytesRead = inputStream.read(buffer)) != -1) {
                                                outputStream.write(buffer, 0, bytesRead);
                                            }

                                            byte[] imageBytes = outputStream.toByteArray();
                                            String base64Image = Base64.getEncoder().encodeToString(imageBytes);

                                            //servlet
                                            // Set base64Image as an attribute for use in JSP
                                            request.setAttribute("base64Image", base64Image);
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        // Close resources
                                        if (rs != null) {
                                            rs.close();
                                        }
                                        if (stmt != null) {
                                            stmt.close();
                                        }
                                        if (conn != null) {
                                            conn.close();
                                        }
                                    }
                                %>
                                <td>
                                    <img src="data:image/jpeg;base64,${base64Image}" alt="User Image" class="user-image">
                                </td>
                                <td>
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

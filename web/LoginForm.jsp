<%-- 
    Document   : loginForm
    Created on : 6 Jan 2024, 9:38:24 am
    Author     : Pojie
--%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.InputStream"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@300;900&display=swap"
              rel="stylesheet">
        <style><%@ include file="css/styleUser.css"%></style>
    </head>
    <body>
        <div class="project-name">
            <img src="images/Coral Icon.png" alt=""/>
            <p class="logo">Reef Saver.</p>
            <p>Coral Conservation & Awareness Platform</p>
        </div>
        <form>
            <div class="form-head">
                <h2>
                    Log In
                </h2>

                <div class="form-group">
                    <input class="form-control" type="text" name="userEmail" placeholder="Email" />
                    <input class="form-control" type="password" name="userPassword" placeholder="Password" />
                    <button class="submit-button">Login</button>
                    <a href="RegisterForm.jsp">Don't have an Account?</a>
                    <a href="ForgetPasswordForm.jsp">Forget Password?</a>
                    <%
                        String userEmail = request.getParameter("userEmail");
                        String userPassword = request.getParameter("userPassword");

                        if (userEmail != null && userPassword != null) {
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                String myURL = "jdbc:mysql://localhost/reefsaver";
                                Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

                                String sSelectQry = "SELECT * FROM user WHERE userEmail = ? AND userPassword = PASSWORD(?)";

                                PreparedStatement myPS = myConnection.prepareStatement(sSelectQry);
                                myPS.setString(1, userEmail);
                                myPS.setString(2, userPassword);
                                ResultSet resultSet = myPS.executeQuery();

                                if (resultSet.next()) {
                                    // User found, set session and redirect to home page
                                    session.setAttribute("userID", resultSet.getString("userID"));
                                    session.setAttribute("userName", resultSet.getString("userName"));
                                    session.setAttribute("userEmail", resultSet.getString("userEmail"));
                                    session.setAttribute("userType", resultSet.getString("userType"));
                                    session.setAttribute("userField", resultSet.getString("userField"));
                                    session.setAttribute("userInstitution", resultSet.getString("userInstitution"));

                                    //get Blob datatype from database
                                    Blob userImageBlob = resultSet.getBlob("userImage");

                                    //Convert Blob to Byte[]
                                    byte[] userImageBytes = userImageBlob.getBytes(1, (int) userImageBlob.length());

                                    // Convert byte[] to Base64 String
                                    String userImageBase64 = Base64.getEncoder().encodeToString(userImageBytes);

                                    session.setAttribute("userImage", userImageBase64);
                                    response.sendRedirect("http://localhost:8080/reefsaver/Homepage.jsp");
                                } else {
                                    // User not found, display error message
                                    out.println("<p>Invalid email or password. Please try again.</p>");
                                }
                                myConnection.close();
                            } catch (ClassNotFoundException | SQLException e) {
                                e.printStackTrace();
                                out.println("An error occurred. Please try again later.");
                            }
                        }
                    %>
                </div>
            </div>
        </form>
    </body>
</html>

<%-- 
    Document   : navBar
    Created on : 18 Jun 2024, 8:01:07 pm
    Author     : Pojie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style><%@ include file="css/styleNavBar.css"%></style>
    </head>
    <body>
        <header>
            <nav>
                <div class="logo">Reef Saver</div>
                <ul>
                    <li><a href="Homepage.jsp" class="btn light">Home</a></li>                        
                    <li><a href="<%=request.getContextPath()%>/listbiodiversity">Coral Reefs Data</a></li>
                    <li><a href="<%=request.getContextPath()%>/listactivity">Conservation Activities</a></li>
                    <li><a href="News.jsp">News</a></li>
                    <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers</a></li>
                    <li><a href="<%=request.getContextPath()%>/listUser">User</a></li>
                    <li><a href="UserProfile.jsp">Profile</a></li>
                    <li><a href="LoginForm.jsp">Log Out</a></li>
                </ul>
            </nav>
        </header>
    </body>
</html>

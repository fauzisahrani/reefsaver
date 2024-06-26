<%-- 
    Document   : BiodiversityListAll
    Created on : 24 Jun 2024, 3:47:29 pm
    Author     : Pojie
--%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coral Sample Data Page</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@300;900&display=swap"
              rel="stylesheet">
        <style><%@ include file="css/styleBiodiversity.css"%></style>
        <script 
            async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCun7d3IS8UBp6MDTQHdmOLQzaCGLwOFDM&callback=console.debug&libraries=maps,marker&v=beta">
        </script>
    </head>

    <body>
        <header>
            <div class="wrapper">
                <nav>
                    <div class="logo">Reef Saver</div>
                    <ul>
                        <li><a href="Homepage.jsp">Home</a></li>
                        <li class="dropdown">
                            <a href="#" class="btn light">Coral Reefs Data</a>
                            <div class="dropdown-content">
                                <c:if test="${sessionScope.userType == 'Researcher'}">
                                    <a href="<%=request.getContextPath()%>/newbiodiversity">Add Coral Data</a>
                                </c:if>                                 
                                <a href="<%=request.getContextPath()%>/listbiodiversity">All Coral Data</a>
                            </div>
                        </li>                        
                        <li><a href="<%=request.getContextPath()%>/listactivity">Conservation Activity</a></li>
                        <li><a href="News.jsp">News</a></li>
                        <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers</a></li>
                            <c:if test="${sessionScope.userType == 'Admin'}">
                            <li>
                                <a href="<%=request.getContextPath()%>/listUser">User</a>
                            </li>                        
                        </c:if>                        
                        <li><a href="UserProfile.jsp">Profile</a></li>
                        <li><a href="LoginForm.jsp">Log Out</a></li>
                    </ul>
                </nav>
                <div class="biodiversity-container">
                    <div class="charts-container">
                        <div class="pie-chart-container">
                            <h3>Overall Site Condition</h3>
                            <%

                                // Database connection details
                                String jdbcUrl = "jdbc:mysql://localhost:3306/reefsaver";
                                String jdbcUser = "root";
                                String jdbcPassword = "admin";

                                Connection connection = null;
                                Statement statement = null;
                                ResultSet resultSet = null;

                                int goodCount = 0;
                                int poorCount = 0;
                                int fairCount = 0;

                                // Calculate the percentages
                                String goodValue = "0%";
                                String poorValue = "0%";
                                String fairValue = "0%";

                                try {
                                    // Load the MySQL driver
                                    Class.forName("com.mysql.cj.jdbc.Driver");

                                    // Establish the connection
                                    connection = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);

                                    // Create the statement
                                    statement = connection.createStatement();

                                    // Execute the query
                                    String query = "SELECT SUM(CASE WHEN coralCondition = 'good' THEN 1 ELSE 0 END) AS good_count, "
                                            + "SUM(CASE WHEN coralCondition = 'poor' THEN 1 ELSE 0 END) AS poor_count, "
                                            + "SUM(CASE WHEN coralCondition = 'fair' THEN 1 ELSE 0 END) AS fair_count FROM biodiversity";

                                    resultSet = statement.executeQuery(query);

                                    // Fetch the results
                                    if (resultSet.next()) {
                                        goodCount = resultSet.getInt("good_count");
                                        poorCount = resultSet.getInt("poor_count");
                                        fairCount = resultSet.getInt("fair_count");
                                    }
                                    // Calculate the total count
                                    int totalCount = goodCount + poorCount + fairCount;

                                    if (totalCount > 0) {
                                        goodValue = (goodCount * 100 / totalCount) + "%";
                                        poorValue = (poorCount * 100 / totalCount) + "%";
                                        fairValue = (fairCount * 100 / totalCount) + "%";
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    // Close the resources
                                    if (resultSet != null) {
                                        try {
                                            resultSet.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                    if (statement != null) {
                                        try {
                                            statement.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                    if (connection != null) {
                                        try {
                                            connection.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                }
                            %>
                            <div class="pie-chart-label-container">
                                <div class="pie-chart" 
                                     style="
                                     --poor: <%= poorValue%>;
                                     --fair: <%= fairValue%>;
                                     --good: <%= goodValue%>;">
                                </div>

                                <div class="label-container">
                                    <a href="<%=request.getContextPath()%>/listBiodiversity?coralCondition=Poor">
                                        <div class="label poor-label"><span class="color-box"></span>Poor <%= poorValue%></div>
                                    </a>
                                    <a href="<%=request.getContextPath()%>/listBiodiversity?coralCondition=Fair">
                                        <div class="label fair-label"><span class="color-box"></span>Fair <%= fairValue%></div>
                                    </a>
                                    <a href="<%=request.getContextPath()%>/listBiodiversity?coralCondition=Good">
                                        <div class="label good-label"><span class="color-box"></span>Good <%= goodValue%></div>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="bar-chart-container">
                            <h3>Coral Genera</h3>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reefsaver", "root", "admin");
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery("SELECT coralScientificName, COUNT(*) AS count FROM biodiversity GROUP BY coralScientificName");

                                    while (rs.next()) {
                                        String coralScientificName = rs.getString("coralScientificName");
                            %>
                            <div class="bar">
                                <a href="<%=request.getContextPath()%>/listBiodiversity?coralScientificName=<%= coralScientificName%>">
                                    <p><%= coralScientificName%></p>
                                    <span style="width: <%= (rs.getInt("count") * 10) + "%"%>;"><%= rs.getInt("count")%></span>
                                </a>    
                            </div>
                            <%
                                    }
                                    rs.close();
                                    stmt.close();
                                    conn.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </div>
                    </div>
                    <div class="map-container">
                        <gmp-map center="4.2105,101.9758" zoom="6.8" map-id="DEMO_MAP_ID">
                            <%
                                Connection conn = null;
                                Statement stmt = null;
                                ResultSet rs = null;

                                try {
                                    // Load the MySQL JDBC driver (replace with your database driver)
                                    Class.forName("com.mysql.jdbc.Driver");

                                    // Connect to your database (replace with your database URL, username, and password)
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reefsaver", "root", "admin");

                                    // SQL query to retrieve coralLatitude and coralLongitude
                                    String sqlQuery = "SELECT DISTINCT coralStation, coralLatitude, coralLongitude FROM biodiversity";

                                    // Create a statement
                                    stmt = conn.createStatement();

                                    // Execute the query
                                    rs = stmt.executeQuery(sqlQuery);
                            %><%
                                while (rs.next()) {
                                    String coralStation = rs.getString("coralStation");
                                    double latitude = rs.getDouble("coralLatitude");
                                    double longitude = rs.getDouble("coralLongitude");
                            %>
                            <a href="<%=request.getContextPath()%>/listBiodiversity?coralStation=<%= coralStation%>">
                                <gmp-advanced-marker position="<%= latitude%>,<%= longitude%>" title="<%= coralStation%>"></gmp-advanced-marker>
                            </a>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    // Close resources in reverse order of creation
                                    if (rs != null) {
                                        try {
                                            rs.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                    if (stmt != null) {
                                        try {
                                            stmt.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                    if (conn != null) {
                                        try {
                                            conn.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                }
                            %>
                        </gmp-map>    
                    </div>
                </div>
        </header>
        <!--include footer-->
        <jsp:include page="footer.jsp" />

        <!--include JavaScript-->
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>

<%--
    Document   : BiodiversityList
    Created on : 15 Apr 2024, 10:31:06 am
    Author     : Pojie
    This jsp used to display all coral biodiversity records
--%>

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
        <style><%@ include file="css/stylebiodiversity.css"%></style>
        <script 
            async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCun7d3IS8UBp6MDTQHdmOLQzaCGLwOFDM&callback=console.debug&libraries=maps,marker&v=beta">
        </script>
    </head>
    <body>
        <header>
            <div class="wrapper">
                <nav>
                    <div class="logo">ReefSaver</div>
                    <ul>
                        <li><a href="Homepage.jsp">Home</a></li>
                        <li><a href="<%=request.getContextPath()%>/listbiodiversity" class="btn light">Coral Reefs Data</a></li>
                        <li><a href="<%=request.getContextPath()%>/listactivity">Conservation Activity</a></li>
                        <li><a href="News.jsp">News</a></li>
                        <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers</a></li>
                        <li><a href="<%=request.getContextPath()%>/listUser">User</a></li>
                        <li><a href="UserProfile.jsp">Profile</a></li>
                        <li><a href="LoginForm.jsp">Log Out</a></li>
                    </ul>
                </nav>
                <section>
                    <div class="newbutton">
                        <a href="<%=request.getContextPath()%>/newbiodiversity" class="btn light"> Add Coral Data</a> <!--hyperlink act as button-->
                    </div>
                    <!--                    <table>
                                            <thead>
                                                <tr>
                                                    <th>Sample ID</th>
                                                    <th>Coral Genera</th>
                                                    <th>Coral Species (if any)</th>
                                                    <th>Growth Form</th>
                                                    <th>Site</th>
                                                    <th>Observation Date</th>
                                                    <th>Latitude</th>
                                                    <th>Longitude</th>
                                                    <th>Locality</th>
                                                    <th>Depth(m)</th>
                                                    <th>Repository</th>
                                                    <th>Condition</th>
                                                    <th>Data Collector</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                    <c:forEach var="biodiversity" items="${listBiodiversity}">
                        <tr>
                            <td>
                        <c:out value="${biodiversity.coralSampleID}"/>
                    </td>
                    <td>
                        <c:out value="${biodiversity.coralScientificName}"/>
                    </td>
                    <td>
                        <c:out value="${biodiversity.coralSpecies}"/>
                    </td>
                    <td>
                        <c:out value="${biodiversity.coralCategory}"/>
                    </td>
                    <td>
                        <c:out value="${biodiversity.coralStation}"/>
                    </td>
                    <td>
                        <fmt:formatDate value="${biodiversity.coralObservationDate}" pattern="dd.MM.yyyy" />
                    </td>
                    <td>
                        <fmt:formatNumber value="${biodiversity.coralLatitude}" pattern="#0.###" />
                    </td>
                    <td>
                        <fmt:formatNumber value="${biodiversity.coralLongitude}" pattern="#0.###" />
                    </td>
                    <td>
                        <c:out value="${biodiversity.coralLocality}"/>
                    </td>
                    <td>
                        <fmt:formatNumber value="${biodiversity.coralDepth}" pattern="#0.###" />
                    </td>
                    <td>
                        <c:out value="${biodiversity.coralRepository}"/>
                    </td>
                    <td>
                        <c:out value="${biodiversity.coralCondition}"/>
                    </td>
                    <td>
                        <c:out value="${biodiversity.coralDataProvider}"/>
                    </td>
                    <td>
                        <a class="action" href="editbiodiversity?coralSampleID=<c:out value='${biodiversity.coralSampleID}'/>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="action" href="#" onclick="return confirmDelete(${biodiversity.coralSampleID});">Delete</a>

                        <script>
                            function confirmDelete(coralSampleID) {
                                if (confirm("Are you sure you want to delete coral sample with ID " + coralSampleID + "?")) {
                                    window.location.href = "deletebiodiversity?coralSampleID=" + coralSampleID;
                                }
                                return false;
                            }
                        </script>                                
                    </td>
                </tr>
                    </c:forEach>
                </table>-->
                    <div class="biodiversity-container">
                        <div class="map-container">
                            <canvas id="pieChart" width="100" height="400"></canvas>
                        </div>
                        <div class="map-container">
                            <gmp-map center="4.2105,101.9758" zoom="6.8" map-id="DEMO_MAP_ID">
                                <gmp-advanced-marker position="6.0613888889,100.041555555" title="Banana Reefs"></gmp-advanced-marker>
                                <gmp-advanced-marker position="2.7602222222,104.2217777778" title="Benuang Bay"></gmp-advanced-marker>
                                <gmp-advanced-marker position="6.0428611111,99.9243055556" title="Segantang Bay"></gmp-advanced-marker>
                            </gmp-map>    
                        </div>
                    </div>
                </section>
            </div>
        </header>
        <footer>
            <div class="wrapper">
                <div class="links-container">
                    <div class="links">
                        <h3>Quick Links</h3>
                        <ul>
                            <li><a href="https://www.aims.gov.au/research-topics/monitoring-and-discovery/monitoring-great-barrier-reef/reef-monitoring-sampling-methods">Monitoring Methods</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    </div>

                    <div class="links">
                        <h3>Course</h3>
                        <ul>
                            <li><a href="#">Log In</a></li>
                            <li><a href="#">Download</a></li>
                            <li><a href="#">All Courses</a></li>
                        </ul>
                    </div>

                    <div class="links">
                        <h3>Contact Us</h3>
                        <ul>
                            <li>s63721@ocean.umt.edu.my</li>
                        </ul>
                        <div class="social">
                            <a href="#">
                                <img src="images/Facebook Icon.svg" alt="">
                            </a>
                            <a href="#">
                                <img src="images/Insta Icon.svg" alt="">
                            </a>
                        </div>

                        <form action="#">
                            <input type="text" placeholder="Email Address" />
                            <button class="submit-btn">Subscribe</button>
                        </form>
                    </div>

                </div>

                <p class="copyright">This website is developed by Fauzi Sahrani © 2023</p>
            </div>
        </footer>
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>

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
                                <a href="<%=request.getContextPath()%>/newbiodiversity">Add Coral Data</a>
                            </div>
                        </li>                        
                        <li><a href="<%=request.getContextPath()%>/listactivity">Conservation Activity</a></li>
                        <li><a href="News.jsp">News</a></li>
                        <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers</a></li>
                        <li><a href="<%=request.getContextPath()%>/listUser">User</a></li>
                        <li><a href="UserProfile.jsp">Profile</a></li>
                        <li><a href="LoginForm.jsp">Log Out</a></li>
                    </ul>
                </nav>
                <section>
<!--                                        <div class="newbutton">
                                            <a href="<%=request.getContextPath()%>/newbiodiversity" class="btn light"> Add Coral Data</a> hyperlink act as button
                                        </div>
                                        <table>
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
                        <div class="charts-container">
                            <div class="pie-chart-container">
                                <%
                                    // Define value here
                                    String poorValue = "20%";
                                    String fairValue = "20%";
                                    String goodValue = "60%";
                                %>
                                <div class="pie-chart" 
                                     style="
                                     --poor: <%= poorValue%>;
                                     --fair: <%= fairValue%>;
                                     --good: <%= goodValue%>;">
                                </div>
                                <div class="label-container">
                                    <div class="label poor-label"><span class="color-box"></span>Poor</div>
                                    <div class="label fair-label"><span class="color-box"></span>Fair</div>
                                    <div class="label good-label"><span class="color-box"></span>Good</div>
                                </div>
                            </div>
                            <div class="bar-chart-container">
                                <div class="bar">
                                    <p>Acropora</p>
                                    <span style="width: 20%;">20</span>
                                </div>
                                <div class="bar">
                                    <p>Anacropora</p>
                                    <span style="width: 60%;">60</span>
                                </div>
                                <div class="bar">
                                    <p>Astreopora</p>
                                    <span style="width: 40%;">40</span>
                                </div>
                                <div class="bar">
                                    <p>Cynarina</p>
                                    <span style="width: 20%;">20</span>
                                </div>
                                <div class="bar">
                                    <p>Diploastrea</p>
                                    <span style="width: 10%;">10</span>
                                </div>
                                <div class="bar">
                                    <p>Favites</p>
                                    <span style="width: 20%;">10</span>
                                </div>
                            </div>
                        </div>
                        <div class="map-container">
                            <gmp-map center="4.2105,101.9758" zoom="6.8" map-id="DEMO_MAP_ID">
                                <a href="#">
                                    <gmp-advanced-marker position="6.0613888889,100.041555555" title="Banana Reefs"></gmp-advanced-marker>
                                </a>
                                <a href="#">
                                    <gmp-advanced-marker position="2.7602222222,104.2217777778" title="Benuang Bay"></gmp-advanced-marker>
                                </a>
                                <a href="#">
                                    <gmp-advanced-marker position="6.0428611111,99.9243055556" title="Segantang Bay"></gmp-advanced-marker>
                                </a>
                            </gmp-map>    
                        </div>
                    </div>
                </section>
            </div>
        </header>
        <!--include footer-->
        <jsp:include page="footer.jsp" />

        <!--include JavaScript-->
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>

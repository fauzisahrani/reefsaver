<%--
    Document   : BiodiversityList
    Created on : 15 Apr 2024, 10:31:06 am
    Author     : Pojie
    This jsp used to display all coral biodiversity records
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
                            <a href="<%=request.getContextPath()%>/BiodiversityLanding.jsp" class="btn light">Coral Reefs Data</a>
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
                <section>

                    <div class="newbutton">
                        <c:if test="${sessionScope.userType == 'Researcher'}">
                            <a href="<%=request.getContextPath()%>/newbiodiversity" class="btn light"> Add Coral Data</a> 
                        </c:if>
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
                                    <c:if test="${sessionScope.userType == 'Admin' || sessionScope.userType == 'Researcher'}">
                                    <th>Action</th>
                                    </c:if>
                            </tr>
                        </thead>
                        <!-- First check for coralCondition -->
                        <c:forEach var="biodiversity" items="${listBiodiversity}">
                            <c:if test="${biodiversity.coralCondition == param.coralCondition}">
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
                                        <fmt:formatNumber value="${biodiversity.coralLatitude}" pattern="#0.############" />
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${biodiversity.coralLongitude}" pattern="#0.############" />
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
                                        <div class="condition ${biodiversity.coralCondition eq 'Good' ? 'condition-good' : biodiversity.coralCondition eq 'Fair' ? 'condition-fair' : 'condition-poor'}">
                                            <c:out value="${biodiversity.coralCondition}"/>
                                        </div>                                    </td>
                                    <td>
                                        <c:out value="${biodiversity.coralDataProvider}"/>
                                    </td>

                                    <c:if test="${sessionScope.userType == 'Admin' || sessionScope.userType == 'Researcher'}">
                                        <td>
                                            <a class="action" href="editbiodiversity?coralSampleID=<c:out value='${biodiversity.coralSampleID}'/>">Edit</a> 
                                            <a class="action" onclick="return confirmDelete(${biodiversity.coralSampleID});">Delete</a>
                                            <script>
                                                function confirmDelete(coralSampleID) {
                                                    if (confirm("Are you sure you want to delete coral sample with ID " + coralSampleID + "?")) {
                                                        window.location.href = "deletebiodiversity?coralSampleID=" + coralSampleID;
                                                    }
                                                    return false;
                                                }
                                            </script>                                
                                        </td>
                                    </c:if>
                                </tr>
                            </c:if>
                        </c:forEach>

                        <!-- Second loop for filtering by coralScientificName -->
                        <c:forEach var="biodiversity" items="${listBiodiversity}">
                            <c:choose>
                                <c:when test="${biodiversity.coralScientificName == param.coralScientificName}">
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
                                            <fmt:formatNumber value="${biodiversity.coralLatitude}" pattern="#0.############" />
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${biodiversity.coralLongitude}" pattern="#0.############" />
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
                                            <div class="condition ${biodiversity.coralCondition eq 'Good' ? 'condition-good' : biodiversity.coralCondition eq 'Fair' ? 'condition-fair' : 'condition-poor'}">
                                                <c:out value="${biodiversity.coralCondition}"/>
                                            </div>                                        </td>
                                        <td>
                                            <c:out value="${biodiversity.coralDataProvider}"/>
                                        </td>

                                        <c:if test="${sessionScope.userType == 'Admin' || sessionScope.userType == 'Researcher'}">
                                            <td>
                                                <a class="action" href="editbiodiversity?coralSampleID=<c:out value='${biodiversity.coralSampleID}'/>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                                <a class="action" onclick="return confirmDelete(${biodiversity.coralSampleID});">Delete</a>
                                                <script>
                                                    function confirmDelete(coralSampleID) {
                                                        if (confirm("Are you sure you want to delete coral sample with ID " + coralSampleID + "?")) {
                                                            window.location.href = "deletebiodiversity?coralSampleID=" + coralSampleID;
                                                        }
                                                        return false;
                                                    }
                                                </script>                                
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:when>
                            </c:choose>
                        </c:forEach>

                        <!-- Third loop for filtering by coralStation -->
                        <c:forEach var="biodiversity" items="${listBiodiversity}">
                            <c:choose>
                                <c:when test="${biodiversity.coralStation == param.coralStation}">
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
                                            <fmt:formatNumber value="${biodiversity.coralLatitude}" pattern="#0.############" />
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${biodiversity.coralLongitude}" pattern="#0.############" />
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
                                            <div class="condition ${biodiversity.coralCondition eq 'Good' ? 'condition-good' : biodiversity.coralCondition eq 'Fair' ? 'condition-fair' : 'condition-poor'}">
                                                <c:out value="${biodiversity.coralCondition}"/>
                                            </div>                                        </td>
                                        <td>
                                            <c:out value="${biodiversity.coralDataProvider}"/>
                                        </td>

                                        <c:if test="${sessionScope.userType == 'Admin' || sessionScope.userType == 'Researcher'}">
                                            <td>
                                                <a class="action" href="editbiodiversity?coralSampleID=<c:out value='${biodiversity.coralSampleID}'/>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                                <a class="action" onclick="return confirmDelete(${biodiversity.coralSampleID});">Delete</a>
                                                <script>
                                                    function confirmDelete(coralSampleID) {
                                                        if (confirm("Are you sure you want to delete coral sample with ID " + coralSampleID + "?")) {
                                                            window.location.href = "deletebiodiversity?coralSampleID=" + coralSampleID;
                                                        }
                                                        return false;
                                                    }
                                                </script>                                
                                            </td>
                                        </c:if>>
                                    </tr>
                                </c:when>
                            </c:choose>
                        </c:forEach>

                        <!--No filter-->
                        <c:forEach var="biodiversity" items="${listBiodiversity}">
                            <c:choose>
                                <c:when test="${param.coralScientificName == null && param.coralCondition == null && param.coralStation == null}">
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
                                            <fmt:formatNumber value="${biodiversity.coralLatitude}" pattern="#0.############" />
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${biodiversity.coralLongitude}" pattern="#0.############" />
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
                                            <div class="condition ${biodiversity.coralCondition eq 'Good' ? 'condition-good' : biodiversity.coralCondition eq 'Fair' ? 'condition-fair' : 'condition-poor'}">
                                                <c:out value="${biodiversity.coralCondition}"/>
                                            </div>
                                        </td>
                                        <td>
                                            <c:out value="${biodiversity.coralDataProvider}"/>
                                        </td>

                                        <c:if test="${sessionScope.userType == 'Admin' || sessionScope.userType == 'Researcher'}">
                                            <td>
                                                <a class="action" href="editbiodiversity?coralSampleID=<c:out value='${biodiversity.coralSampleID}'/>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                                <a class="action" onclick="return confirmDelete(${biodiversity.coralSampleID});">Delete</a>
                                                <script>
                                                    function confirmDelete(coralSampleID) {
                                                        if (confirm("Are you sure you want to delete coral sample with ID " + coralSampleID + "?")) {
                                                            window.location.href = "deletebiodiversity?coralSampleID=" + coralSampleID;
                                                        }
                                                        return false;
                                                    }
                                                </script>                                
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:when>
                            </c:choose>
                        </c:forEach>

                    </table>
                </section>
            </div>
        </header>
        <!--include footer-->
        <jsp:include page="footer.jsp" />

        <!--include JavaScript-->
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>

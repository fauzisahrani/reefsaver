<%-- 
    Document   : BiodiversityForm
    Created on : 15 Apr 2024, 10:30:24 am
    Author     : Pojie
    Display Biodiversity Form Page and accept input
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!-- Meta Tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Title -->
        <title>Reef Saver</title>

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@300;900&display=swap"
              rel="stylesheet">

        <!-- Stylesheet -->
        <style>
            <%@ include file="css/styleBiodiversity.css"%>
        </style>
    </head>
    <body>
        <header>
            <div class="wrapper">
                <nav>
                    <div class="logo">ReefSaver</div>

                    <ul>
                        <li><a href="Homepage.jsp">Home</a></li>
                        <li>
                            <a href="<%=request.getContextPath()%>/listbiodiversity" class="btn light"
                               onclick="return confirm('Are you sure you want to discard current progress?');">
                                Coral Reefs Data
                            </a>
                        </li>
                        <li><a href="<%=request.getContextPath()%>/listactivity">Conservation Activity</a></li>
                        <li><a href="News.jsp">News</a></li>
                        <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers</a></li>
                        <li><a href="<%=request.getContextPath()%>/listUser">User</a></li>
                        <li><a href="UserProfile.jsp">Profile</a></li>
                        <li><a href="LoginForm.jsp">Log Out</a></li>
                    </ul>
                </nav>
                <!-- End of Desktop Navigation Menu-->
                <section class="form-section">
                    <div class="form-card">
                        <c:if test="${biodiversity != null}">
                            <div class="prompt">
                                Update Coral Details
                            </div>
                        </c:if>
                        <c:if test="${biodiversity == null}">      
                            <div class="prompt">
                                Add New Coral Sample
                            </div>
                        </c:if>
                        <div class="form">
                            <c:if test="${biodiversity != null}">
                                <form action="updatebiodiversity" method="post">
                                </c:if>
                                <c:if test="${biodiversity == null}">
                                    <form action="insertbiodiversity" method="post">
                                    </c:if>
                                    <div>
                                        <c:if test="${biodiversity != null}">
                                            <input type="hidden" name="coralSampleID" 
                                                   value="<c:out value="${biodiversity.coralSampleID}" />"/>
                                        </c:if>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Scientific Name</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="text"
                                                       value="<c:out value='${biodiversity.coralScientificName}'/>"
                                                       name="coralScientificName" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Species (if any)</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="text"
                                                       value="<c:out value='${biodiversity.coralSpecies}'/>"
                                                       name="coralSpecies">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="coralCategory">Growth Form</label>
                                            </div>  
                                            <select class="col-75" name="coralCategory" id="coralCategory">
                                                <option value="N/A">Select Growth Form</option>
                                                <option value="Branching">Branching</option>
                                                <option value="Digitate">Digitate</option>
                                                <option value="Encrusting">Encrusting</option>
                                                <option value="Foliose">Foliose</option>
                                                <option value="Laminar">Laminar</option>
                                                <option value="Massive">Massive</option>
                                                <option value="Massive-platy">Massive-platy</option>
                                                <option value="Submassive">Submassive</option>
                                                <option value="Tabulate">Tabulate</option>

                                                <!-- Add more options as needed -->
                                            </select>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Site</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="text" value="<c:out value='${biodiversity.coralStation}'/>"
                                                       name="coralStation" required="required"> 
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Observation Date</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="date" value="<c:out value='${biodiversity.coralObservationDate}'/>"
                                                       name="coralObservationDate" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Latitude</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="number" step="0.001" value="<c:out value='${biodiversity.coralLatitude}'/>"
                                                       name="coralLatitude" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Longitude</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="number" step="0.001" value="<c:out value='${biodiversity.coralLongitude}'/>"
                                                       name="coralLongitude" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Locality</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="text" value="<c:out value='${biodiversity.coralLocality}'/>"
                                                       name="coralLocality" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Depth (m)</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="number" step="0.001" value="<c:out value='${biodiversity.coralDepth}'/>"
                                                       name="coralDepth" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Repository</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="text" value="<c:out value='${biodiversity.coralRepository}'/>"
                                                       name="coralRepository" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Condition</label>
                                            </div>
                                            <select class="col-75" name="coralCondition" id="coralCondition" required="required"
                                                    value="<c:out value='${biodiversity.coralCondition}'/>">
                                                <option value="">Select Condition</option>
                                                <option value="Good">Good</option>
                                                <option value="Fair">Fair</option>
                                                <option value="Poor">Poor</option>
                                                <!-- Add more options as needed -->
                                            </select>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Data Collector</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="text" value="<c:out value='${biodiversity.coralDataProvider}'/>"
                                                       name="coralDataProvider" required="required">
                                            </div>
                                        </div>

                                        <button class="btn dark" type="submit">Submit</button>     
                                </form>
                        </div>
                    </div>
            </div>
        </section>
    </div>
</header>
<!-- End of the header section -->

<!--include footer-->
<jsp:include page="footer.jsp" />

<!--include JavaScript-->
<script src="js/main.js" type="text/javascript"></script>
</body>
</html>
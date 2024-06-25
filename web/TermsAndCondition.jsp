<%-- 
    Document   : AboutUs
    Created on : 24 Jun 2024, 11:54:30 pm
    Author     : Pojie
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

        <!-- Include Stylesheet -->
        <style>
            <%@ include file="css/styleOthers.css"%>
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
                            <c:if test="${sessionScope.userType == 'Admin'}">
                            <li>
                                <a href="<%=request.getContextPath()%>/listUser">User</a>
                            </li>                        
                        </c:if>                        
                        <li><a href="UserProfile.jsp">Profile</a></li>
                        <li><a href="LoginForm.jsp">Log Out</a></li>
                    </ul>
                </nav>
                <!-- End of Desktop Navigation Menu-->
                <section class="form-section">
                    <div class="form-card">
                        <div class="prompt">
                            <h2>Terms & Condition</h2>
                        </div>

                        <div class="section" id="introduction">
                            <h2>1. Introduction</h2>
                            <p>Welcome to Reef Saver! These Terms and Conditions ("Terms") govern your use of the Reef Saver website and its services, which include managing users, coral biodiversity, conservation activities, marine news, and the researchers network. By accessing or using our website, you agree to comply with and be bound by these Terms. If you do not agree to these Terms, please do not use our services.</p>
                        </div>

                        <div class="section" id="definitions">
                            <h2>2. Definitions</h2>
                            <ul>
                                <li><strong>"Website"</strong> refers to Reef Saver and all its associated pages and content.</li>
                                <li><strong>"Services"</strong> include all features and functionalities provided by Reef Saver.</li>
                                <li><strong>"User"</strong> refers to anyone who accesses or uses the Website and its Services.</li>
                                <li><strong>"Content"</strong> refers to all text, images, data, and other materials available on the Website.</li>
                                <li><strong>"Researchers Network"</strong> refers to the platform within Reef Saver where researchers can connect and collaborate.</li>
                            </ul>
                        </div>

                        <div class="section" id="user-management">
                            <h2>3. User Management</h2>
                            <h3>3.1 Registration and Account</h3>
                            <ul>
                                <li>Users must register and create an account to access certain features.</li>
                                <li>Users agree to provide accurate, current, and complete information during registration.</li>
                                <li>Users are responsible for maintaining the confidentiality of their account information.</li>
                                <li>Users must immediately notify Reef Saver of any unauthorized use of their account.</li>
                            </ul>

                            <h3>3.2 User Conduct</h3>
                            <ul>
                                <li>Users agree to use the Website and Services for lawful purposes only.</li>
                                <li>Users must not engage in any activity that could harm the Website or other users.</li>
                                <li>Users must not upload or share content that is defamatory, obscene, or otherwise inappropriate.</li>
                            </ul>
                        </div>

                        <div class="section" id="coral-biodiversity">
                            <h2>4. Coral Biodiversity Management</h2>
                            <h3>4.1 Data Submission</h3>
                            <ul>
                                <li>
                                    Users may submit data related to coral biodiversity. 
                                </li>
                                <li>
                                    Users must ensure the accuracy and integrity of the data submitted. 
                                </li>
                                <li>
                                    By submitting data, users grant Reef Saver a non-exclusive, royalty-free license to use, distribute, and display the data.
                                </li>
                            </ul>

                            <h3>4.2 Data Use</h3>
                            <ul>
                                <li>Reef Saver will use the data to monitor and manage coral biodiversity.</li>
                                <li>Data may be shared with third-party researchers and organizations for conservation purposes.</li>
                            </ul>                        </div>

                        <div class="section" id="conservation-activity">
                            <h2>5. Conservation Activity Management</h2>
                            <h3>5.1 Participation</h3>
                            <ul>
                                <li>Users may participate in conservation activities organized through the Website.</li>
                                <li>Users must follow all guidelines and instructions provided for each activity.</li>
                                <li>Participation is voluntary and at the user’s own risk.</li>
                            </ul>
                            <h3>5.2 Reporting</h3>
                            <ul>
                                <li>Users may report the progress and outcomes of conservation activities.</li>
                                <li>Reports must be accurate and honest.</li>
                            </ul>
                        </div>


                        <div class="section" id="marine-news">
                            <h2>6. Marine News Management</h2>
                            <h3>6.1 Content Submission</h3>
                            <ul>
                                <li>Users can submit articles and news related to marine conservation.</li>
                                <li>Submissions must be original and not infringe on any third-party rights.</li>
                                <li>By submitting content, users grant Reef Saver a non-exclusive, royalty-free license to use, distribute, and display the content.</li>
                            </ul>
                            <h3>6.2 Editorial Rights</h3>
                            <ul>
                                <li>Reef Saver reserves the right to edit, reject, or remove any content submitted.</li>
                            </ul>
                        </div>


                        <div class="section" id="researchers-network">
                            <h2>7. Researchers Network Management</h2>
                            <h3>7.1 Membership</h3>
                            <ul>
                                <li>Researchers can join the Researchers Network to collaborate and share information.</li>
                                <li>Membership is subject to verification of credentials and expertise.</li>
                            </ul>
                            <h3>7.2 Collaboration</h3>
                            <ul>
                                <li>Members are encouraged to collaborate on projects and share research findings.</li>
                                <li>Members must respect the intellectual property and confidentiality of others.</li>
                            </ul>
                        </div>

                        <div class="section" id="intellectual-property">
                            <h2>8. Intellectual Property</h2>
                            <ul>
                                <li>All content on the Website is owned by Reef Saver or its licensors.</li>
                                <li>Users must not use any content without prior written permission from Reef Saver.</li>
                            </ul>
                        </div>

                        <div class="section" id="privacy">
                            <h2>9. Privacy</h2>
                            <ul>
                                <li>Reef Saver is committed to protecting users' privacy.</li>
                                <li>Personal information collected will be used in accordance with our Privacy Policy.</li>
                            </ul>
                        </div>

                        <div class="section" id="disclaimers">
                            <h2>10. Disclaimers</h2>
                            <ul>
                                <li>The Website and Services are provided "as is" without warranties of any kind.</li>
                                <li>Reef Saver does not guarantee the accuracy, completeness, or reliability of any content.</li>
                            </ul>
                        </div>

                        <div class="section" id="limitation-of-liability">
                            <h2>11. Limitation of Liability</h2>
                            <ul>
                                <li>Reef Saver shall not be liable for any indirect, incidental, or consequential damages arising from the use of the Website or Services.</li>
                            </ul>
                        </div>

                        <div class="section" id="changes-to-terms">
                            <h2>12. Changes to Terms</h2>
                            <ul>
                                <li>Reef Saver reserves the right to modify these Terms at any time.</li>
                                <li>Users will be notified of significant changes, and continued use of the Website constitutes acceptance of the new Terms.</li>
                            </ul>
                        </div>

                        <div class="section" id="governing-law">
                            <h2>13. Governing Law</h2>
                            <ul>
                                <li>These Terms shall be governed by and construed in accordance with the laws of [Your Country/State].</li>
                            </ul>
                        </div>

                        <div class="section" id="contact-information">
                            <h2>14. Contact Information</h2>
                            <ul>
                                <li>For any questions or concerns regarding these Terms, please contact us at:</li>
                                <li>Email: <a href="mailto:s63721@ocean.umt.edu.my">s63721@ocean.umt.edu.my</a></li>
                                <li>Address: Universiti Malaysia Terengganu</li>
                            </ul>
                        </div>


                        <p>By using Reef Saver, you acknowledge that you have read, understood, and agree to these Terms and Conditions.</p>




                    </div>
            </div>
        </section>
    </header>
    <!--include footer-->
    <jsp:include page="footer.jsp" />

    <!--include JavaScript-->
    <script src="js/main.js" type="text/javascript"></script>
</body>
</html>

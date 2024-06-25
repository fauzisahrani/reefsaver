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
                        <li><a href="<%=request.getContextPath()%>/listUser">User</a></li>
                        <li><a href="UserProfile.jsp">Profile</a></li>
                        <li><a href="LoginForm.jsp">Log Out</a></li>
                    </ul>
                </nav>
                <!-- End of Desktop Navigation Menu-->
                <section class="form-section">
                    <div class="form-card">
                        <div class="prompt">
                            <h2>Privacy Policy</h2>
                        </div>

                        <div class="section" id="introduction">
                            <h2>1. Introduction</h2>
                            <p>Welcome to Reef Saver! We are committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website and use our services. By using our website, you agree to the terms of this Privacy Policy.</p>
                        </div>

                        <div class="section" id="information-we-collect">
                            <h2>2. Information We Collect</h2>
                            <h3>2.1 Personal Information</h3>
                            <ul>
                                <li>We may collect personal information such as your name, email address, phone number, and mailing address when you register on our website or contact us.</li>
                            </ul>
                            <h3>2.2 Non-Personal Information</h3>
                            <ul>
                                <li>We may collect non-personal information such as your browser type, operating system, IP address, and browsing behavior through cookies and similar technologies.</li>
                            </ul>
                        </div>

                        <div class="section" id="how-we-use-information">
                            <h2>3. How We Use Your Information</h2>
                            <ul>
                                <li>To provide, operate, and maintain our website and services.</li>
                                <li>To improve, personalize, and expand our website and services.</li>
                                <li>To communicate with you, including for customer service, updates, and promotional purposes.</li>
                                <li>To process your transactions and manage your orders.</li>
                                <li>To analyze usage patterns and improve our website and services.</li>
                                <li>To comply with legal obligations and protect our rights.</li>
                            </ul>
                        </div>

                        <div class="section" id="how-we-share-information">
                            <h2>4. How We Share Your Information</h2>
                            <ul>
                                <li>We may share your information with service providers who assist us in operating our website and providing our services.</li>
                                <li>We may share your information with third-party researchers and organizations for conservation purposes.</li>
                                <li>We may share your information if required by law or to protect our rights and the safety of others.</li>
                                <li>We do not sell or rent your personal information to third parties for marketing purposes.</li>
                            </ul>
                        </div>

                        <div class="section" id="cookies-and-tracking-technologies">
                            <h2>5. Cookies and Tracking Technologies</h2>
                            <ul>
                                <li>We use cookies and similar tracking technologies to collect and store information about your interactions with our website.</li>
                                <li>You can control the use of cookies through your browser settings. However, disabling cookies may affect the functionality of our website.</li>
                            </ul>
                        </div>

                        <div class="section" id="data-security">
                            <h2>6. Data Security</h2>
                            <ul>
                                <li>We implement reasonable security measures to protect your information from unauthorized access, use, or disclosure.</li>
                                <li>While we strive to protect your information, no method of transmission over the internet or electronic storage is completely secure.</li>
                            </ul>
                        </div>

                        <div class="section" id="your-privacy-rights">
                            <h2>7. Your Privacy Rights</h2>
                            <ul>
                                <li>You have the right to access, update, or delete your personal information.</li>
                                <li>You have the right to opt-out of receiving promotional communications from us.</li>
                                <li>You have the right to request a copy of the information we hold about you.</li>
                                <li>To exercise these rights, please contact us at <a href="mailto:s63721@ocean.umt.edu.my">s63721@ocean.umt.edu.my</a>.</li>
                            </ul>
                        </div>

                        <div class="section" id="third-party-links">
                            <h2>8. Third-Party Links</h2>
                            <ul>
                                <li>Our website may contain links to third-party websites. We are not responsible for the privacy practices or content of these websites.</li>
                                <li>We encourage you to review the privacy policies of any third-party websites you visit.</li>
                            </ul>
                        </div>

                        <div class="section" id="changes-to-this-policy">
                            <h2>9. Changes to This Privacy Policy</h2>
                            <ul>
                                <li>We may update this Privacy Policy from time to time. We will notify you of any significant changes by posting the new policy on our website.</li>
                                <li>Your continued use of our website after any changes to this Privacy Policy constitutes your acceptance of the new terms.</li>
                            </ul>
                        </div>

                        <div class="section" id="contact-us">
                            <h2>10. Contact Us</h2>
                            <ul>
                                <li>If you have any questions or concerns about this Privacy Policy, please contact us at:</li>
                                <li>Email: <a href="mailto:s63721@ocean.umt.edu.my">s63721@ocean.umt.edu.my</a></li>
                                <li>Address: Universiti Malaysia Terengganu</li>
                            </ul>
                        </div>
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

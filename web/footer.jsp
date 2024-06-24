<%-- 
    Document   : footer
    Created on : 18 Jun 2024, 8:29:30 pm
    Author     : Pojie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style><%@ include file="css/styleFooter.css"%></style>
    </head>
    <footer>
        <div class="wrapper">
            <div class="links-container">
                <div class="links">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="https://www.aims.gov.au/research-topics/monitoring-and-discovery/monitoring-great-barrier-reef/reef-monitoring-sampling-methods">Monitoring Methods</a></li>
                        <li><a href="AboutUs.jsp">About Us</a></li>
                        <li><a href="mailto:s63721@ocean.umt.edu.my">Contact Us</a></li>
                        <li><a href="PrivacyPolicy.jsp">Privacy Policy</a></li>
                        <li><a href="TermsAndCondition.jsp">Terms & Conditions</a></li>
                    </ul>
                </div>

                <div class="links">
                    <h3>Features</h3>
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/listbiodiversity">Coral Reefs Data</a></li>
                        <li><a href="<%=request.getContextPath()%>/listactivity">Conservation Activities</a></li>
                        <li><a href="News.jsp">Marine News</a></li>
                        <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers List</a></li>
                    </ul>
                </div>

                <div class="links">
                    <h3>Contact Us</h3>
                    <ul>
                        <li><a href="mailto:s63721@ocean.umt.edu.my">s63721@ocean.umt.edu.my</a></li>
                    </ul>
                    <div class="social">
                        <a href="https://www.facebook.com/inosumt/?locale=ms_MY">
                            <img src="images/Facebook Icon.svg" alt="">
                        </a>
                        <a href="https://www.instagram.com/inos_umt/">
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
</html>

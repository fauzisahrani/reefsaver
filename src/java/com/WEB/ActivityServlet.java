package com.WEB;

/**
 *
 * @author Pojie Act to perform CRUD process
 */
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import DAO class
import com.DAO.ActivityDAO;

//import Model class
import com.Model.Activity;

//import annotation to allow file uploading
import javax.servlet.annotation.MultipartConfig;

//import to accept file as Part from JSP
import javax.servlet.http.Part;

//import to ccnvert Part to InputStream before store in database
import java.io.InputStream;

@WebServlet("/listactivity")
@MultipartConfig(maxFileSize = 16177216) //up to 16mb
public class ActivityServlet extends HttpServlet {

    private ActivityDAO activityDAO;

    public void init() {
        activityDAO = new ActivityDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/newactivity":
                    showNewForm(request, response);
                    break;
                case "/insertactivity":
                    insertActivity(request, response);
                    break;
                case "/deleteactivity":
                    deleteActivity(request, response);
                    break;
                case "/editactivity":
                    showEditForm(request, response);
                    break;
                case "/viewactivity":
                    showDetails(request, response);
                    break;
                case "/updateactivity":
                    updateActivity(request, response);
                    break;
                default:
                    listActivity(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listActivity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ServletException {
        List<Activity> listActivity = activityDAO.selectAllActivity();
        request.setAttribute("listActivity", listActivity);
        RequestDispatcher dispatcher = request.getRequestDispatcher("activityList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("activityForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int activityID = Integer.parseInt(request.getParameter("activityID"));
        Activity existingActivity = activityDAO.selectActivity(activityID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("activityForm.jsp");
        request.setAttribute("activity", existingActivity);
        dispatcher.forward(request, response);
    }

    private void showDetails(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int activityID = Integer.parseInt(request.getParameter("activityID"));
        Activity existingActivity = activityDAO.selectActivity(activityID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("activityDetails.jsp");
        request.setAttribute("activity", existingActivity);
        dispatcher.forward(request, response);
    }

    private void insertActivity(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String activityName = request.getParameter("activityName");
        String activityDate = request.getParameter("activityDate");
        String activityVenue = request.getParameter("activityVenue");
        String activityOrganizer = request.getParameter("activityOrganizer");
        String activityParticipantNo = request.getParameter("activityParticipantNo");
        String activityRegisterDue = request.getParameter("activityRegisterDue");
        String activityDesc = request.getParameter("activityDesc");

        //Handling Image
        Part imagePart = request.getPart("activityImagePart");
        InputStream activityImageInputStream = imagePart.getInputStream(); //convert to InputStream

        Activity newActivity = new Activity(activityName, activityDate,
                activityVenue, activityOrganizer, activityParticipantNo,
                activityRegisterDue, activityDesc, activityImageInputStream);
        activityDAO.insertActivity(newActivity);
        response.sendRedirect("listactivity");
    }

    private void updateActivity(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int activityID = Integer.parseInt(request.getParameter("activityID"));
        String activityName = request.getParameter("activityName");
        String activityDate = request.getParameter("activityDate");
        String activityVenue = request.getParameter("activityVenue");
        String activityOrganizer = request.getParameter("activityOrganizer");
        String activityParticipantNo = request.getParameter("activityParticipantNo");
        String activityRegisterDue = request.getParameter("activityRegisterDue");
        String activityDesc = request.getParameter("activityDesc");

        //Handling Image
        Part imagePart = request.getPart("activityImagePart");
        InputStream activityImageInputStream = imagePart.getInputStream(); //convert to InputStream

        Activity activity = new Activity(activityID, activityName, activityDate,
                activityVenue, activityOrganizer, activityParticipantNo, activityRegisterDue,
                activityDesc, activityImageInputStream);
        activityDAO.updateActivity(activity);
        response.sendRedirect("listactivity");
    }

    private void deleteActivity(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int activityID = Integer.parseInt(request.getParameter("activityID"));
        activityDAO.deleteActivity(activityID);
        response.sendRedirect("listactivity");
    }
}

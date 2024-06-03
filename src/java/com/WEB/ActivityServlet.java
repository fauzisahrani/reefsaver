/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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

import com.DAO.ActivityDAO;
import com.Model.Activity;

@WebServlet("/listactivity")
public class ActivityServlet extends HttpServlet {

    // private static final long serialVersionUID = 1 L;
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
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertActivity(request, response);
                    break;
                case "/delete":
                    deleteActivity(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/view":
                    showDetails(request, response);
                    break;
                case "/update":
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
            throws SQLException, IOException {
        String activityName = request.getParameter("activityName");
        String activityDate = request.getParameter("activityDate");
        String activityVenue = request.getParameter("activityVenue");
        String activityOrganizer = request.getParameter("activityOrganizer");
        String activityParticipantNo = request.getParameter("activityParticipantNo");
        String activityRegisterDue = request.getParameter("activityRegisterDue");
        String activityDesc = request.getParameter("activityDesc");
        String activityImage = request.getParameter("activityImage");
        Activity newActivity = new Activity(activityName, activityDate,
                activityVenue, activityOrganizer, activityParticipantNo,
                activityRegisterDue, activityDesc, activityImage);
        activityDAO.insertActivity(newActivity);
        response.sendRedirect("list");
    }

    private void updateActivity(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int activityID = Integer.parseInt(request.getParameter("activityID"));
        String activityName = request.getParameter("activityName");
        String activityDate = request.getParameter("activityDate");
        String activityVenue = request.getParameter("activityVenue");
        String activityOrganizer = request.getParameter("activityOrganizer");
        String activityParticipantNo = request.getParameter("activityParticipantNo");
        String activityRegisterDue = request.getParameter("activityRegisterDue");
        String activityDesc = request.getParameter("activityDesc");
        String activityImage = request.getParameter("activityImage");

        Activity activity = new Activity(activityID, activityName, activityDate,
                activityVenue, activityOrganizer, activityParticipantNo, activityRegisterDue,
                activityDesc, activityImage);
        activityDAO.updateActivity(activity);
        response.sendRedirect("list");
    }

    private void deleteActivity(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int activityID = Integer.parseInt(request.getParameter("activityID"));
        activityDAO.deleteActivity(activityID);
        response.sendRedirect("list");
    }
}

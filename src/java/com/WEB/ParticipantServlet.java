package com.WEB;

//import participant DAO and Model
import com.DAO.ParticipantDAO;
import com.Model.Participant;

//import activity DAO and Model
import com.DAO.ActivityDAO;
import com.Model.Activity;

//import other classes
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author Pojie
 *
 */
@WebServlet("/participant")
public class ParticipantServlet extends HttpServlet {

    //declare DAO for activity and participant
    private ParticipantDAO participantDAO;
    private ActivityDAO activityDAO;

    //init constructor to setup dependencies
    public void init() {
        participantDAO = new ParticipantDAO();
        activityDAO = new ActivityDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/newParticipant":
                    showNewForm(request, response);
                    break;
                case "/insertParticipant":
                    insertParticipant(request, response);
                    break;
                case "/deleteParticipant":
                    deleteParticipant(request, response);
                    break;
                case "/editParticipant":
                    showEditForm(request, response);
                    break;
                case "/updateParticipant":
                    updateParticipant(request, response);
                    break;
                case "/listParticipantByActivityID":
                    listParticipantByActivityID(request, response);
                    break;
                default:
                    listParticipant(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listParticipant(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ServletException {
        List<Participant> listParticipant = participantDAO.selectAllParticipant();
        request.setAttribute("listParticipant", listParticipant);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ParticipantList.jsp");
        dispatcher.forward(request, response);
    }

    private void listParticipantByActivityID(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ServletException {
        int activityID = Integer.parseInt(request.getParameter("activityID"));
        List<Participant> listParticipant = participantDAO.selectAllParticipantByActivityID();
        RequestDispatcher dispatcher = request.getRequestDispatcher("ParticipantList.jsp");
        request.setAttribute("participant", listParticipant);
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("ParticipantForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int participantID = Integer.parseInt(request.getParameter("participantID"));
        Participant existingParticipant = participantDAO.selectParticipantByID(participantID);

        List<Activity> activity = activityDAO.selectAllActivity();

        RequestDispatcher dispatcher = request.getRequestDispatcher("ParticipantForm.jsp");
        request.setAttribute("participant", existingParticipant);
        request.setAttribute("activity", activity);
        dispatcher.forward(request, response);
    }

    private void insertParticipant(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String participantName = request.getParameter("participantName");
        String participantPhoneNo = request.getParameter("participantPhoneNo");
        String participantAddress = request.getParameter("participantAddress");
        String participantInstitution = request.getParameter("participantInstitution");
        String participantShirtSize = request.getParameter("participantShirtSize");
        int activityID = Integer.parseInt(request.getParameter("activityID"));

        // Retrieve the activity object from the database 
        Activity activity = activityDAO.selectActivity(activityID);

        Participant newParticipant = new Participant(participantName, participantPhoneNo,
                participantAddress, participantInstitution, participantShirtSize, activity);
        participantDAO.insertParticipant(newParticipant);
        response.sendRedirect("listParticipant");
    }

    private void updateParticipant(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int participantID = Integer.parseInt(request.getParameter("participantID"));
        String participantName = request.getParameter("participantName");
        String participantPhoneNo = request.getParameter("participantPhoneNo");
        String participantAddress = request.getParameter("participantAddress");
        String participantInstitution = request.getParameter("participantInstitution");
        String participantShirtSize = request.getParameter("participantShirtSize");
        int activityID = Integer.parseInt(request.getParameter("activityID"));

        // Retrieve the custom object from the database
        Activity activity = activityDAO.selectActivity(activityID);

        Participant participant = new Participant(participantID, participantName,
                participantPhoneNo, participantAddress, participantInstitution,
                participantShirtSize, activity);
        participantDAO.updateParticipant(participant);
        response.sendRedirect("listParticipant");
    }

    private void deleteParticipant(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int participantID = Integer.parseInt(request.getParameter("participantID"));
        participantDAO.deleteParticipant(participantID);
        response.sendRedirect("listParticipant");
    }
}

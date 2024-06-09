package com.WEB;

import com.DAO.ParticipantDAO;
import com.Model.Participant;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Pojie
 *
 */
@WebServlet("/listparticipant")
public class ParticipantServlet extends HttpServlet {

    // private static final long serialVersionUID = 1 L;
    private ParticipantDAO participantDAO;

    public void init() {
        participantDAO = new ParticipantDAO();
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
                case "/newparticipant":
                    showNewForm(request, response);
                    break;
                case "/insertparticipant":
                    insertParticipant(request, response);
                    break;
                case "/deleteparticipant":
                    deleteParticipant(request, response);
                    break;
                case "/editparticipant":
                    showEditForm(request, response);
                    break;
                case "/updateparticipant":
                    updateParticipant(request, response);
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

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("ParticipantForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int participantID = Integer.parseInt(request.getParameter("participantID"));
        Participant existingParticipant = participantDAO.selectParticipant(participantID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ParticipantForm.jsp");
        request.setAttribute("participant", existingParticipant);
        dispatcher.forward(request, response);
    }

    private void insertParticipant(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String participantName = request.getParameter("participantName");
        String participantPhoneNo = request.getParameter("participantPhoneNo");
        String participantAddress = request.getParameter("participantAddress");
        String participantInstitution = request.getParameter("participantInstitution");
        String participantShirtSize = request.getParameter("participantShirtSize");

        Participant newParticipant = new Participant(participantName, participantPhoneNo,
                participantAddress, participantInstitution, participantShirtSize);
        participantDAO.insertParticipant(newParticipant);
        response.sendRedirect("listparticipant");
    }

    private void updateParticipant(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int participantID = Integer.parseInt(request.getParameter("participantID"));
        String participantName = request.getParameter("participantName");
        String participantPhoneNo = request.getParameter("participantPhoneNo");
        String participantAddress = request.getParameter("participantAddress");
        String participantInstitution = request.getParameter("participantInstitution");
        String participantShirtSize = request.getParameter("participantShirtSize");

        Participant participant = new Participant(participantID, participantName,
                participantPhoneNo, participantAddress, participantInstitution,
                participantShirtSize);
        participantDAO.updateParticipant(participant);
        response.sendRedirect("listparticipant");
    }

    private void deleteParticipant(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int participantID = Integer.parseInt(request.getParameter("participantID"));
        participantDAO.deleteParticipant(participantID);
        response.sendRedirect("listparticipant");
    }
}

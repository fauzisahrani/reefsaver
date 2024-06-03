/**
 *
 * @author Pojie act to perform CRUD process
 * Servlet = Controller
 */
package com.WEB;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ResearchersDAO;
import com.Model.Researchers;

@WebServlet("/researchers")
public class ResearchersServlet extends HttpServlet {

    private ResearchersDAO ResearchersDAO;

    public void init() {
        ResearchersDAO = new ResearchersDAO();
    }

    //doPost method just execute what doGet method want
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/listresearchers":
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Researchers> listUser = ResearchersDAO.selectAllUser();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ResearchersList.jsp");
        dispatcher.forward(request, response);
    }
}

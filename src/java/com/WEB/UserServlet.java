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

import com.DAO.UserDAO;
import com.Model.User;

//import annotation to allow file uploading
import javax.servlet.annotation.MultipartConfig;

//import to accept file as Part from JSP
import javax.servlet.http.Part;

//import to ccnvert Part to InputStream before store in database
import java.io.InputStream;
import static java.lang.System.out;

/**
 *
 * @author Pojie act to perform CRUD process
 */
@WebServlet("/User")
@MultipartConfig(maxFileSize = 16177216) //up to 16mb
public class UserServlet extends HttpServlet {

    //private static final long serialVersionUID = 1 L;
    private UserDAO UserDAO;

    public void init() {
        UserDAO = new UserDAO();
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
                case "/newUser":
                    showNewForm(request, response);
                    break;
                case "/insertUser":
                    insertUser(request, response);
                    break;
                case "/deleteUser":
                    deleteUser(request, response);
                    break;
                case "/editUser":
                    showEditForm(request, response);
                    break;
                case "/updateUser":
                    updateUser(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<User> listUser = UserDAO.selectAllUser();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("UserList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("UserForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        User existingUser = UserDAO.selectUser(userID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateUserForm.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPassword = request.getParameter("userPassword");
        String userType = request.getParameter("userType");

        User newUser = new User(userName, userEmail, userPassword, userType);
        UserDAO.insertUser(newUser);
        response.sendRedirect("LoginForm.jsp");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPassword = request.getParameter("userPassword");
        String userType = request.getParameter("userType");

        //Handling Image
        Part imagePart = request.getPart("userImage");//accept as Part
        InputStream imageInputStream = imagePart.getInputStream();//convert to InputStream

        User User = new User(userID, userName, userEmail, userPassword,
                userType, imageInputStream);
        UserDAO.updateUser(User);
        response.sendRedirect("listUser");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String userID = request.getParameter("userID");
        UserDAO.deleteUser(userID);
        response.sendRedirect("listUser");
    }
}

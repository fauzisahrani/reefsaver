//Servlet = Controller
/**
 *
 * @author Pojie act to perform CRUD process
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

import com.DAO.BiodiversityDAO;
import com.Model.Biodiversity;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/listbiodiversity")    

public class BiodiversityServlet extends HttpServlet {

    //private static final long serialVersionUID = 1 L;
    private BiodiversityDAO BiodiversityDAO;

    public void init() {
        BiodiversityDAO = new BiodiversityDAO();
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
                case "/newbiodiversity":
                    showNewForm(request, response);
                    break;
                case "/insertbiodiversity":
                    insertBiodiversity(request, response);
                    break;
                case "/deletebiodiversity":
                    deleteBiodiversity(request, response);
                    break;
                case "/editbiodiversity":
                    showEditForm(request, response);
                    break;
                case "/updatebiodiversity":
                    updateBiodiversity(request, response);
                    break;
                default:
                    listBiodiversity(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (ParseException ex) {
            Logger.getLogger(BiodiversityServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void listBiodiversity(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Biodiversity> listBiodiversity = BiodiversityDAO.selectAllBiodiversity();
        request.setAttribute("listBiodiversity", listBiodiversity);
        RequestDispatcher dispatcher = request.getRequestDispatcher("BiodiversityList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("BiodiversityForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int coralSampleID = Integer.parseInt(request.getParameter("coralSampleID"));
        Biodiversity existingBiodiversity = BiodiversityDAO.selectBiodiversity(coralSampleID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("BiodiversityForm.jsp");
        request.setAttribute("biodiversity", existingBiodiversity);
        dispatcher.forward(request, response);
    }

    private void insertBiodiversity(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ParseException {
        String coralScientificName = request.getParameter("coralScientificName");
        String coralCategory = request.getParameter("coralCategory");
        String coralStation = request.getParameter("coralStation");
        // Assuming coralObservationDate is a String parameter obtained from the request
        String coralObservationDateString = request.getParameter("coralObservationDate");
        java.util.Date coralObservationDateUtil = null;

        // Define the format of the date string
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        try {
            // Parse the string into a java.util.Date object
            coralObservationDateUtil = dateFormat.parse(coralObservationDateString);
        } catch (ParseException e) {
            // Handle parsing exception
            e.printStackTrace(); // Or handle it in an appropriate way
        }

        // Convert java.util.Date to java.sql.Date
        java.sql.Date coralObservationDate = new java.sql.Date(coralObservationDateUtil.getTime());

        double coralLatitude = Double.parseDouble(request.getParameter("coralLatitude"));
        double coralLongitude = Double.parseDouble(request.getParameter("coralLongitude"));
        String coralLocality = request.getParameter("coralLocality");
        double coralDepth = Double.parseDouble(request.getParameter("coralDepth"));
        String coralRepository = request.getParameter("coralRepository");
        String coralSamplingEquipment = request.getParameter("coralSamplingEquipment");
        String coralDataProvider = request.getParameter("coralDataProvider");

        Biodiversity newBiodiversity = new Biodiversity(coralScientificName,
                coralCategory, coralStation, coralObservationDate, coralLatitude,
                coralLongitude, coralLocality, coralDepth, coralRepository,
                coralSamplingEquipment, coralDataProvider);
        BiodiversityDAO.insertBiodiversity(newBiodiversity);
        response.sendRedirect("listBiodiversity");
    }

    private void updateBiodiversity(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ParseException {
        int coralSampleID = Integer.parseInt(request.getParameter("coralSampleID"));
        String coralScientificName = request.getParameter("coralScientificName");
        String coralCategory = request.getParameter("coralCategory");
        String coralStation = request.getParameter("coralStation");
        
        // Assuming coralObservationDate is a String parameter obtained from the request
        String coralObservationDateString = request.getParameter("coralObservationDate");
        java.util.Date coralObservationDateUtil = null;

        // Define the format of the date string
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        try {
            // Parse the string into a java.util.Date object
            coralObservationDateUtil = dateFormat.parse(coralObservationDateString);
        } catch (ParseException e) {
            // Handle parsing exception
            e.printStackTrace(); // Or handle it in an appropriate way
        }

        // Convert java.util.Date to java.sql.Date
        java.sql.Date coralObservationDate = new java.sql.Date(coralObservationDateUtil.getTime());

        double coralLatitude = Double.parseDouble(request.getParameter("coralLatitude"));
        double coralLongitude = Double.parseDouble(request.getParameter("coralLongitude"));
        String coralLocality = request.getParameter("coralLocality");
        double coralDepth = Double.parseDouble(request.getParameter("coralDepth"));
        String coralRepository = request.getParameter("coralRepository");
        String coralSamplingEquipment = request.getParameter("coralSamplingEquipment");
        String coralDataProvider = request.getParameter("coralDataProvider");

        Biodiversity Biodiversity = new Biodiversity(coralSampleID, coralScientificName,
                coralCategory, coralStation, coralObservationDate, coralLatitude,
                coralLongitude, coralLocality, coralDepth, coralRepository,
                coralSamplingEquipment, coralDataProvider);
        BiodiversityDAO.updateBiodiversity(Biodiversity);
        response.sendRedirect("listBiodiversity");
    }

    private void deleteBiodiversity(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int coralSampleID = Integer.parseInt(request.getParameter("coralSampleID"));
        BiodiversityDAO.deleteBiodiversity(coralSampleID);
        response.sendRedirect("listBiodiversity");
    }
}

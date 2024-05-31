/*
The DAO class function is to connect, open and close database
 */
//DAO = Model
//Name package as DAO
package com.DAO;

//Import all classes
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//Import Researchers Class
import com.Model.Researchers;

public class ResearchersDAO {

    Connection connection = null;
    //change 'reefsaver into database name'
    private String jdbcURL = "jdbc:mysql://localhost:3306/reefsaver";
    private String jdbcUsername = "root"; //username
    private String jdbcPassword = "admin"; //password

    //Declare all sql statement up here CRUD
    private static final String SELECT_ALL_USER = "SELECT * FROM user WHERE "
            + "userType = 'Researcher';";

    //UserDAO constructor
    public ResearchersDAO() {
    }

    //separate method to get connection to database reefsaver
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername,
                    jdbcPassword);
        } catch (SQLException e) {
            //TODO Auto-generetd catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            //TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    //method to select all researchers
    public List<Researchers> selectAllUser() {
        //using try-with-resource to avoid closing resources (boiler plate code)
        List<Researchers> User = new ArrayList<>();
        //Step 1: Establishing a Connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connection object
                 PreparedStatement preparedStatement
                = connection.prepareStatement(SELECT_ALL_USER);) {
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            //Step 4: Process the ResultSet object
            while (rs.next()) {
                int userID = rs.getInt("userID");
                String userName = rs.getString("userName");
                String userEmail = rs.getString("userEmail");
                String userField = rs.getString("userField");
                String userInstitution = rs.getString("userInstitution");
                User.add(new Researchers(userID, userName, userEmail, userField,
                        userInstitution));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return User;
    }

    //method to print SQL Statement
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}

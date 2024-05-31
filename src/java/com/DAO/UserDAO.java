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

//Import User Class
import com.Model.User;

public class UserDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/reefsaver"; //change 'reefsaver into database name'
    private String jdbcUsername = "root"; //username
    private String jdbcPassword = "admin"; //password

    //Declare all sql statement up here CRUD
    private static final String INSERT_USER_SQL = "INSERT INTO user (userName, userEmail, userPassword, userType) values (?,?,?,?)";
    private static final String SELECT_USER_BY_ID = "select userID,userName,userEmail,userPassword, userType from user where userID = ?";
    private static final String SELECT_USER_BY_EMAIL = "select userPassword from user where userEmail = ?";
    private static final String SELECT_ALL_USER = "select * from user";
    private static final String DELETE_USER_SQL = "delete from user where userID = ?;";
    private static final String UPDATE_USER_SQL = "update user set userName = ?,userEmail = ?, userPassword = ?, userType = ? where userID = ?;";

    //UserDAO constructor
    public UserDAO() {
    }

    //separate method to get connection to database reefsaver
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            //TODO Auto-generetd catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            //TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    //method to create new user
    public void insertUser(User User) throws SQLException {
        System.out.println(INSERT_USER_SQL);
        //try-with-resource statement will auto close the connection
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, User.getUserName());
            preparedStatement.setString(2, User.getUserEmail());
            preparedStatement.setString(3, User.getUserPassword());
            preparedStatement.setString(4, User.getUserType());
            System.out.println(preparedStatement); //print prepared statement
            preparedStatement.executeUpdate(); //execute statement
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    //method to select user by ID
    public User selectUser(int userID) {
        User User = null;
        //Step1: Establishing a Connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connection object
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, userID);
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            //Step 4: Process the ResultSet object
            while (rs.next()) {
                String userName = rs.getString("userName");
                String userEmail = rs.getString("userEmail");
                String userPassword = rs.getString("userPassword");
                String userType = rs.getString("userType");
                User = new User(userID, userName, userEmail, userPassword, userType);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return User;
    }

    //method to select all user
    public List<User> selectAllUser() {
        //using try-with-resource to avoid closing resources (boiler plate code)
        List<User> User = new ArrayList<>();
        //Step 1: Establishing a Connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connection object
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);) {
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            //Step 4: Process the ResultSet object
            while (rs.next()) {
                int userID = rs.getInt("userID");
                String userName = rs.getString("userName");
                String userEmail = rs.getString("userEmail");
                String userPassword = rs.getString("userPassword");
                String userType = rs.getString("userType");
                User.add(new User(userID, userName, userEmail, userPassword, userType));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return User;
    }

    //method to delete employee
    public boolean deleteUser(String UserID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USER_SQL);) {
            statement.setString(1, UserID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    //method to update User
    public boolean updateUser(User User) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USER_SQL);) {
            statement.setString(1, User.getUserName());
            statement.setString(2, User.getUserEmail());
            statement.setString(3, User.getUserPassword());
            statement.setString(4, User.getUserType());
            statement.setInt(5, User.getUserID());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
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

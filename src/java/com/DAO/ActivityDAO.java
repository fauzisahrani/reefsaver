/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

/**
 *
 * @author Pojie Act as data access object and to open/close database connection
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.Activity;

//activityID	
//activityName	
//activityDate
//activityVenue
//activityOrganizer
//activityParticipantNo
//activityRegisterDue	
//activityDesc	
//activityImage
public class ActivityDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/reefsaver";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_ACTIVITY_SQL = "INSERT INTO activity "
            + "(activityName, activityDate, activityVenue, activityOrganizer, "
            + "activityParticipantNo, activityRegisterDue, activityDesc, "
            + "activityImage) VALUES (?,?,?,?,?,?,?,?)";
    private static final String SELECT_ACTIVITY_BY_ID = "select activityID, "
            + "activityName, activityDate, activityVenue, activityOrganizer, "
            + "activityParticipantNo, activityRegisterDue, activityDesc, "
            + "activityImage from activity where activityID = ?";
    private static final String SELECT_ALL_ACTIVITY = "select * from activity";
    private static final String DELETE_ACTIVITY_SQL = "delete from activity "
            + "where activityID = ?;";
    private static final String UPDATE_ACTIVITY_SQL = "update activity set "
            + "activityName = ?, activityDate = ?, activityVenue = ?, "
            + "activityOrganizer = ?, activityParticipantNo = ?, "
            + "activityRegisterDue = ?, activityDesc = ?, activityImage = ? "
            + "where activityID = ?;";

    public ActivityDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            //TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public void insertActivity(Activity activity) throws SQLException {
        System.out.println(INSERT_ACTIVITY_SQL);
        // try-with-resource statement will auto close the connection
        try (Connection connection = getConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(INSERT_ACTIVITY_SQL)) {
            preparedStatement.setString(1, activity.getActivityName());
            preparedStatement.setString(2, activity.getActivityDate());
            preparedStatement.setString(3, activity.getActivityVenue());
            preparedStatement.setString(4, activity.getActivityOrganizer());
            preparedStatement.setString(5, activity.getActivityParticipantNo());
            preparedStatement.setString(6, activity.getActivityRegisterDue());
            preparedStatement.setString(7, activity.getActivityDesc());
            preparedStatement.setString(8, activity.getActivityImage());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Activity selectActivity(int activityID) {
        Activity activity = null;
        //Step 1: Establishing a Connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connection object
                 PreparedStatement preparedStatement
                = connection.prepareStatement(SELECT_ACTIVITY_BY_ID);) {
            preparedStatement.setInt(1, activityID);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String activityName = rs.getString("activityName");
                String activityDate = rs.getString("activityDate");
                String activityVenue = rs.getString("activityVenue");
                String activityOrganizer = rs.getString("activityOrganizer");
                String activityParticipantNo = rs.getString("activityParticipantNo");
                String activityRegisterDue = rs.getString("activityRegisterDue");
                String activityDesc = rs.getString("activityDesc");
                String activityImage = rs.getString("activityImage");
                activity = new Activity(activityID, activityName, activityDate,
                        activityVenue, activityOrganizer, activityParticipantNo,
                        activityRegisterDue, activityDesc, activityImage);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return activity;
    }

    public List<Activity> selectAllActivity() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Activity> activity = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connection object
                 PreparedStatement preparedStatement
                = connection.prepareStatement(SELECT_ALL_ACTIVITY);) {
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            //Step 4: Process the ResultSet object.
            while (rs.next()) {
                int activityID = rs.getInt("activityID");
                String activityName = rs.getString("activityName");
                String activityDate = rs.getString("activityDate");
                String activityVenue = rs.getString("activityVenue");
                String activityOrganizer = rs.getString("activityOrganizer");
                String activityParticipantNo = rs.getString("activityParticipantNo");
                String activityRegisterDue = rs.getString("activityRegisterDue");
                String activityDesc = rs.getString("activityDesc");
                String activityImage = rs.getString("activityImage");
                activity.add(new Activity(activityID, activityName, activityDate,
                        activityVenue, activityOrganizer, activityParticipantNo,
                        activityRegisterDue, activityDesc, activityImage));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return activity;
    }

    public boolean deleteActivity(int activityID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(DELETE_ACTIVITY_SQL);) {
            statement.setInt(1, activityID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateActivity(Activity activity) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(UPDATE_ACTIVITY_SQL);) {
            statement.setString(1, activity.getActivityName());
            statement.setString(2, activity.getActivityDate());
            statement.setString(3, activity.getActivityVenue());
            statement.setString(4, activity.getActivityOrganizer());
            statement.setString(5, activity.getActivityParticipantNo());
            statement.setString(6, activity.getActivityRegisterDue());
            statement.setString(7, activity.getActivityDesc());
            statement.setString(8, activity.getActivityImage());
            statement.setInt(9, activity.getActivityID());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

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

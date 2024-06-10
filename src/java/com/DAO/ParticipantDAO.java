package com.DAO;

//import referenced table DAO
import com.DAO.ActivityDAO;
//import referenced table Model
import com.Model.Activity;
//import com.Model
import com.Model.Participant;
//import other classes
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.Model.Participant;

/**
 *
 * @author Pojie
 */
public class ParticipantDAO {

    //declare database url, username, password
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/reefsaver"; //change 'reefsaver into database name'
    private String jdbcUsername = "root"; //username
    private String jdbcPassword = "admin"; //password

    //Declare referenced DAO object
    private ActivityDAO activityDAO = new ActivityDAO();

    //Declare all sql statement up here CRUD
    private static final String INSERT_PARTICIPANT_SQL = "INSERT INTO participant "
            + "(participantName, participantPhoneNo, participantAddress, "
            + "participantInstitution, participantShirtSize, activityID) values (?,?,?,?,?,?)";
    private static final String SELECT_PARTICIPANT_BY_ID = "select * from participant "
            + "where participantID = ?";
    private static final String SELECT_ALL_PARTICIPANT_BY_ACTIVITY_ID = "select * from participant "
            + "where activityID = ?";
    private static final String SELECT_ALL_PARTICIPANT = "SELECT * FROM participant";
    private static final String DELETE_PARTICIPANT_SQL = "DELETE from participant "
            + "WHERE participantID = ?;";
    private static final String UPDATE_PARTICIPANT_SQL = "UPDATE participant SET "
            + "participantName = ?, participantPhoneNo = ?, participantAddress = ?, "
            + "participantInstitution = ?, participantShirtSize = ?, activityID = ? "
            + "WHERE participantID = ?;";

    //UserDAO constructor
    public ParticipantDAO() {
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

    //method to create new participant
    public void insertParticipant(Participant participant) throws SQLException {
        System.out.println(INSERT_PARTICIPANT_SQL);
        //try-with-resource statement will auto close the connection
        try (Connection connection = getConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(INSERT_PARTICIPANT_SQL)) {
            preparedStatement.setString(1, participant.getParticipantName());
            preparedStatement.setString(2, participant.getParticipantPhoneNo());
            preparedStatement.setString(3, participant.getParticipantAddress());
            preparedStatement.setString(4, participant.getParticipantInstitution());
            preparedStatement.setString(5, participant.getParticipantShirtSize());
            //first call getter from Participant.java then getter from Activity.java
            preparedStatement.setInt(6, participant.getActivity().getActivityID());
            System.out.println(preparedStatement); //print prepared statement
            preparedStatement.executeUpdate(); //execute statement
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    //method to select participant by ParticipantID
    public Participant selectParticipantByID(int participantID) {
        Participant Participant = null;
        //Step1: Establishing a Connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connection object
                 PreparedStatement preparedStatement
                = connection.prepareStatement(SELECT_PARTICIPANT_BY_ID);) {
            preparedStatement.setInt(1, participantID);
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            //Step 4: Process the ResultSet object
            while (rs.next()) {
                String participantName = rs.getString("participantName");
                String participantPhoneNo = rs.getString("participantPhoneNo");
                String participantAddress = rs.getString("participantAddress");
                String participantInstitution = rs.getString("participantInstitution");
                String participantShirtSize = rs.getString("participantShirtSize");
                //fetch this from activity table
                int activityID = rs.getInt("activityID");
                Activity activity = new Activity(activityID);
                Participant = new Participant(participantID, participantName, participantPhoneNo,
                        participantAddress, participantInstitution, participantShirtSize, activity);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return Participant;
    }

    //method to select all participant by ActivityID
    public List<Participant> selectAllParticipantByActivityID() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Participant> participant = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connection object
                 PreparedStatement preparedStatement
                = connection.prepareStatement(SELECT_ALL_PARTICIPANT_BY_ACTIVITY_ID);) {
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            //Step 4: Process the ResultSet object.
            while (rs.next()) {
                int participantID = rs.getInt("participantID");
                String participantName = rs.getString("participantName");
                String participantPhoneNo = rs.getString("participantPhoneNo");
                String participantAddress = rs.getString("participantAddress");
                String participantInstitution = rs.getString("participantInstitution");
                String participantShirtSize = rs.getString("participantShirtSize");
                int activityID = rs.getInt("activityID");

                participant.add(new Participant(participantID, participantName,
                        participantPhoneNo, participantAddress, participantInstitution,
                        participantShirtSize, activityID));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return participant;
    }

    public List<Participant> selectAllParticipant() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Participant> participant = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connection object
                 PreparedStatement preparedStatement
                = connection.prepareStatement(SELECT_ALL_PARTICIPANT);) {
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            //Step 4: Process the ResultSet object.
            while (rs.next()) {
                int participantID = rs.getInt("participantID");
                String participantName = rs.getString("participantName");
                String participantPhoneNo = rs.getString("participantPhoneNo");
                String participantAddress = rs.getString("participantAddress");
                String participantInstitution = rs.getString("participantInstitution");
                String participantShirtSize = rs.getString("participantShirtSize");
                int activityID = rs.getInt("activityID");
                // Retrieve the activity object from ActivityDAO
                Activity activity = activityDAO.selectActivity(activityID);

                participant.add(new Participant(participantID, participantName,
                        participantPhoneNo, participantAddress, participantInstitution,
                        participantShirtSize, activity));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return participant;
    }

    public boolean deleteParticipant(int participantID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(DELETE_PARTICIPANT_SQL);) {
            statement.setInt(1, participantID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateParticipant(Participant participant) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(UPDATE_PARTICIPANT_SQL);) {
            statement.setString(1, participant.getParticipantName());
            statement.setString(2, participant.getParticipantPhoneNo());
            statement.setString(3, participant.getParticipantAddress());
            statement.setString(4, participant.getParticipantInstitution());
            statement.setString(5, participant.getParticipantShirtSize());
            //first call getter from Participant.java then getter from Activity.java
            statement.setInt(6, participant.getActivity().getActivityID());
            statement.setInt(7, participant.getParticipantID());

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

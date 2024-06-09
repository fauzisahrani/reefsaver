package com.DAO;

/**
 *
 * @author Pojie
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.Participant;

public class ParticipantDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/reefsaver"; //change 'reefsaver into database name'
    private String jdbcUsername = "root"; //username
    private String jdbcPassword = "admin"; //password

    //Declare all sql statement up here CRUD
    private static final String INSERT_PARTICIPANT_SQL = "INSERT INTO participant "
            + "(participantID, participantName, participantPhoneNo, participantAddress, "
            + "participantInstitution, participantShirtSize) values (?,?,?,?,?,?)";
    private static final String SELECT_PARTICIPANT_BY_ID = "select * from participant "
            + "where participantID = ?";
    private static final String SELECT_ALL_PARTICIPANT = "select * from participant";
    private static final String DELETE_PARTICIPANT_SQL = "delete from participant "
            + "where participantID = ?;";
    private static final String UPDATE_PARTICIPANT_SQL = "update participant set "
            + "participantName = ?, participantPhoneNo = ?, participantAddress = ?, "
            + "participantInstitution = ?, participantShirtSize = ? where participantID = ?;";

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
    public void insertParticipant(Participant Participant) throws SQLException {
        System.out.println(INSERT_PARTICIPANT_SQL);
        //try-with-resource statement will auto close the connection
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PARTICIPANT_SQL)) {
            preparedStatement.setInt(1, Participant.getParticipantID());
            preparedStatement.setString(2, Participant.getParticipantName());
            preparedStatement.setString(3, Participant.getParticipantPhoneNo());
            preparedStatement.setString(4, Participant.getParticipantAddress());
            preparedStatement.setString(5, Participant.getParticipantInstitution());
            preparedStatement.setString(6, Participant.getParticipantShirtSize());
            System.out.println(preparedStatement); //print prepared statement
            preparedStatement.executeUpdate(); //execute statement
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    //method to select user by ID
    public Participant selectParticipant(int participantID) {
        Participant Participant = null;
        //Step1: Establishing a Connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connection object
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PARTICIPANT_BY_ID);) {
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

                Participant = new Participant(participantID, participantName, participantPhoneNo,
                        participantAddress, participantInstitution, participantShirtSize);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return Participant;
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

                participant.add(new Participant(participantID, participantName,
                        participantPhoneNo, participantAddress, participantInstitution,
                        participantShirtSize));
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
            statement.setInt(6, participant.getParticipantID());

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

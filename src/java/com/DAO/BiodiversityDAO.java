
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

//Import Biodiversity Class
import com.Model.Biodiversity;
import java.sql.Date;

public class BiodiversityDAO {

    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/reefsaver"; //change 'reefsaver into database name'
    private String jdbcUsername = "root"; //username
    private String jdbcPassword = "admin"; //password

    //Declare all sql statement up here CRUD
    private static final String INSERT_BIODIVERSITY_SQL = "insert into biodiversity "
            + "(coralScientificName, coralCategory, coralSpecies, coralStation, "
            + "coralObservationDate, coralLatitude, coralLongitude, coralLocality, "
            + "coralDepth, coralRepository, coralCondition, coralDataProvider) values "
            + "(?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_BIODIVERSITY_BY_ID = "select * from biodiversity "
            + "where coralSampleID = ?";
    private static final String SELECT_ALL_BIODIVERSITY = "select * from biodiversity";
    private static final String DELETE_BIODIVERSITY_SQL = "delete from biodiversity "
            + "where coralSampleID = ?";
    private static final String UPDATE_BIODIVERSITY_SQL = "update biodiversity set "
            + "coralScientificName = ?, coralCategory = ?, coralSpecies = ?, "
            + "coralStation = ?, coralObservationDate = ?, coralLatitude = ?, "
            + "coralLongitude = ?, coralLocality = ?, coralDepth = ?, "
            + "coralRepository = ?, coralCondition = ?, coralDataProvider = ? "
            + "where coralSampleID = ?";

    //BiodiversityDAO constructor
    public BiodiversityDAO() {
    }

    //separate method to get connection to database reefsaver
    protected Connection getConnection() {
        connection = null;
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

    //method to create new biodiversity
    public void insertBiodiversity(Biodiversity Biodiversity) throws SQLException {
        System.out.println(INSERT_BIODIVERSITY_SQL);
        //try-with-resource statement will auto close the connection
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BIODIVERSITY_SQL)) {
            preparedStatement.setString(1, Biodiversity.getCoralScientificName());
            preparedStatement.setString(2, Biodiversity.getCoralCategory());
            preparedStatement.setString(3, Biodiversity.getCoralSpecies());
            preparedStatement.setString(4, Biodiversity.getCoralStation());
            preparedStatement.setDate(5, Biodiversity.getCoralObservationDate());
            preparedStatement.setDouble(6, Biodiversity.getCoralLatitude());
            preparedStatement.setDouble(7, Biodiversity.getCoralLongitude());
            preparedStatement.setString(8, Biodiversity.getCoralLocality());
            preparedStatement.setDouble(9, Biodiversity.getCoralDepth());
            preparedStatement.setString(10, Biodiversity.getCoralRepository());
            preparedStatement.setString(11, Biodiversity.getCoralCondition());
            preparedStatement.setString(12, Biodiversity.getCoralDataProvider());
            System.out.println(preparedStatement); //print prepared statement
            preparedStatement.executeUpdate(); //execute statement
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    //method to select biodiversity by ID
    public Biodiversity selectBiodiversity(int coralSampleID) {
        Biodiversity Biodiversity = null;
        //Step1: Establishing a Connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connection object
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BIODIVERSITY_BY_ID);) {
            preparedStatement.setInt(1, coralSampleID);
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            //Step 4: Process the ResultSet object
            while (rs.next()) {
                String coralScientificName = rs.getString("coralScientificName");
                String coralCategory = rs.getString("coralCategory");
                String coralSpecies = rs.getString("coralSpecies");
                String coralStation = rs.getString("coralStation");
                Date coralObservationDate = rs.getDate("coralObservationDate");
                double coralLatitude = rs.getDouble("coralLatitude");
                double coralLongitude = rs.getDouble("coralLongitude");
                String coralLocality = rs.getString("coralLocality");
                double coralDepth = rs.getDouble("coralDepth");
                String coralRepository = rs.getString("coralRepository");
                String coralCondition = rs.getString("coralCondition");
                String coralDataProvider = rs.getString("coralDataProvider");
                Biodiversity = new Biodiversity(coralSampleID, coralScientificName,
                        coralSpecies, coralCategory, coralStation, coralObservationDate,
                        coralLatitude, coralLongitude, coralLocality, coralDepth,
                        coralRepository, coralCondition, coralDataProvider);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return Biodiversity;
    }

    //method to select all biodiversity
    public List<Biodiversity> selectAllBiodiversity() {
        //using try-with-resource to avoid closing resources (boiler plate code)
        List<Biodiversity> Biodiversity = new ArrayList<>();
        //Step 1: Establishing a Connection
        try (Connection connection = getConnection(); //Step 2: Create a statement using connection object
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BIODIVERSITY);) {
            System.out.println(preparedStatement);
            //Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            //Step 4: Process the ResultSet object
            while (rs.next()) {
                int coralSampleID = rs.getInt("coralSampleID");
                String coralScientificName = rs.getString("coralScientificName");
                String coralSpecies = rs.getString("coralSpecies");
                String coralCategory = rs.getString("coralCategory");
                String coralStation = rs.getString("coralStation");
                Date coralObservationDate = rs.getDate("coralObservationDate");
                double coralLatitude = rs.getDouble("coralLatitude");
                double coralLongitude = rs.getDouble("coralLongitude");
                String coralLocality = rs.getString("coralLocality");
                double coralDepth = rs.getDouble("coralDepth");
                String coralRepository = rs.getString("coralRepository");
                String coralCondition = rs.getString("coralCondition");
                String coralDataProvider = rs.getString("coralDataProvider");
                Biodiversity.add(new Biodiversity(coralSampleID, coralScientificName,
                        coralSpecies, coralCategory, coralStation, coralObservationDate,
                        coralLatitude, coralLongitude, coralLocality, coralDepth,
                        coralRepository, coralCondition, coralDataProvider));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return Biodiversity;
    }

    //method to delete biodiversity
    public boolean deleteBiodiversity(int coralSampleID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement
                = connection.prepareStatement(DELETE_BIODIVERSITY_SQL);) {
            statement.setInt(1, coralSampleID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    //method to update biodiversity
    public boolean updateBiodiversity(Biodiversity Biodiversity) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_BIODIVERSITY_SQL);) {
            statement.setString(1, Biodiversity.getCoralScientificName());
            statement.setString(2, Biodiversity.getCoralCategory());
            statement.setString(3, Biodiversity.getCoralSpecies());
            statement.setString(4, Biodiversity.getCoralStation());
            statement.setDate(5, Biodiversity.getCoralObservationDate());
            statement.setDouble(6, Biodiversity.getCoralLatitude());
            statement.setDouble(7, Biodiversity.getCoralLongitude());
            statement.setString(8, Biodiversity.getCoralLocality());
            statement.setDouble(9, Biodiversity.getCoralDepth());
            statement.setString(10, Biodiversity.getCoralRepository());
            statement.setString(11, Biodiversity.getCoralCondition());
            statement.setString(12, Biodiversity.getCoralDataProvider());
            statement.setInt(13, Biodiversity.getCoralSampleID());

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

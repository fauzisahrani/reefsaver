package com.Model;

//used to insert and update image to database
import java.io.InputStream;

/**
 *
 * @author Pojie
 * @javabeans
 */
public class User {

    //Declare variables
    //protected variables can only be access within the same package and by subclass in other package
    protected int userID;
    protected String userName;
    protected String userEmail;
    protected String userPassword;
    protected String userType;
    protected String userImageBase64;
    protected InputStream userImageInputStream;

    //constructor without userID for new user
    //userImage not included because user can only upload image when updating profile
    public User(String userName, String userEmail, String userPassword,
            String userType) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userType = userType;
    }

    //constructor with id for update and delete
    public User(int userID, String userName, String userEmail,
            String userPassword, String userType, InputStream userImageInputStream) {
        this.userID = userID;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userType = userType;
        this.userImageInputStream = userImageInputStream;
    }

    //constructor with ID and Base64 for select all and select by ID from database
    public User(int userID, String userName, String userEmail,
            String userPassword, String userType, String userImageBase64) {
        this.userID = userID;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userType = userType;
        this.userImageBase64 = userImageBase64;
    }

    //constructor with Email and password to verify user
    public User(String userEmail, String userPassword) {
        this.userEmail = userEmail;
        this.userPassword = userPassword;
    }

    //setter and getter
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getUserImageBase64() {
        return userImageBase64;
    }

    public void setUserImageBase64(String userImageBase64) {
        this.userImageBase64 = userImageBase64;
    }

    public InputStream getUserImageInputStream() {
        return userImageInputStream;
    }

    public void setUserImageInputStream(InputStream userImageInputStream) {
        this.userImageInputStream = userImageInputStream;
    }

}

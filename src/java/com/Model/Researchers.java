/**
 *
 * @author Pojie act as a JavaBeans to represent business object
 */
package com.Model;

public class Researchers {

    protected int userID;
    protected String userName;
    protected String userEmail;
    protected String userField;
    protected String userInstitution;
    protected String userImageBase64;

    public Researchers() {
    }

    public Researchers(int userID, String userName, String userEmail,
            String userField, String userInstitution, String userImageBase64) {
        this.userID = userID;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userField = userField;
        this.userInstitution = userInstitution;
        this.userImageBase64 = userImageBase64;
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

    public String getUserField() {
        return userField;
    }

    public void setUserField(String userField) {
        this.userField = userField;
    }

    public String getUserInstitution() {
        return userInstitution;
    }

    public void setUserInstitution(String userInstitution) {
        this.userInstitution = userInstitution;
    }

    public String getUserImageBase64() {
        return userImageBase64;
    }

    public void setUserImageBase64(String userImageBase64) {
        this.userImageBase64 = userImageBase64;
    }

}

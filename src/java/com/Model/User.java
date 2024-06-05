/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
//instance vairables
package com.Model;

import java.io.InputStream;

/**
 *
 * @author Pojie act as a JavaBeans to represent business object
 */
public class User {

    protected int userID;
    protected String userName;
    protected String userEmail;
    protected String userPassword;
    protected String userType;

    public User() {
    }

    //constructor without userID for retrieve by userID, update and delete
    public User(String userName, String userEmail, String userPassword, String userType) {
        super();
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userType = userType;
    }

    //constructor with id for new employees
    public User(int userID, String userName, String userEmail, String userPassword, String userType) {
        super();
        this.userID = userID;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userType = userType;
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

}

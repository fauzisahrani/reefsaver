/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author Pojie Act as JavaBeans to represent business object
 */
//activityID	
//activityName	
//activityDate
//activityVenue
//activityOrganizer
//activityParticipantNo
//activityRegisterDue	
//activityDesc	
//activityImage
public class Activity {

    protected int activityID;
    protected String activityName;
    protected String activityDate;
    protected String activityVenue;
    protected String activityOrganizer;
    protected String activityParticipantNo;
    protected String activityRegisterDue;
    protected String activityDesc;
    protected String activityImage;

    public Activity() {
    }

    public Activity(String activityName, String activityDate,
            String activityVenue, String activityOrganizer,
            String activityParticipantNo, String activityRegisterDue,
            String activityDesc, String activityImage) {
        super();
        this.activityName = activityName;
        this.activityDate = activityDate;
        this.activityVenue = activityVenue;
        this.activityOrganizer = activityOrganizer;
        this.activityParticipantNo = activityParticipantNo;
        this.activityRegisterDue = activityRegisterDue;
        this.activityDesc = activityDesc;
        this.activityImage = activityImage;
    }

    public Activity(int activityID, String activityName, String activityDate,
            String activityVenue, String activityOrganizer,
            String activityParticipantNo, String activityRegisterDue,
            String activityDesc, String activityImage) {
        super();
        this.activityID = activityID;
        this.activityName = activityName;
        this.activityDate = activityDate;
        this.activityVenue = activityVenue;
        this.activityOrganizer = activityOrganizer;
        this.activityParticipantNo = activityParticipantNo;
        this.activityRegisterDue = activityRegisterDue;
        this.activityDesc = activityDesc;
        this.activityImage = activityImage;
    }

    //constructor with activityID only
    public Activity(int activityID) {
        this.activityID = activityID;
    }

    public int getActivityID() {
        return activityID;
    }

    public void setActivityID(int activityID) {
        this.activityID = activityID;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    public String getActivityDate() {
        return activityDate;
    }

    public void setActivityDate(String activityDate) {
        this.activityDate = activityDate;
    }

    public String getActivityVenue() {
        return activityVenue;
    }

    public void setActivityVenue(String activityVenue) {
        this.activityVenue = activityVenue;
    }

    public String getActivityOrganizer() {
        return activityOrganizer;
    }

    public void setActivityOrganizer(String activityOrganizer) {
        this.activityOrganizer = activityOrganizer;
    }

    public String getActivityParticipantNo() {
        return activityParticipantNo;
    }

    public void setActivityParticipantNo(String activityParticipantNo) {
        this.activityParticipantNo = activityParticipantNo;
    }

    public String getActivityRegisterDue() {
        return activityRegisterDue;
    }

    public void setActivityRegisterDue(String activityRegisterDue) {
        this.activityRegisterDue = activityRegisterDue;
    }

    public String getActivityDesc() {
        return activityDesc;
    }

    public void setActivityDesc(String activityDesc) {
        this.activityDesc = activityDesc;
    }

    public String getActivityImage() {
        return activityImage;
    }

    public void setActivityImage(String activityImage) {
        this.activityImage = activityImage;
    }

}

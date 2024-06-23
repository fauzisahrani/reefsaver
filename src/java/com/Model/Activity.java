package com.Model;

/**
 *
 * @author Pojie
 * @javabeans
 */
//used to insert and update image to database
import java.io.InputStream;

public class Activity {

    //Declare variables
    //protected variables can only be access within the same package and by subclass in other package
    protected int activityID;
    protected String activityName;
    protected String activityDate;
    protected String activityVenue;
    protected String activityOrganizer;
    protected String activityParticipantNo;
    protected String activityRegisterDue;
    protected String activityDesc;
    protected String activityImageBase64;
    protected InputStream activityImageInputStream;

    //constructor without ID and have Inputtream for insert image from JSP
    public Activity(String activityName, String activityDate,
            String activityVenue, String activityOrganizer,
            String activityParticipantNo, String activityRegisterDue,
            String activityDesc, InputStream activityImageInputStream) {
        this.activityName = activityName;
        this.activityDate = activityDate;
        this.activityVenue = activityVenue;
        this.activityOrganizer = activityOrganizer;
        this.activityParticipantNo = activityParticipantNo;
        this.activityRegisterDue = activityRegisterDue;
        this.activityDesc = activityDesc;
        this.activityImageInputStream = activityImageInputStream;
    }

    //constructor with ID and InputStream for update and delete image from JSP
    public Activity(int activityID, String activityName, String activityDate,
            String activityVenue, String activityOrganizer,
            String activityParticipantNo, String activityRegisterDue,
            String activityDesc, InputStream activityImageInputStream) {
        this.activityID = activityID;
        this.activityName = activityName;
        this.activityDate = activityDate;
        this.activityVenue = activityVenue;
        this.activityOrganizer = activityOrganizer;
        this.activityParticipantNo = activityParticipantNo;
        this.activityRegisterDue = activityRegisterDue;
        this.activityDesc = activityDesc;
        this.activityImageInputStream = activityImageInputStream;
    }

    //constructor with ID and Base64 for select all image and select image by ID image from database
    public Activity(int activityID, String activityName, String activityDate,
            String activityVenue, String activityOrganizer,
            String activityParticipantNo, String activityRegisterDue,
            String activityDesc, String activityImageBase64) {
        this.activityID = activityID;
        this.activityName = activityName;
        this.activityDate = activityDate;
        this.activityVenue = activityVenue;
        this.activityOrganizer = activityOrganizer;
        this.activityParticipantNo = activityParticipantNo;
        this.activityRegisterDue = activityRegisterDue;
        this.activityDesc = activityDesc;
        this.activityImageBase64 = activityImageBase64;
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

    public String getActivityImageBase64() {
        return activityImageBase64;
    }

    public void setActivityImageBase64(String activityImageBase64) {
        this.activityImageBase64 = activityImageBase64;
    }

    public InputStream getActivityImageInputStream() {
        return activityImageInputStream;
    }

    public void setActivityImageInputStream(InputStream activityImageInputStream) {
        this.activityImageInputStream = activityImageInputStream;
    }

}

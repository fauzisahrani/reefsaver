package com.Model;

/**
 *
 * @author Pojie
 */
import com.Model.Activity;

public class Participant {

    protected int participantID;
    protected String participantName;
    protected String participantPhoneNo;
    protected String participantAddress;
    protected String participantInstitution;
    protected String participantShirtSize;
    protected Activity activity;
    protected int activityID;

    //constructor with ID and referenced table variable
    public Participant(int participantID, String participantName,
            String participantPhoneNo, String participantAddress,
            String participantInstitution, String participantShirtSize,
            Activity activity) {
        this.participantID = participantID;
        this.participantName = participantName;
        this.participantPhoneNo = participantPhoneNo;
        this.participantAddress = participantAddress;
        this.participantInstitution = participantInstitution;
        this.participantShirtSize = participantShirtSize;
        this.activity = activity;
    }

    //constructor without id and referenced table variables for insert participant
    public Participant(String participantName, String participantPhoneNo,
            String participantAddress, String participantInstitution,
            String participantShirtSize, Activity activity) {
        this.participantName = participantName;
        this.participantPhoneNo = participantPhoneNo;
        this.participantAddress = participantAddress;
        this.participantInstitution = participantInstitution;
        this.participantShirtSize = participantShirtSize;
        this.activity = activity;
    }

    //constructor with id and referenced table ID
    public Participant(int participantID, String participantName,
            String participantPhoneNo, String participantAddress,
            String participantInstitution, String participantShirtSize,
            int activityID) {
        this.participantName = participantName;
        this.participantPhoneNo = participantPhoneNo;
        this.participantAddress = participantAddress;
        this.participantInstitution = participantInstitution;
        this.participantShirtSize = participantShirtSize;
        this.activityID = activityID;
    }

    public int getParticipantID() {
        return participantID;
    }

    public void setParticipantID(int participantID) {
        this.participantID = participantID;
    }

    public String getParticipantName() {
        return participantName;
    }

    public void setParticipantName(String participantName) {
        this.participantName = participantName;
    }

    public String getParticipantPhoneNo() {
        return participantPhoneNo;
    }

    public void setParticipantPhoneNo(String participantPhoneNo) {
        this.participantPhoneNo = participantPhoneNo;
    }

    public String getParticipantAddress() {
        return participantAddress;
    }

    public void setParticipantAddress(String participantAddress) {
        this.participantAddress = participantAddress;
    }

    public String getParticipantInstitution() {
        return participantInstitution;
    }

    public void setParticipantInstitution(String participantInstitution) {
        this.participantInstitution = participantInstitution;
    }

    public String getParticipantShirtSize() {
        return participantShirtSize;
    }

    public void setParticipantShirtSize(String participantShirtSize) {
        this.participantShirtSize = participantShirtSize;
    }

    public Activity getActivity() {
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    public int getActivityID() {
        return activityID;
    }

    public void setActivityID(int activityID) {
        this.activityID = activityID;
    }

}

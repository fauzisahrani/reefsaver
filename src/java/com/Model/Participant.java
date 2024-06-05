package com.Model;

/**
 *
 * @author Pojie
 */
public class Participant {

    protected int participantID;
    protected String participantName;
    protected String participantPhoneNo;
    protected String participantAddress;
    protected String participantInstitution;
    protected String participantShirtSize;

    public Participant() {
    }

    //constructor without id for insert participant
    public Participant(String participantName,
            String participantPhoneNo, String participantAddress,
            String participantInstitution, String participantShirtSize) {
        this.participantName = participantName;
        this.participantPhoneNo = participantPhoneNo;
        this.participantAddress = participantAddress;
        this.participantInstitution = participantInstitution;
        this.participantShirtSize = participantShirtSize;
    }

    //constructor with id
    public Participant(int participantID, String participantName,
            String participantPhoneNo, String participantAddress,
            String participantInstitution, String participantShirtSize) {
        this.participantID = participantID;
        this.participantName = participantName;
        this.participantPhoneNo = participantPhoneNo;
        this.participantAddress = participantAddress;
        this.participantInstitution = participantInstitution;
        this.participantShirtSize = participantShirtSize;
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
    
    
}


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

import java.sql.Date;

/**
 *
 * @author Pojie act as Javabeans to represent business object
 */
public class Biodiversity {

    protected int coralSampleID;
    protected String coralScientificName;
    protected String coralCategory;
    protected String coralStation;
    protected Date coralObservationDate;
    protected double coralLatitude;
    protected double coralLongitude;
    protected String coralLocality;
    protected double coralDepth;
    protected String coralRepository;
    protected String coralSamplingEquipment;
    protected String coralDataProvider;

    public Biodiversity() {
    }

    //constructor without coralID for retrieve by coralUD, update and delete
    public Biodiversity(String coralScientificName, String coralCategory,
            String coralStation, Date coralObservationDate, double coralLatitude,
            double coralLongitude, String coralLocality, double coralDepth,
            String coralRepository, String coralSamplingEquipment,
            String coralDataProvider) {
        this.coralScientificName = coralScientificName;
        this.coralCategory = coralCategory;
        this.coralStation = coralStation;
        this.coralObservationDate = coralObservationDate;
        this.coralLatitude = coralLatitude;
        this.coralLongitude = coralLongitude;
        this.coralLocality = coralLocality;
        this.coralDepth = coralDepth;
        this.coralRepository = coralRepository;
        this.coralSamplingEquipment = coralSamplingEquipment;
        this.coralDataProvider = coralDataProvider;
    }

    //constructor with id for new biodiversity
    public Biodiversity(int coralSampleID, String coralScientificName, String coralCategory,
            String coralStation, Date coralObservationDate, double coralLatitude,
            double coralLongitude, String coralLocality, double coralDepth,
            String coralRepository, String coralSamplingEquipment,
            String coralDataProvider) {
        this.coralSampleID = coralSampleID;
        this.coralScientificName = coralScientificName;
        this.coralCategory = coralCategory;
        this.coralStation = coralStation;
        this.coralObservationDate = coralObservationDate;
        this.coralLatitude = coralLatitude;
        this.coralLongitude = coralLongitude;
        this.coralLocality = coralLocality;
        this.coralDepth = coralDepth;
        this.coralRepository = coralRepository;
        this.coralSamplingEquipment = coralSamplingEquipment;
        this.coralDataProvider = coralDataProvider;
    }

    public int getCoralSampleID() {
        return coralSampleID;
    }

    public void setCoralSampleID(int coralSampleID) {
        this.coralSampleID = coralSampleID;
    }

    public String getCoralScientificName() {
        return coralScientificName;
    }

    public void setCoralScientificName(String coralScientificName) {
        this.coralScientificName = coralScientificName;
    }

    public String getCoralCategory() {
        return coralCategory;
    }

    public void setCoralCategory(String coralCategory) {
        this.coralCategory = coralCategory;
    }

    public String getCoralStation() {
        return coralStation;
    }

    public void setCoralStation(String coralStation) {
        this.coralStation = coralStation;
    }

    public Date getCoralObservationDate() {
        return coralObservationDate;
    }

    public void setCoralObservationDate(Date coralObservationDate) {
        this.coralObservationDate = coralObservationDate;
    }

    public double getCoralLatitude() {
        return coralLatitude;
    }

    public void setCoralLatitude(double coralLatitude) {
        this.coralLatitude = coralLatitude;
    }

    public double getCoralLongitude() {
        return coralLongitude;
    }

    public void setCoralLongitude(double coralLongitude) {
        this.coralLongitude = coralLongitude;
    }

    public String getCoralLocality() {
        return coralLocality;
    }

    public void setCoralLocality(String coralLocality) {
        this.coralLocality = coralLocality;
    }

    public double getCoralDepth() {
        return coralDepth;
    }

    public void setCoralDepth(double coralDepth) {
        this.coralDepth = coralDepth;
    }

    public String getCoralRepository() {
        return coralRepository;
    }

    public void setCoralRepository(String coralRepository) {
        this.coralRepository = coralRepository;
    }

    public String getCoralSamplingEquipment() {
        return coralSamplingEquipment;
    }

    public void setCoralSamplingEquipment(String coralSamplingEquipment) {
        this.coralSamplingEquipment = coralSamplingEquipment;
    }

    public String getCoralDataProvider() {
        return coralDataProvider;
    }

    public void setCoralDataProvider(String coralDataProvider) {
        this.coralDataProvider = coralDataProvider;
    }
}

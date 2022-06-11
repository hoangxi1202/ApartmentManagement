/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Trieu Do
 */
public class ApartmentError {

    private String apartmentIdError;
    private String sizeError;
    private String imageError;
    private String buildingNameError;
    private String rentPriceError;
    private String salePriceError;
    private String statusError;

    public ApartmentError() {
        this.apartmentIdError = "";
        this.sizeError = "";
        this.imageError = "";
        this.buildingNameError = "";
        this.rentPriceError = "";
        this.salePriceError = "";
        this.statusError = "";
    }

    public ApartmentError(String apartmentIdError, String sizeError, String imageError, String buildingNameError, String rentPriceError, String salePriceError, String statusError) {
        this.apartmentIdError = apartmentIdError;
        this.sizeError = sizeError;
        this.imageError = imageError;
        this.buildingNameError = buildingNameError;
        this.rentPriceError = rentPriceError;
        this.salePriceError = salePriceError;
        this.statusError = statusError;
    }

    public String getApartmentIdError() {
        return apartmentIdError;
    }

    public void setApartmentIdError(String apartmentIdError) {
        this.apartmentIdError = apartmentIdError;
    }

    public String getSizeError() {
        return sizeError;
    }

    public void setSizeError(String sizeError) {
        this.sizeError = sizeError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getBuildingNameError() {
        return buildingNameError;
    }

    public void setBuildingNameError(String buildingNameError) {
        this.buildingNameError = buildingNameError;
    }

    public String getRentPriceError() {
        return rentPriceError;
    }

    public void setRentPriceError(String rentPriceError) {
        this.rentPriceError = rentPriceError;
    }

    public String getSalePriceError() {
        return salePriceError;
    }

    public void setSalePriceError(String salePriceError) {
        this.salePriceError = salePriceError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }
    

}

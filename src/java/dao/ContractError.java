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
public class ContractError {

    private String contractIdError;
    private String apartmentIdError;
    private String fullNameError;
    private String serviceNameError;
    private String startDateError;
    private String endDateError;
    private String statusError;

    public ContractError() {
        this.contractIdError = "";
        this.apartmentIdError = "";
        this.fullNameError = "";
        this.serviceNameError = "";
        this.startDateError = "";
        this.endDateError = "";
        this.statusError = "";
    }

    public ContractError(String contractIdError, String apartmentIdError, String fullNameError, String serviceNameError, String startDateError, String endDateError, String statusError) {
        this.contractIdError = contractIdError;
        this.apartmentIdError = apartmentIdError;
        this.fullNameError = fullNameError;
        this.serviceNameError = serviceNameError;
        this.startDateError = startDateError;
        this.endDateError = endDateError;
        this.statusError = statusError;
    }

    public String getContractIdError() {
        return contractIdError;
    }

    public void setContractIdError(String contractIdError) {
        this.contractIdError = contractIdError;
    }

    public String getStartDateError() {
        return startDateError;
    }

    public void setStartDateError(String startDateError) {
        this.startDateError = startDateError;
    }

    public String getEndDateError() {
        return endDateError;
    }

    public void setEndDateError(String endDateError) {
        this.endDateError = endDateError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getServiceNameError() {
        return serviceNameError;
    }

    public void setServiceNameError(String serviceNameError) {
        this.serviceNameError = serviceNameError;
    }

    public String getApartmentIdError() {
        return apartmentIdError;
    }

    public void setApartmentIdError(String apartmentIdError) {
        this.apartmentIdError = apartmentIdError;
    }

}

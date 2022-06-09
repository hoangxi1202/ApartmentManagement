/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.sql.Date;

/**
 *
 * @author Minh Hoàng
 */
public class Service {
    private String serviceId;
    private String serviceName;
    private Date createdDate;
    private int status;
    private String detailId;
    private float price;

    public Service() {
    }

    public Service(String serviceId, String serviceName, Date createdDate, int status, float price) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.createdDate = createdDate;
        this.status = status;
        this.price = price;
    }

    public Service(String serviceId, String serviceName, Date createdDate, int status, String detailId, float price) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.createdDate = createdDate;
        this.status = status;
        this.detailId = detailId;
        this.price = price;
    }
    

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDetailId() {
        return detailId;
    }

    public void setDetailId(String detailId) {
        this.detailId = detailId;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Service{" + "serviceId=" + serviceId + ", serviceName=" + serviceName + ", createdDate=" + createdDate + ", status=" + status + ", detailId=" + detailId + ", price=" + price + '}';
    }
    
   
    
}

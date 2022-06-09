/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

/**
 *
 * @author Minh Hoàng
 */
public class ServiceDetail {  							
    public String detailId;
    public String detailName;
    public int newIndex;
    public int oldIndex;
    public int totalUsage;
    public float price;
    public float total;
    public int status;

    public ServiceDetail() {
    }

    public ServiceDetail(String detailId, String detailName, int newIndex, int oldIndex, float price, int status) {
        this.detailId = detailId;
        this.detailName = detailName;
        this.newIndex = newIndex;
        this.oldIndex = oldIndex;
        this.totalUsage = newIndex - oldIndex;
        this.price = price;
        this.total = this.totalUsage * price ;
        this.status = status;
    }

    public String getDetailId() {
        return detailId;
    }

    public void setDetailId(String detailId) {
        this.detailId = detailId;
    }

    public String getDetailName() {
        return detailName;
    }

    public void setDetailName(String detailName) {
        this.detailName = detailName;
    }

    public int getNewIndex() {
        return newIndex;
    }

    public void setNewIndex(int newIndex) {
        this.newIndex = newIndex;
    }

    public int getOldIndex() {
        return oldIndex;
    }

    public void setOldIndex(int oldIndex) {
        this.oldIndex = oldIndex;
    }

    public int getTotalUsage() {
        return totalUsage;
    }

    public void setTotalUsage(int totalUsage) {
        this.totalUsage = totalUsage;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ServiceDetail{" + "detailId=" + detailId + ", detailName=" + detailName + ", newIndex=" + newIndex + ", oldIndex=" + oldIndex + ", totalUsage=" + totalUsage + ", price=" + price + ", total=" + total + ", status=" + status + '}';
    }
    
}

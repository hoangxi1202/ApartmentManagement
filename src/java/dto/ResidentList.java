/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nhat Linh
 */
public class ResidentList {

    private List<ResidentDTO> listRes;

    public ResidentList() {
        this.listRes = new ArrayList<>();
    }

    public List<ResidentDTO> getListRes() {
        return listRes;
    }

    public void setListRes(List<ResidentDTO> listRes) {
        this.listRes = listRes;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ResidentDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import utils.Utils;

/**
 *
 * @author Nhat Linh
 */
public class ResidentDAO {

    public static final String SEARCH_BY_NAME = "SELECT residentId, ownerId, name, dob, gender, job, phone FROM "
            + "Residents WHERE name LIKE ? and status = 1";

    public List<ResidentDTO> getListResident(String search) throws SQLException {
        List<ResidentDTO> listResident = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_BY_NAME);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String residentId = rs.getString("residentId");
                    String ownerId = rs.getString("ownerId");
                    String name = rs.getString("name");
                    String dob = rs.getString("dob");
                    boolean gender = Utils.getBoolean(rs.getString("gender"));
                    String job = rs.getString("job");
                    String phone = rs.getString("phone");
                    listResident.add(new ResidentDTO(residentId, ownerId, name, dob, gender, job, phone, true));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listResident;
    }
}

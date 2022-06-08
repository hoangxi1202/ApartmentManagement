/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.TroubleDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Utils;

/**
 *
 * @author Nhat Linh
 */
public class TroubleDAO {

    private static final String VIEW_TROUBLE = "SELECT Apartments.apartmentId, Trouble.troubleId, Owners.name, Trouble.date, TroubleType.typeName, Trouble.detail, Trouble.solution, Trouble.status\n"
            + "FROM Apartments, Trouble, Owners, TroubleType, Contracts\n"
            + "WHERE Trouble.typeId = TroubleType.typeId\n"
            + "		AND Trouble.ownerId = Owners.ownerId\n"
            + "		AND Owners.ownerId = Contracts.ownerId\n"
            + "		AND Contracts.apartmentId = Apartments.apartmentId";
    private static final String UPDATE_TROUBLE = "UPDATE Trouble SET status = ? WHERE troubleId = ?";

    public List<TroubleDTO> getListTrouble() throws SQLException {
        List<TroubleDTO> listTrouble = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_TROUBLE);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String apartment = rs.getString("apartmentId");
                    String troubleId = rs.getString("troubleId");
                    String ownerName = rs.getString("name");
                    String date = rs.getString("date");
                    String typeName = rs.getString("typeName");
                    String detail = rs.getString("detail");
                    String solution = rs.getString("solution");
                    String check = rs.getString("status");
                    boolean status = false;
                    if (check.equals("1")) {
                        status = true;
                    }
                    listTrouble.add(new TroubleDTO(troubleId, apartment, ownerName, date, typeName, detail, solution, status));

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
        return listTrouble;
    }

    public boolean updateTrouble(String troubleId, String status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_TROUBLE);
                if ("true".equals(status)) {
                    ptm.setString(1, "1");
                } else {
                    ptm.setString(1, "0");
                }
                ptm.setString(2, troubleId);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean createTrouble(String accountId, String apartmentId, String type, String detail, String solution) {
        //not support yet
        boolean check =false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn!=null) {
                ptm = conn.prepareStatement("");
            }
        } catch (Exception e) {
        }
        return check;
    }
}

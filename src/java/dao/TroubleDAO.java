/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.TroubleDTO;
import dto.TroubleTypeDTO;
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

    private static final String VIEW_TROUBLE = "SELECT Apartments.apartmentId, Troubles.troubleId, Owners.name, Troubles.date, TroubleTypes.detail as type, Troubles.detail, Troubles.solution, Troubles.status\n"
            + "FROM Apartments, Troubles, Owners, TroubleTypes, Contracts\n"
            + "WHERE Troubles.typeId = TroubleTypes.typeId\n"
            + "		AND Troubles.ownerId = Owners.ownerId\n"
            + "		AND Owners.ownerId = Contracts.ownerId\n"
            + "		AND Contracts.apartmentId = Apartments.apartmentId";
    private static final String UPDATE_TROUBLE = "UPDATE Troubles SET status = ? WHERE troubleId = ?";
    private static final String VIEW_TYPE_TROUBLE = "SELECT typeId, detail FROM TroubleTypes";

    public List<TroubleDTO> getListTrouble() throws SQLException {
        //not fix yet
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
                    String typeName = rs.getString("type");
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
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("");
            }
        } catch (Exception e) {
        }
        return check;
    }

    public List<TroubleTypeDTO> getListTypeTrouble() throws SQLException {
        List<TroubleTypeDTO> listTrouble = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_TYPE_TROUBLE);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String typeId = rs.getString("typeId");
                    String detail = rs.getString("detail");
                    listTrouble.add(new TroubleTypeDTO(typeId, detail));

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
}

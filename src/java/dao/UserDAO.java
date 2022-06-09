/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UserDTO;
import utils.Utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Minh Hoàng
 */
public class UserDAO {

    private static final String GET_OWNER = "Select ownerId FROM Owners where userId = ?";

    public UserDTO checkLogin(String userID, String password) throws SQLException, ClassNotFoundException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                String sql = "SELECT roleId "
                        + " FROM Accounts "
                        + " WHERE userId =? AND password=? AND status = 1";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String roleID = rs.getString("roleId");
                    user = new UserDTO(userID, "", roleID, "");
                }
            }
        } catch (SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public String getOwnerId(String userID) throws SQLException, ClassNotFoundException {
        String ownId = "";
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(GET_OWNER);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    ownId = rs.getString("ownerId");
                }
            }
        } catch (SQLException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return ownId;
    }

    public boolean insertUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = Utils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Accounts(userID, fullName, roleID, password) "
                        + " VALUES(?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getFullName());
                stm.setString(3, user.getRoleID());
                stm.setString(4, user.getPassword());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return check;
    }
}

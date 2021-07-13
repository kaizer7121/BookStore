/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.user;

import assignment.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Kaizer
 */
public class UserDAO {

    public UserDTO checkLogin(String userName, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT userID, fullname, roleID, phoneNumber, address, email, statusID FROM tblUsers"
                    + " WHERE userID = ? AND password = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userName);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                String userID = rs.getString("userID");
                String fullName = rs.getString("fullName");
                String roleID = rs.getString("roleID");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                String email = rs.getString("email");
                String statusID = rs.getString("statusID");
                user = new UserDTO(userID, fullName, roleID, "****", address, phoneNumber, email, statusID);
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT userID, fullname, roleID, phoneNumber, address, email, statusID FROM tblUsers "
                    + " WHERE fullName like ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                String userID = rs.getString("userID");
                String fullName = rs.getString("fullName");
                String roleID = rs.getString("roleID");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                String email = rs.getString("email");
                String statusID = rs.getString("statusID");
                list.add(new UserDTO(userID, fullName, roleID, "****", address, phoneNumber, email, statusID));
            }
        } catch (Exception e) {
            e.printStackTrace();
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

        return list;
    }

    public boolean changeStatusUser(String userID, String action) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "UPDATE tblUsers"
                    + " SET statusID = ?"
                    + " WHERE userID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, action);
            stm.setString(2, userID);
            result = stm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public boolean updateUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "UPDATE tblUsers"
                    + " SET fullName = ?, roleID = ?, phoneNumber = ?, address = ?, email=?"
                    + " WHERE userID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, user.getFullName());
            stm.setString(2, user.getRoleID());
            stm.setString(3, user.getPhoneNumber());
            stm.setString(4, user.getAddress());
            stm.setString(5, user.getEmail());
            stm.setString(6, user.getUserID());
            check = stm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean createUser(String userID, String fullName, String roleID, String password) throws SQLException, ClassNotFoundException, NamingException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "INSERT INTO dbo.tblUsers "
                    + " ( userID, fullName, roleID, password, phoneNumber, address, statusID, email )"
                    + " VALUES"
                    + " (?, ?, ?, ?, '', '', 'Active', '')";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            stm.setString(2, fullName);
            stm.setString(3, roleID);
            stm.setString(4, password);
            result = stm.executeUpdate() > 0;
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

}

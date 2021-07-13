/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.shopping;

import assignment.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kaizer
 */
public class ShoppingDAO {

    public List<BookDTO> getProductsFromDB() throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT productID, productName, price, quantity, categoryID, statusID, imageSrc"
                    + " FROM tblProducts";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                double price = Double.parseDouble(rs.getString("price"));
                int quantity = Integer.parseInt(rs.getString("quantity"));
                String category = rs.getString("categoryID");
                String status = rs.getString("statusID");
                String imageSource = rs.getString("imageSrc");

                list.add(new BookDTO(productID, productName, price, quantity, category, status, imageSource));
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

    public List<BookDTO> searchProductsFromDB(String searchedProductName) throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT productID, productName, price, quantity, categoryID,statusID, imageSrc"
                    + " FROM tblProducts"
                    + " WHERE productName like ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + searchedProductName + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                double price = Double.parseDouble(rs.getString("price"));
                int quantity = Integer.parseInt(rs.getString("quantity"));
                String category = rs.getString("categoryID");
                String status = rs.getString("statusID");
                String imageSource = rs.getString("imageSrc");

                if (status.equals("Available")) {
                    list.add(new BookDTO(productID, productName, price, quantity, category, status, imageSource));
                }

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

    public List<BookDTO> getListBookByCategory(String categoryFilter) throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT productID, productName, price, quantity, categoryID,statusID, imageSrc"
                    + " FROM tblProducts"
                    + " WHERE categoryID like ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, "%" + categoryFilter + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                double price = Double.parseDouble(rs.getString("price"));
                int quantity = Integer.parseInt(rs.getString("quantity"));
                String category = rs.getString("categoryID");
                String status = rs.getString("statusID");
                String imageSource = rs.getString("imageSrc");

                if (status.equals("Available")) {
                    list.add(new BookDTO(productID, productName, price, quantity, category, status, imageSource));
                }
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

    public boolean checkProductHaveEnoughQuantity(String productID, int amount) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT productID, productName, quantity FROM tblProducts"
                    + " WHERE productID = ? AND quantity >= ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, productID);
            stm.setInt(2, amount);
            rs = stm.executeQuery();
            if (rs.next()) {
                check = true;
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
        return check;
    }

    public boolean createOrderDetailInDB(String orderID, String productID, int quantity, double totalPrice) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "INSERT INTO dbo.tblOrderDetails"
                    + " (orderID, productID, quantity, totalPrice)"
                    + " VALUES (?, ?, ?, ?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, orderID);
            stm.setString(2, productID);
            stm.setInt(3, quantity);
            stm.setDouble(4, totalPrice);

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

    public boolean setQuantityOfProduct(String bookID, int quantity) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "UPDATE dbo.tblProducts"
                    + " SET quantity = ?"
                    + " WHERE productID = ?";
            stm = conn.prepareStatement(sql);
            stm.setInt(1, quantity);
            stm.setString(2, bookID);
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
            return check;
        }
    }

    public boolean setStatusBookWhenOutOfShock(String bookID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "UPDATE dbo.tblProducts"
                    + " SET quantity = 0, statusID = 'OutOfShock'"
                    + " WHERE productID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, bookID);
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
            return check;
        }
    }

    public String createOrderFromCartToDB(String userID, double totalPrice, String statusID,
            String phone, String address, String paymentMethod, String email) throws SQLException {
        String orderID = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "INSERT INTO tblOrders"
                    + " (orderID, userID, date, totalPrice, statusID, phone, address, paymentMethod, email)"
                    + " OUTPUT Inserted.orderID"
                    + " VALUES (NEWID(), ?, GETDATE(), ?, ?, ?, ?, ?, ?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            stm.setDouble(2, totalPrice);
            stm.setString(3, statusID);
            stm.setString(4, phone);
            stm.setString(5, address);
            stm.setString(6, paymentMethod);
            stm.setString(7, email);

            rs = stm.executeQuery();
            if (rs.next()) {
                orderID = rs.getString("orderID");
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
        return orderID;
    }

    public List<OrdersDTO> getListOrdersOfUser(String userID) throws SQLException {
        List<OrdersDTO> listOrders = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT orderID, userID, date, totalPrice, statusID, phone, address, paymentMethod, email FROM tblOrders"
                    + " WHERE userID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String orderID = rs.getString("orderID");
                String userIDOfOrders = rs.getString("userID");
                String date = rs.getDate("date").toString();
                double totalPrice = rs.getDouble("totalPrice");
                String statusID = rs.getString("statusID");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String paymentMethod = rs.getString("paymentMethod");
                String email = rs.getString("email");
                OrdersDTO newOrders = new OrdersDTO(orderID, userIDOfOrders, date, totalPrice, statusID, phone, address, paymentMethod, email);
                listOrders.add(newOrders);
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
        return listOrders;
    }

    public List<OrderDetailDTO> getListOrdersDetail(String orderID) throws SQLException {
        List<OrderDetailDTO> listOrdersDetail = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT orderID, ordersDetail.productID, productName, ordersDetail.quantity, ordersDetail.totalPrice, productDetail.imageSrc"
                    + " FROM tblOrderDetails AS ordersDetail"
                    + " INNER JOIN tblProducts AS productDetail"
                    + " ON productDetail.productID = ordersDetail.productID"
                    + " WHERE ordersDetail.orderID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, orderID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String ordersID = rs.getString("orderID");
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                int quantity = rs.getInt("quantity");
                double totalPrice = rs.getDouble("totalPrice");
                String imageSource = rs.getString("imageSrc");
                listOrdersDetail.add(new OrderDetailDTO(orderID, productID, productName, quantity, totalPrice, imageSource));
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
        return listOrdersDetail;
    }

    public boolean changeStatusOrders(String orderID, String status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "UPDATE dbo.tblOrders"
                    + " SET statusID = ?"
                    + " WHERE orderID = ?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, status);
            stm.setString(2, orderID);
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

    public boolean turnBackBookQuantity(String bookID, int amount) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "UPDATE dbo.tblProducts"
                    + " SET quantity = quantity + ?, statusID = 'Available'"
                    + " WHERE productID = ?";
            stm = conn.prepareStatement(sql);
            stm.setInt(1, amount);
            stm.setString(2, bookID);
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
}

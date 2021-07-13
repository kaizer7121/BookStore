/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.shopping;

/**
 *
 * @author Kaizer
 */
public class OrdersDTO {
    private String orderID;
    private String userID;
    private String date;
    private double totalPrice;
    private String status;
    private String phone;
    private String address;
    private String paymentMethod;
    private String email;

    public OrdersDTO() {
    }

    public OrdersDTO(String orderID, String userID, String date, double total, String statusID, String phone, String address, String paymentMethod, String email) {
        this.orderID = orderID;
        this.userID = userID;
        this.date = date;
        this.totalPrice = total;
        this.status = statusID;
        this.phone = phone;
        this.address = address;
        this.paymentMethod = paymentMethod;
        this.email = email;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
}

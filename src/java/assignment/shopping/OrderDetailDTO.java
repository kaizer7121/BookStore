/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.shopping;

import java.io.Serializable;

/**
 *
 * @author Kaizer
 */
public class OrderDetailDTO implements Serializable{

    private String orderID;
    private String productID;
    private String productName;
    private int quantity;
    private double totalPrice;
    private String imageSource;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(String orderID, String productID, String productName, int quantity, double totalPrice, String imageSource) {
        this.orderID = orderID;
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.imageSource = imageSource;
    }

    

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImageSource() {
        return imageSource;
    }

    public void setImageSource(String imageSource) {
        this.imageSource = imageSource;
    }

    
    
}

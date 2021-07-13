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
public class BookDTO implements Serializable {

    private String productID;
    private String productName;
    private double price;
    private int quantity;
    private String category;
    private String status;
    private String imageSource;

    public BookDTO() {
    }

    public BookDTO(String productID, String productName, double price, int quantity, String category, String status, String imgaeSource) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
        this.status = status;
        this.imageSource = imgaeSource;
    }

    
    
    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImageSource() {
        return imageSource;
    }

    public void setImageSource(String imageSource) {
        this.imageSource = imageSource;
    }
    
    

    @Override
    public String toString() {
        return productID + "," + productName + "," + price + "," + quantity + "," + category + "," + status + "," + imageSource;
    }

}

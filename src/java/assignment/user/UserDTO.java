/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.user;

import java.io.Serializable;

/**
 *
 * @author Kaizer
 */
public class UserDTO implements Serializable{

    private String userID;
    private String fullName;
    private String roleID;
    private String password;
    private String address;
    private String phoneNumber;
    private String email;
    private String status;

    public UserDTO() {
    }

    public UserDTO(String userID, String fullName, String roleID, String password, String address, String phoneNumber, String email, String status) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.password = password;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.status = status;
    }

    

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.user;

/**
 *
 * @author Kaizer
 */
public class UserError {
    private String errorUserID;
    private String errorFullName;
    private String errorRoleID;
    private String errorPassword;
    private String errorConfirm;
    private String errorPhone;
    private String errorAddress;
    private String errorEmail;

    public UserError() {
    }

    public UserError(String errorUserID, String errorFullName, String errorRoleID, String errorPassword, String errorConfirm, String errorPhone, String errorAddress, String errorEmail) {
        this.errorUserID = errorUserID;
        this.errorFullName = errorFullName;
        this.errorRoleID = errorRoleID;
        this.errorPassword = errorPassword;
        this.errorConfirm = errorConfirm;
        this.errorPhone = errorPhone;
        this.errorAddress = errorAddress;
        this.errorEmail = errorEmail;
    }

    

    public String getErrorUserID() {
        return errorUserID;
    }

    public void setErrorUserID(String errorUserID) {
        this.errorUserID = errorUserID;
    }

    public String getErrorFullName() {
        return errorFullName;
    }

    public void setErrorFullName(String errorFullName) {
        this.errorFullName = errorFullName;
    }

    public String getErrorRoleID() {
        return errorRoleID;
    }

    public void setErrorRoleID(String errorRoleID) {
        this.errorRoleID = errorRoleID;
    }

    public String getErrorPassword() {
        return errorPassword;
    }

    public void setErrorPassword(String errorPassword) {
        this.errorPassword = errorPassword;
    }

    public String getErrorConfirm() {
        return errorConfirm;
    }

    public void setErrorConfirm(String errorConfirm) {
        this.errorConfirm = errorConfirm;
    }

    public String getErrorPhone() {
        return errorPhone;
    }

    public void setErrorPhone(String errorPhone) {
        this.errorPhone = errorPhone;
    }

    public String getErrorAddress() {
        return errorAddress;
    }

    public void setErrorAddress(String errorAddress) {
        this.errorAddress = errorAddress;
    }

    public String getErrorEmail() {
        return errorEmail;
    }

    public void setErrorEmail(String errorEmail) {
        this.errorEmail = errorEmail;
    }
    
    
}

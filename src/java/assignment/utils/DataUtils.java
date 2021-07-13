/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Kaizer
 */
public class DataUtils {

    public static boolean checkUserID(String userID) {
        boolean result = false;
        if (userID.length() >= 5 && userID.length() <= 15) {
            result = true;
        }
        return result;
    }

    public static boolean checkFullName(String fullName) {
        boolean result = false;
        if (fullName.length() >= 5 && fullName.length() <= 50) {
            result = true;
        }
        return result;
    }

    public static boolean checkRoleID(String roleID) {
        boolean result = false;
        if ("AD".equals(roleID) || "US".equals(roleID)) {
            result = true;
        }
        return result;
    }

    public static boolean checkPassword(String password) {
        boolean result = false;
        if (password.length() >= 6 && password.length() <= 15) {
            result = true;
        }
        return result;
    }

    public static boolean checkPhoneNumber(String phoneNumber) {
        boolean result = false;
        try {
            Integer.parseInt(phoneNumber);
            if (phoneNumber.length() == 10) {
                result = true;
            }
        } catch (Exception e) {
            
        }
        return result;
    }

    public static boolean checkAddress(String address) {
        boolean result = false;
        if (address.length() >= 5 && address.length() <= 50) {
            result = true;
        }
        return result;
    }

    public static boolean checkEmail(String email) {
        boolean result = false;
        String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        result = email.matches(regex);
        return result;
    }
    
}


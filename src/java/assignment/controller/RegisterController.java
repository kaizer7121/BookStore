/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.controller;

import assignment.user.UserDAO;
import assignment.user.UserError;
import assignment.utils.DataUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kaizer
 */
public class RegisterController extends HttpServlet {

    private final static String ERROR = "register.jsp";
    private final static String SUCCESS = "login.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError error = new UserError("", "", "", "", "", "", "", "");
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            boolean check = true;
            
            if (!DataUtils.checkUserID(userID)) {
                error.setErrorUserID("User ID must between [5, 15]");
                check = false;
            }
            if (!DataUtils.checkFullName(fullName)) {
                error.setErrorFullName("Full name must between [5, 25]");
                check = false;
            }
            if (!DataUtils.checkRoleID(roleID)) {
                error.setErrorRoleID("Role ID must be AD or US");
                check = false;
            }
            if (!DataUtils.checkPassword(password)) {
                error.setErrorPassword("User ID must between [6, 15]");
                check = false;
            }
            if (!confirmPassword.equals(password)) {
                error.setErrorConfirm("Pasword and Confirm Password must be same");
                check = false;
            }
            
            if (check) {
                UserDAO dao = new UserDAO();
                boolean checkRegister = dao.createUser(userID, fullName, roleID, password);
                if (checkRegister) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("USER_ERROR", error);
            }
        } catch (Exception e) {
            log("Error at RegisterController: " + e.toString());
            if (e.toString().contains("duplicate")) {
                error.setErrorUserID("Your user ID is existed !");
                request.setAttribute("USER_ERROR", error);
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

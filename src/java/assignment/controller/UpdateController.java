/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.controller;

import assignment.user.UserDAO;
import assignment.user.UserDTO;
import assignment.user.UserError;
import assignment.utils.DataUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kaizer
 */
public class UpdateController extends HttpServlet {

    private final static String ERROR_ADMIN = "update.jsp";
    private final static String ERROR_USER = "profile.jsp";
    private final static String SUCCESS_ADMIN = "SearchController";
    private final static String SUCCESS_USER = "SearchController";
    private final static String LOGOUT = "LogoutController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR_ADMIN;
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String status = request.getParameter("status");

            UserError error = new UserError("", "", "", "", "", "", "", "");
            boolean check = true;
            if (!DataUtils.checkFullName(fullName)) {
                error.setErrorFullName("User name length must between [5, 25]");
                check = false;
            }
            if (!DataUtils.checkRoleID(roleID)) {
                error.setErrorRoleID("Role ID must be AD or US");
                check = false;
            }
            if (!phoneNumber.equals("") && !DataUtils.checkPhoneNumber(phoneNumber)) {
                error.setErrorPhone("Your phone number must have 10 digits");
                check = false;
            }
            if (!address.equals("") && !DataUtils.checkAddress(address)) {
                error.setErrorAddress("Your address length must between [5, 50]");
                check = false;
            }
            if (!email.equals("") && !DataUtils.checkEmail(email)) {
                error.setErrorEmail("Your email must be valid");
                check = false;
            }

            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (check) {
                UserDTO user = new UserDTO(userID, fullName, roleID, "****", address, phoneNumber, email, status);
                UserDAO dao = new UserDAO();
                boolean checkUpdate = dao.updateUser(user);
                if (checkUpdate) {
                    if ("US".equals(loginUser.getRoleID())) {
                        session.setAttribute("LOGIN_USER", user);
                        url = SUCCESS_USER;
                    } else if (userID.equals(loginUser.getUserID())) {
                        url = LOGOUT;
                    } else if ("AD".equals(loginUser.getRoleID())) {                        
                        url = SUCCESS_ADMIN;
                    }
                }
            } else {
                request.setAttribute("USER_ERROR", error);
                if ("US".equals(loginUser.getRoleID())) {
                    url = ERROR_USER;
                } else if ("AD".equals(loginUser.getRoleID())) {
                    url = ERROR_ADMIN;
                }
            }
        } catch (Exception e) {
            log("Error at UpdateController: " + e.toString());
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

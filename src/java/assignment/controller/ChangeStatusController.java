/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.controller;

import assignment.user.UserDAO;
import assignment.user.UserDTO;
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
public class ChangeStatusController extends HttpServlet {

    private static final String ERROR = "SearchController";
    private static final String SUCCESS = "SearchController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String type = request.getParameter("type");
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (!"Deactivate".equals(type) && !"Activate".equals(type) && !"Lock".equals(type)) {
                request.setAttribute("ERROR_MESSAGE", "Your action is not correct, can't " + type);
            } else if (userID.equals(loginUser.getUserID())) {
                if ("Deactivate".equals(type)) {
                    request.setAttribute("ERROR_MESSAGE", "You can't deactive your account");
                } else if ("Lock".equals(type)) {
                    request.setAttribute("ERROR_MESSAGE", "You can't lock your account");
                } else {
                    request.setAttribute("ERROR_MESSAGE", "You can't change status of your account");
                }
            } else {
                UserDAO dao = new UserDAO();
                String action = "";
                switch (type) {
                    case "Deactivate": {
                        action = "Inactive";
                        break;
                    }
                    case "Activate": {
                        action = "Active";
                        break;
                    }
                    case "Lock": {
                        action = "Lock";
                        break;
                    }
                }
                boolean check = dao.changeStatusUser(userID, action);
                if (check) {
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            log("Error at DeleteController" + e.toString());
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

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
public class LoginController extends HttpServlet {

    private final static String ADMIN_PAGE = "admin.jsp";
    private final static String USER_PAGE = "user.jsp";
    private final static String ERROR = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userName = request.getParameter("userID");
            String password = request.getParameter("password");

            HttpSession session = request.getSession(false);

            if (session != null) {
                session.invalidate();
            }

            session = request.getSession();
            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.checkLogin(userName, password);
            if (loginUser != null) {
                if (loginUser.getStatus().equals("Active")) {
                    session.setAttribute("LOGIN_USER", loginUser);
                    if ("AD".equals(loginUser.getRoleID())) {
                        url = ADMIN_PAGE;
                    } else if ("US".equals(loginUser.getRoleID())) {
                        url = USER_PAGE;
                    }
                } else if (!loginUser.getStatus().equals("Active")) {
                    request.setAttribute("LOGIN_MESSAGE", "Sorry! Your account status is " + loginUser.getStatus());
                } else if (!"AD".equals(loginUser.getRoleID()) && !"US".equals(loginUser.getRoleID())) {
                    request.setAttribute("LOGIN_MESSAGE", "Your role is invalid");
                }
            } else {
                request.setAttribute("LOGIN_MESSAGE", "User ID or password not correct");
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.controller;

import assignment.shopping.OrdersDTO;
import assignment.shopping.ShoppingDAO;
import assignment.user.UserDTO;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kaizer
 */
@WebServlet(name = "GetListOrdersController", urlPatterns = {"/GetListOrdersController"})
public class GetListOrdersController extends HttpServlet {

    private final static String ERROR = "listOrders.jsp";
    private final static String SUCCESS = "listOrders.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            ShoppingDAO dao = new ShoppingDAO();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = loginUser.getUserID();
            List<OrdersDTO> list = dao.getListOrdersOfUser(userID);
            Collections.sort(list, new Comparator<OrdersDTO>() {
                @Override
                public int compare(OrdersDTO o1, OrdersDTO o2) {
                    return o2.getDate().compareToIgnoreCase(o1.getDate());
                }
            });
            request.setAttribute("LIST_ORDERS", list);
            if (!list.isEmpty()) {
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at GetListOrdersController: " + e.toString());
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

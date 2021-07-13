/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.controller;

import assignment.shopping.BookDTO;
import assignment.shopping.OrderDetailDTO;
import assignment.shopping.ShoppingDAO;
import java.io.IOException;
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
@WebServlet(name = "CancelOrdersController", urlPatterns = {"/CancelOrdersController"})
public class CancelOrdersController extends HttpServlet {

    private final static String ERROR = "listOrders.jsp";
    private final static String SUCCESS = "listOrders.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String orderID = request.getParameter("orderID");
            HttpSession session = request.getSession();
            List<OrderDetailDTO> listDetail = (List<OrderDetailDTO>) session.getAttribute("LIST_DETAIL");
            ShoppingDAO dao = new ShoppingDAO();
            boolean check = dao.changeStatusOrders(orderID, "Canceled");
            for (OrderDetailDTO order : listDetail) {
                dao.turnBackBookQuantity(order.getProductID(), order.getQuantity());
            }
            if (check) {
                url = SUCCESS;
            } else {
                request.setAttribute("LISTORDERS_ERROR", "Something wrong when you do this action!");
            }
        } catch (Exception e) {
            log("Error at ReceiveOrdersController: " + e.toString());
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.controller;

import assignment.shopping.BookInCart;
import assignment.shopping.Cart;
import assignment.shopping.ShoppingDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
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
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private final static String ERROR = "cart.jsp";
    private final static String SUCCESS = "orders.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            ArrayList<String> cartError = new ArrayList<>();
            boolean checkAllProductAreValid = true;
            ShoppingDAO dao = new ShoppingDAO();

            for (Map.Entry entry : cart.getCart().entrySet()) {
                String productID = (String) entry.getKey();
                BookInCart bookInCart = (BookInCart) entry.getValue();
                int amount = bookInCart.getAmount();
                if (!dao.checkProductHaveEnoughQuantity(productID, amount)) {
                    cartError.add("Book: " + bookInCart.getBook().getProductName() + " don't have enough to buy");
                    checkAllProductAreValid = false;
                }
            }
            if (checkAllProductAreValid) {
                url = SUCCESS;
            } else {
                request.setAttribute("CART_ERROR", cartError);
            }
        } catch (Exception e) {
            log("Error at CheckOutController: " + e.toString());
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

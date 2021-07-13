/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.controller;

import assignment.shopping.BookDTO;
import assignment.shopping.Cart;
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
@WebServlet(name = "ModifyBookInCartController", urlPatterns = {"/ModifyBookInCartController"})
public class ModifyBookInCartController extends HttpServlet {
    
    private static final String ERROR = "cart.jsp";
    private static final String SUCCESS = "cart.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int amount = Integer.parseInt(request.getParameter("amount"));
            String bookID = request.getParameter("productId");
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            ShoppingDAO dao = new ShoppingDAO();
            List<BookDTO> list = dao.getProductsFromDB();
            boolean bookIsInCart = false;
            if (cart != null && cart.getCart() != null) {
                if (cart.getCart().containsKey(bookID)) {
                    bookIsInCart = true;
                }
            }
            if (bookIsInCart) {
                boolean bookIsEnoughInStore = false;
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i).getProductID().equals(bookID)) {
                        if (list.get(i).getQuantity() >= amount) {
                            bookIsEnoughInStore = true;
                            break;
                        }
                    }
                }
                if (bookIsEnoughInStore) {
                    cart.updateAmountOfBook(bookID, amount);
                    url = SUCCESS;
                    String message = "Modify successfully!";
                    request.setAttribute("MODIFY_MESSAGE", message);
                    session.setAttribute("CART", cart);
                } else {
                    String message = "The amount is larger than number of available books";
                    request.setAttribute("MODIFY_MESSAGE", message);
                }
            } else {
                String message = "This book is not in your cart";
                request.setAttribute("MODIFY_MESSAGE", message);
            }
            
        } catch (Exception e) {
            log("Error at ModifyBookInCartController: " + e.toString());
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.controller;

import assignment.shopping.BookDTO;
import assignment.shopping.Cart;
import assignment.shopping.ShoppingDAO;
import assignment.user.UserDTO;
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
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    private static final String ERROR = "user.jsp";
    private static final String SUCCESS = "user.jsp";
    private static final String LOGIN = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                url = LOGIN;
            } else {
                String amountString = request.getParameter("quantity");
                if (amountString == null) {
                    amountString = "0";
                }
                int amount = Integer.parseInt(amountString);
                String bookString = request.getParameter("book");
                String bookTmp[] = bookString.split(",");
                BookDTO book = new BookDTO(bookTmp[0], bookTmp[1], Double.parseDouble(bookTmp[2]), amount, bookTmp[4], bookTmp[5], bookTmp[6]);

                String bookID = bookTmp[0];

                ShoppingDAO dao = new ShoppingDAO();
                List<BookDTO> list = dao.getProductsFromDB();
                Cart cart = (Cart) session.getAttribute("CART");
                int amountInCast = 0;
                if (cart == null) {
                    cart = new Cart();
                } else {
                    if (cart.getCart().get(bookID) != null) {
                        {
                            amountInCast = cart.getCart().get(bookID).getAmount();
                        };
                    }
                }

                boolean checkEnoughBook = true;
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i).getProductID().equals(bookID)) {
                        if (list.get(i).getQuantity() < (amount + amountInCast)) {
                            checkEnoughBook = false;
                        }
                        break;
                    }
                }
                if (checkEnoughBook) {
                    cart.addBook(book, amount);
                    session.setAttribute("CART", cart);
                    url = SUCCESS;
                    String message = "Add " + amount + " " + bookTmp[1] + "to cart successfully";
                    request.setAttribute("ADD_MESSAGE", message);
                } else {
                    String message = "This book don't have enough for you!";
                    request.setAttribute("ADD_MESSAGE", message);
                }
            }

        } catch (Exception e) {
            log("Error at AddToCartController: " + e.toString());
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

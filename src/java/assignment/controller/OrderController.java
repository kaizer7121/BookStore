/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.controller;

import assignment.email.sendMail;
import assignment.shopping.BookDTO;
import assignment.shopping.BookInCart;
import assignment.shopping.Cart;
import assignment.shopping.ShoppingDAO;
import assignment.user.UserDTO;
import assignment.user.UserError;
import assignment.utils.DataUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.mail.MessagingException;
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
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

    private static final String ERROR = "cart.jsp";
    private static final String SUCCESS = "user.jsp";
    private static final String NOT_VALIDATE = "orders.jsp";

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
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                String userID = loginUser.getUserID();
                double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
                String phone = request.getParameter("phoneNumber");
                String address = request.getParameter("address");
                String paymentMethod = request.getParameter("paymentMethod");
                String email = request.getParameter("email");

                UserError error = new UserError("", "", "", "", "", "", "", "");
                boolean checkValidInfo = true;

                if (!DataUtils.checkPhoneNumber(phone)) {
                    error.setErrorPhone("Your phone number must have 10 digits");
                    checkValidInfo = false;
                }
                if (!DataUtils.checkAddress(address)) {
                    error.setErrorAddress("Your address length must between [5, 50]");
                    checkValidInfo = false;
                }
                if (!DataUtils.checkEmail(email)) {
                    error.setErrorEmail("Your email must be valid");
                    checkValidInfo = false;
                }

                if (checkValidInfo) {
                    List<BookDTO> listBook = dao.getProductsFromDB();
                    String orderID = dao.createOrderFromCartToDB(userID, totalPrice, "Shipping", phone, address, paymentMethod, email);
                    if (orderID != null) {
                        for (Map.Entry entry : cart.getCart().entrySet()) {
                            String productID = (String) entry.getKey();
                            BookInCart bookInCart = (BookInCart) entry.getValue();
                            int amount = bookInCart.getAmount();
                            double price = bookInCart.getBook().getPrice();
                            dao.createOrderDetailInDB(orderID, productID, amount, amount * price);

                            for (BookDTO book : listBook) {
                                if (book.getProductID().equals(productID)) {
                                    int quantity = book.getQuantity();
                                    if (quantity > amount) {
                                        dao.setQuantityOfProduct(productID, quantity - amount);
                                    } else if (quantity == amount) {
                                        dao.setStatusBookWhenOutOfShock(productID);
                                    }
                                }
                            }
                        }
                        Thread thread = new Thread() {
                            public void run() {
                                try {
                                    sendMail.sendMail(email, cart.getCart().size());
                                } catch (MessagingException ex) {
                                    log("Error when send email: " + ex.toString());
                                }
                            }
                        };
                        thread.start();

                        session.removeAttribute("CART");
                        request.setAttribute("ORDER_MESSAGE", "You ordered successfully");
                        url = SUCCESS;
                    } else {
                        request.setAttribute("ORDER_MESSAGE", "Some thing wrong when you order");
                        url = SUCCESS;
                    }
                } else {
                    request.setAttribute("ORDER_ERROR", error);
                    url = NOT_VALIDATE;
                }

            } else {
                request.setAttribute("CART_ERROR", cartError);
            }
        } catch (Exception e) {
            log("Error at OrderController: " + e.toString());
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

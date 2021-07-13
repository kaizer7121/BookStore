/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment.controller;

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
public class MainController extends HttpServlet {

    private final static String ERROR = "error.jsp";
    private final static String LOGIN = "LoginController";
    private final static String LOGOUT = "LogoutController";
    private final static String SEARCH = "SearchController";
    private final static String CHANGESTATUS = "ChangeStatusController";
    private final static String UPDATE_PAGE = "update.jsp";
    private final static String UPDATE_USER = "UpdateController";
    private final static String REGISTER = "RegisterController";
    private final static String GET_BOOKS = "GetBookController";
    private final static String ADD_TO_CART = "AddToCartController";
    private final static String REMOVE_ITEM = "RemoveBookInCartController";
    private final static String MODIFY_ITEM = "ModifyBookInCartController";
    private final static String CHECK_OUT = "CheckOutController";
    private final static String ORDERS = "OrderController";
    private static final String VIEW_LIST_ORDERS = "listOrders.jsp";
    private static final String GET_LIST_ORDERS = "GetListOrdersController";
    private static final String RECEIVE_ORDERS = "ReceiveOrdersController";
    private static final String CANCEL_ORDERS = "CancelOrdersController";
    private static final String VIEW_ORDERS_DETAIL = "ViewOrdersDetailController";
    private static final String SEARCH_BOOKS = "SearchBookController";
    private static final String FILTER_BOOKS = "FilterBookController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            switch (action) {
                case "Login": {
                    url = LOGIN;
                    break;
                }
                case "Search": {
                    url = SEARCH;
                    break;
                }
                case "ChangeStatus": {
                    url = CHANGESTATUS;
                    break;
                }
                case "Update": {
                    url = UPDATE_PAGE;
                    break;
                }
                case "Update User": {
                    url = UPDATE_USER;
                    break;
                }
                case "Logout": {
                    url = LOGOUT;
                    break;
                }
                case "Register": {
                    url = REGISTER;
                    break;
                }
                case "Get books": {
                    url = GET_BOOKS;
                    break;
                }
                case "Add to Cart": {
                    url = ADD_TO_CART;
                    break;
                }
                case "Modify Cart": {
                    url = MODIFY_ITEM;
                    break;
                }
                case "Remove Cart": {
                    url = REMOVE_ITEM;
                    break;
                }
                case "Check out": {
                    url = CHECK_OUT;
                    break;
                }
                case "Order": {
                    url = ORDERS;
                    break;
                }
                case "ViewListOrders": {
                    url = VIEW_LIST_ORDERS;
                    break;
                }
                case "Get list orders": {
                    url = GET_LIST_ORDERS;
                    break;
                }
                case "Receive orders": {
                    url = RECEIVE_ORDERS;
                    break;
                }
                case "Cancel orders": {
                    url = CANCEL_ORDERS;
                    break;
                }
                case "View orders detail": {
                    url = VIEW_ORDERS_DETAIL;
                    break;
                }
                case "Search book": {
                    url = SEARCH_BOOKS;
                    break;
                }
                case "Filter with category": {
                    url = FILTER_BOOKS;
                    break;
                }
                default:
                    HttpSession session = request.getSession();
                    session.setAttribute("ERROR_MESSAGE", "Your action is not valid");
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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

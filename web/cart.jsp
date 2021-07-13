<%-- 
    Document   : cart
    Created on : Jun 28, 2021, 9:06:07 PM
    Author     : Kaizer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


        <link rel="stylesheet" href="Style/cart.css" />
        <link rel="stylesheet" href="Style/navigation.css" />
        
       
    </head>
    <body>
        <jsp:directive.include file="UI/Navbar.jsp"/>

        <c:if test="${sessionScope.CART == null || empty sessionScope.CART.cart}">
            <div class="container-fluid mt-100">
                <div class="row">
                    <div class="col-md-12 mt-5">
                        <div class="card mt-5">
                            <div class="card-body cart">
                                <div class="col-sm-12 empty-cart-cls text-center"> <img src="https://i.imgur.com/dCdflKN.png" width="130" height="130" class="img-fluid mb-4 mr-3">
                                    <h3><strong>Your Cart is Empty</strong></h3>
                                    <h4>Add something to make me happy :)</h4>
                                    <a href="user.jsp">
                                        <button class="button text-dark btn-light cart_button_clear mt-4 ms-4">Continue Shopping</button>
                                    </a> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>


        <c:if test="${sessionScope.CART != null && not empty sessionScope.CART.cart}">
            <div class="mt-5">
                <h3 class="text-center text-danger">${requestScope.CART_ERROR}</h3>
                <c:if test="${requestScope.MODIFY_MESSAGE == 'The amount is larger than number of available books'}">
                    <h3 class="text-center text-danger">${requestScope.MODIFY_MESSAGE}</h3>
                </c:if>
                <c:if test="${requestScope.MODIFY_MESSAGE == 'Modify successfully!'}">
                    <h3 class="text-center text-success">${requestScope.MODIFY_MESSAGE}</h3>
                </c:if>
                <h3 class="test-center text-danger">${requestScope.REMOVE_MESSAGE}</h3>
            </div>



            <div class="cart_section">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <div class="cart_container">
                                <div class="cart_title">Shopping Cart<small> (${sessionScope.CART.cart.size()} item in your cart) </small></div>
                                <div class="cart_items">
                                    <ul class="cart_list">
                                        <c:set var="total" value="0"/>
                                        <c:forEach var="bookInCart" varStatus="counter" items="${sessionScope.CART.cart}">
                                            <form action="MainController">
                                                <input type="hidden" name="productId" value="${bookInCart.value.book.productID}"/>
                                                <li class="cart_item clearfix">
                                                    <div class="cart_item_image "><img src="${bookInCart.value.book.imageSource}" alt="${bookInCart.value.book.productID}"></div>
                                                    <div class="cart_item_info d-flex flex-md-row flex-column justify-content-between">
                                                        <div class="cart_item_name cart_info_col">
                                                            <div class="cart_item_title">Name</div>
                                                            <div class="cart_item_text">${bookInCart.value.book.productName}</div>
                                                        </div>
                                                        <div class="cart_item_quantity cart_info_col">
                                                            <div class="cart_item_title">Amount</div>
                                                            <div class="cart_item_text mb-5 amount-group">
                                                                <input type="number" name="amount" value="${bookInCart.value.amount}" class="form-control amount-input"/>
                                                            </div>
                                                        </div>
                                                        <div class="cart_item_price cart_info_col">
                                                            <div class="cart_item_title">Price</div>
                                                            <div class="cart_item_text">${bookInCart.value.book.price}$</div>
                                                        </div>
                                                        <div class="cart_item_total cart_info_col">
                                                            <div class="cart_item_title">Total</div>
                                                            <div class="cart_item_text">${bookInCart.value.book.quantity * bookInCart.value.book.price}$</div>
                                                        </div>
                                                        <div class="cart_item_total cart_info_col">
                                                            <div class="cart_item_title">Modify</div>
                                                            <div class="cart_item_text"> 
                                                                <input type="submit" name="action" value="Modify Cart" class="btn btn-outline-dark"/>
                                                            </div>
                                                        </div>
                                                        <div class="cart_item_total cart_info_col">
                                                            <div class="cart_item_title">Remove</div>
                                                            <div class="cart_item_text">
                                                                <input type="submit" name="action" value="Remove Cart" class="btn btn-outline-dark"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <c:set var="total" value="${total + bookInCart.value.amount * bookInCart.value.book.price}" />
                                            </form>
                                        </c:forEach>
                                    </ul>
                                </div>

                                <div class="order_total">
                                    <div class="order_total_content text-md-end">
                                        <div class="order_total_title">Order Total:</div>
                                        <div class="order_total_amount">${total}$</div>
                                    </div>
                                </div>


                                <div class="cart_buttons"> 
                                    <a href="user.jsp"><button type="button" class="button text-dark btn-light cart_button_clear">Continue Shopping</button></a> 
                                    <form action="MainController" class="d-inline">
                                        <button type="submit" name="action"  value="Check out" class="button cart_button_checkout">Check out</button>
                                    </form>
                                </div>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

    </body>
</html>

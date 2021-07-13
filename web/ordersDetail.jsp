<%-- 
    Document   : ordersDetail
    Created on : Jul 5, 2021, 2:53:17 PM
    Author     : Kaizer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders Detail Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="Style/ordersDetail.css" />
        <link rel="stylesheet" href="Style/navigation.css" />



    </head>
    <body>
        <jsp:directive.include file="UI/Navbar.jsp"/>

        <div class="cart_section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-10 offset-lg-1">
                        <div class="cart_container">
                            <div class="cart_title">
                                List Orders Detail
                                <c:if test="${param.status == 'Shipping'}">
                                    <span class="text-warning">
                                        (${param.status})
                                    </span>
                                </c:if>
                                <c:if test="${param.status == 'Canceled'}">
                                    <span class="text-danger">
                                        (${param.status})
                                    </span>

                                </c:if>
                                <c:if test="${param.status == 'Received'}">
                                    <span class="text-success">
                                        (${param.status})
                                    </span>
                                </c:if>
                            </div>
                            <div class="text-end">
                                <p >Order ID: ${param.orderID}</p>
                            </div>
                            <div class="cart_items">
                                <ul class="cart_list">
                                    <c:set var="total" value="0"/>
                                    <c:forEach var="ordersDetail" varStatus="counter" items="${sessionScope.LIST_DETAIL}">
                                        <li class="cart_item clearfix">
                                            <div class="cart_item_image "><img src="${ordersDetail.imageSource}" alt="${ordersDetail.productID}"></div>
                                            <div class="cart_item_info d-flex flex-md-row flex-column justify-content-between">
                                                <div class="cart_item_name cart_info_col">
                                                    <div class="cart_item_title">Name</div>
                                                    <div class="cart_item_text">${ordersDetail.productName}</div>
                                                </div>
                                                <div class="cart_item_quantity cart_info_col text-center">
                                                    <div class="cart_item_title">Amount</div>
                                                    <div class="cart_item_text mb-5 amount-group">
                                                        <div class="cart_item_text">${ordersDetail.quantity}</div>
                                                    </div>
                                                </div>
                                                <div class="cart_item_price cart_info_col">
                                                    <div class="cart_item_title">Price</div>
                                                    <div class="cart_item_text">${ordersDetail.totalPrice}$</div>
                                                </div>

                                            </div>
                                        </li>
                                        <c:set var="total" value="${total + ordersDetail.totalPrice}" />
                                    </c:forEach>
                                </ul>
                            </div>

                            <div class="order_total">
                                <div class="order_total_content text-md-end">

                                    <div class="order_total_title">Order Total:</div>
                                    <div class="order_total_amount">${total}$</div>
                                </div>
                            </div>
                            <div class="mt-3">
                                <a href="listOrders.jsp"><button class="btn btn-primary text-start">List Orders</button></a> 
                            </div>

                            <c:if test="${param.status == 'Shipping'}">
                                <form action="MainController">
                                    <div class="mt-5 cart_buttons">
                                        <input type="hidden" name="orderID" value="${param.orderID}"/>
                                        <button type="submit" name="action" value="Cancel orders" class="button btn-danger button-cancel cart_button_checkout pe-5 ps-5 mr-5">Cancel</button>
                                        <button type="submit" name="action" value="Receive orders" class="button btn-success button-received cart_button_checkout ml-5">Received</button>
                                    </div>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

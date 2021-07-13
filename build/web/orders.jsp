<%-- 
    Document   : order
    Created on : Jul 3, 2021, 7:27:03 PM
    Author     : Kaizer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="Style/orders.css" />
        <link rel="stylesheet" href="Style/navigation.css" />
        
    </head>
    <body>
        <c:if test="${sessionScope.CART == null || empty sessionScope.CART}">
            <c:redirect url="user.jsp"/>
        </c:if>

        <jsp:directive.include file="UI/Navbar.jsp"/>

        <div class=" container-fluid my-5 shop">
            <div class="row justify-content-center ">
                <div class="col-xl-10">
                    <div class="card shadow ">
                        <a href="cart.jsp"><button class="btn btn-danger m-4">Back to cart</button></a>
                        <form action="MainController">
                            <div class="row justify-content-around">
                                <div class="col-md-5">
                                    <div class="card border-0">
                                        <div class="card-header pb-0 mt-5 pt-2">
                                            <h2 class="card-title space ">CHECKOUT</h2>
                                        </div>
                                        <div class="card-body">
                                            <div class="row mt-4">
                                                <div class="col">
                                                    <p class="text-muted mb-2">PAYMENT DETAILS</p>
                                                    <hr class="mt-0">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="NAME" class="small text-muted mb-1">Address</label>
                                                <input type="text" name="address" value="${sessionScope.LOGIN_USER.address}" class="form-control form-control-sm" required=""> 
                                                <p class="text-danger ms-2">${requestScope.ORDER_ERROR.errorAddress}</p>
                                            </div>
                                            <div class="form-group mt-3">
                                                <label for="NAME" class="small text-muted mb-1">Email</label> 
                                                <input type="text" name="email" value="${sessionScope.LOGIN_USER.email}" class="form-control form-control-sm" required=""/> 
                                                <p class="text-danger ms-2">${requestScope.ORDER_ERROR.errorEmail}</p>
                                            </div>
                                            <div class="row no-gutters mt-3">
                                                <div class="col-sm-6 pr-sm-2">
                                                    <div class="form-group"> 
                                                        <label for="NAME" class="small text-muted mb-1">Full name</label> 
                                                        <input type="text" name="fullName" value="${sessionScope.LOGIN_USER.fullName}" class="form-control form-control-sm" required=""/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="NAME" class="small text-muted mb-1">Phone</label> 
                                                        <input type="text" name="phoneNumber" value="${sessionScope.LOGIN_USER.phoneNumber}" class="form-control form-control-sm" required=""/> 
                                                        <p class="text-danger ms-2">${requestScope.ORDER_ERROR.errorPhone}</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-4">
                                                <div class="d-flex justify-content-between mt-2">
                                                    <div class="form-check user-radio-check">
                                                        <input class="form-check-input" type="radio" id="delivery" name="paymentMethod" value="Payment on delivery" checked="" /> 
                                                        <label class="form-check-label" for="flexRadioDefault2">Payment on delivery</label> 
                                                    </div> 
                                                </div>
                                                <div class="d-flex justify-content-between mt-2">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" id="card" name="paymentMethod" value="Payment on delivery"/> 
                                                        <label class="form-check-label" for="flexRadioDefault2" >Payment by card</label> 
                                                    </div> 
                                                </div>  
                                            </div>

                                            <div class="row mt-4">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5 mt-5 cart-detail">
                                    <div class="card border-0 mt-4">
                                        <div class="card-header card-2 mt-5">
                                            <p class="card-text text-muted mt-md-4 mb-2 space">YOUR CART</p>
                                            <hr class="my-2">
                                        </div>
                                        <div class="card-body pt-0">

                                            <c:set var="total" value="0"/>
                                            <c:forEach var="bookInCart" items="${sessionScope.CART.cart}">                                           
                                                <div class="row justify-content-between">
                                                    <div class="col-auto col-md-7">
                                                        <div class="media flex-column flex-sm-row"> 
                                                            <img class="img-fluid" src="${bookInCart.value.book.imageSource}" width="62" height="62">
                                                            <div class="media-body my-auto">
                                                                <div class="row ">
                                                                    <div class="col-auto">
                                                                        <p class="mb-0">
                                                                            <b>${bookInCart.value.book.productName}</b>
                                                                        </p>
                                                                        <small class="text-muted">${bookInCart.value.book.category}</small>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class=" pl-0 flex-sm-col col-auto my-auto">
                                                        <p class="boxed-1">${bookInCart.value.amount}</p>
                                                    </div>
                                                    <div class=" pl-0 flex-sm-col col-auto my-auto item-price">
                                                        <p>
                                                            <b>${bookInCart.value.amount * bookInCart.value.book.price}$</b>
                                                        </p>
                                                    </div>
                                                </div>
                                                <hr class="my-2">
                                                <c:set var="total" value="${total + bookInCart.value.amount * bookInCart.value.book.price}"/>
                                            </c:forEach>                

                                            <div class="row ">
                                                <div class="col mt-3" >
                                                    <div class="row justify-content-between">
                                                        <div class="col-4 mb-3 d-flex align-items-center">
                                                            <h4><b>Total</b></h4>
                                                        </div>
                                                        <div class="flex-sm-col col-auto mb-3 d-flex align-items-center">
                                                            <h6 class="mb-1"><b>${total}$</b></h6>
                                                        </div>
                                                    </div>
                                                    <hr class="my-0">
                                                </div>
                                            </div>
                                            <div class="row mb-5 mt-4 ">
                                                <button type="submit" name="action" value="Order" class="btn btn-primary">BUY</button> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="totalPrice" value="${total}"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

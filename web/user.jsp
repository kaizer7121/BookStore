<%-- 
    Document   : user
    Created on : Jun 27, 2021, 3:36:19 PM
    Author     : Kaizer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="assignment.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="Style/user.css" />
        <link rel="stylesheet" href="Style/navigation.css" />


    </head>
    <body>
        <c:if test="${'AD' == sessionScope.LOGIN_USER.roleID }">
            <c:redirect url="admin.jsp"/>
        </c:if>
        <c:if test="${requestScope.LIST_BOOK == null}">
            <c:redirect url="MainController">
                <c:param name="ERROR_MESSAGE" value="${requestScope.ERROR_MESSAGE}"/>
                <c:param name="ORDER_MESSAGE" value="${requestScope.ORDER_MESSAGE}"/>
                <c:param name="ADD_MESSAGE" value="${requestScope.ADD_MESSAGE}"/>
                <c:param name="action" value="Get books"/>
            </c:redirect>
        </c:if>

        <jsp:directive.include file="UI/Navbar.jsp"/>

        <div class="text-center">
            <h4 class="text-danger text-center">${param.ERROR_MESSAGE}</h4>
            <h4 class="text-info text-center">${param.ORDER_MESSAGE}</h4>
            <h2 class="text-warning text-center mt-5">${requestScope.SEARCH_ERROR}</h2>    
            <h4 class="text-success">${param.ADD_MESSAGE}</h4>
        </div>


        <div class="containter text-center">
            <div class="user-filter-category mt-2 p-4 border">
                <div class="heading d-flex justify-content-between align-items-center mt-2">
                    <h5 class="text-uppercase user-radio-title">Category</h5>
                </div>
                <hr>
                <form action="MainController">    
                    <div class="d-flex justify-content-between mt-2">
                        <div class="form-check user-radio-check">
                            <input class="form-check-input" type="radio" value="All" name="category" ${requestScope.CATEGORY == null || requestScope.CATEGORY == '' ? 'checked' : ''} /> 
                            <label class="form-check-label" for="flexRadioDefault2"> All </label> 
                        </div> 
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="Cooking" name="category" ${requestScope.CATEGORY == 'Cooking' ? 'checked' : ''}/> 
                            <label class="form-check-label" for="flexRadioDefault2"> Cooking </label> 
                        </div> 
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="Kid" name="category" ${requestScope.CATEGORY == 'Kid' ? 'checked' : ''}/> 
                            <label class="form-check-label" for="flexRadioDefault2"> Kid </label> 
                        </div> 
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                        <div class="form-check"> 
                            <input class="form-check-input" type="radio" value="Mysteries" name="category" ${requestScope.CATEGORY == 'Mysteries' ? 'checked' : ''}/> 
                            <label class="form-check-label" for="flexRadioDefault2"> Mysteries </label> 
                        </div>
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="Romance" name="category" ${requestScope.CATEGORY == 'Romance' ? 'checked' : ''}/>
                            <label class="form-check-label" for="flexRadioDefault2"> Romance </label> 
                        </div>
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="Travel"name="category" ${requestScope.CATEGORY == 'Travel' ? 'checked' : ''}/> 
                            <label class="form-check-label" for="flexRadioDefault2"> Travel </label> 
                        </div>
                    </div>
                    <button name="action" value="Filter with category" class="btn btn-outline-primary mt-3 ps-4 pe-4">Filter</button>
                </form>
            </div>


            <div class="container user-grid user-list-book">
                <div class="row">
                    <c:forEach var="book" items="${requestScope.LIST_BOOK}">
                        <c:if test="${book.status == 'Available'}">
                            <div class="col-lg-4 col-md-6 col-sm-12 mb-4 mt-4 d-flex justify-content-center hover-overlay ripple shadow-1-strong">
                                <div class="card h-100" style="width: 18rem;">
                                    <img src="${book.imageSource}" class="card-img-top user-card-img" alt="${book.productName}">
                                    <div class="card-body">
                                        <h3 class="card-title user-card-title text-dark">${book.productName}</h3>
                                        <p class="card-text text-danger">Quantity: ${book.quantity}</p>
                                        <p class="card-text text-success">price: ${book.price}$</p>
                                    </div>
                                    <form action="MainController">
                                        <div class="d-flex align-items-end justify-content-center">
                                            <div class="input-group mb-3 user-add-book">
                                                <input type="hidden" name="book" value="${book}"/>
                                                <input type="number" name="quantity" min="1" max="${book.quantity}" class="form-control rounded-start text-end" placeholder="Amount" required="" />
                                                <button type="submit" name="action" value="Add to Cart" class="btn btn-outline-success">Add to Cart</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>  
        </div>
    </body>
</html>

<%-- 
    Document   : listOrders
    Created on : Jul 4, 2021, 7:59:39 PM
    Author     : Kaizer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="Style/admin.css" />
        <link rel="stylesheet" href="Style/navigation.css" />
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="login.jsp" />
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
            <c:redirect url="admin.jsp" />
        </c:if>

        <c:if test="${requestScope.LIST_ORDERS == null}">
            <c:redirect url="MainController">
                <c:param name="action" value="Get list orders"/>
            </c:redirect>
        </c:if>

        <jsp:directive.include file="UI/Navbar.jsp"/>

        <c:if test="${empty requestScope.LIST_ORDERS}">
            <h1 class="text-info text-center mt-5 pt-5">You don't have any orders</h1>
        </c:if>
        <c:if test="${not empty requestScope.LIST_ORDERS}">
            <div class="containter admin-container">
                <p>${requestScope.LISTORDERS_ERROR}</p>
                <table class="table admin-table mt-5">
                    <thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">OrderID</th>
                            <th scope="col">Date</th>
                            <th scope="col">Total Price</th>
                            <th scope="col">Payment</th>
                            <th scope="col">Status</th>
                            <th scope="col">Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="orders" varStatus="counter" items="${requestScope.LIST_ORDERS}">
                        <form action="MainController">
                            <tr scope="row" class="align-middle">
                                <td>${counter.count}</td>
                                <td>
                                    ${orders.orderID}
                                    <input type="hidden" name="orderID" value="${orders.orderID}"/>
                                </td>
                                <td>${orders.date}</td>
                                <td>${orders.totalPrice}$</td>
                                <td>${orders.paymentMethod}</td>
                                <td>
                                    <c:if test="${orders.status == 'Shipping'}">
                                        <div class="align-middle text-warning">
                                            ${orders.status}
                                        </div>
                                    </c:if>
                                    <c:if test="${orders.status == 'Canceled'}">
                                        <div class="align-middle text-danger">
                                            ${orders.status}
                                        </div>

                                    </c:if>
                                    <c:if test="${orders.status == 'Received'}">
                                        <div class="align-middle text-success">
                                            ${orders.status}
                                        </div>
                                    </c:if>
                                    <input type="hidden" name="status" value="${orders.status}"/>
                                </td>
                                <td>
                                    <button type="submit" name="action" value="View orders detail" class="btn btn-info">Detail</button>
                                </td>

                            </tr>
                        </form>

                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </c:if>
    </body>
</html>

<%-- 
    Document   : profile
    Created on : Jul 4, 2021, 4:29:01 PM
    Author     : Kaizer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="assignment.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="Style/profile.css" />
        <link rel="stylesheet" href="Style/navigation.css" />             
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="login.jsp" />
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
            <c:redirect url="admin.jsp" />
        </c:if>

        <jsp:directive.include file="UI/Navbar.jsp"/>

        <div class="container">
            <h1 class="register-header">Update user: ${sessionScope.LOGIN_USER.userID}</h1>
            <form action="MainController" class="mt-4 form-register">
                <div class="mb-3">
                    <label class="form-label">User name</label>
                    <input type="text" name="userID" value="${sessionScope.LOGIN_USER.userID}" class="form-control" readonly/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Full name</label>
                    <input type="text" name="fullName" value="${sessionScope.LOGIN_USER.fullName}" class="form-control"/>
                </div>
                <c:if test="${requestScope.USER_ERROR.errorFullName != null && requestScope.USER_ERROR.errorFullName != ''}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.USER_ERROR.errorFullName}
                    </div>
                </c:if>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="text" name="email" value="${sessionScope.LOGIN_USER.email}" class="form-control"/>
                </div>
                <c:if test="${requestScope.USER_ERROR.errorEmail != null && requestScope.USER_ERROR.errorEmail != ''}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.USER_ERROR.errorEmail}
                    </div>
                </c:if>

                <div class="mb-3">
                    <label class="form-label">Phone</label>
                    <input type="text" name="phoneNumber" value="${sessionScope.LOGIN_USER.phoneNumber}" class="form-control">
                </div>
                <c:if test="${requestScope.USER_ERROR.errorPhone != null && requestScope.USER_ERROR.errorPhone != ''}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.USER_ERROR.errorPhone}
                    </div>
                </c:if>
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <input type="text" name="address" value="${sessionScope.LOGIN_USER.address}" class="form-control">
                </div>
                <c:if test="${requestScope.USER_ERROR.errorAddress != null && requestScope.USER_ERROR.errorAddress != ''}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.USER_ERROR.errorAddress}
                    </div>
                </c:if>
                <input type="hidden" name="roleID" value="${sessionScope.LOGIN_USER.roleID}"/>
                <input type="hidden" name="status" value="${sessionScope.LOGIN_USER.status}"/>
                <div>
                    <a href="user.jsp"><button type="button" class="btn btn-primary register-button me-3 ps-4 pe-4">Back</button></a>
                    <button type="submit" name="action" value="Update User" class="btn btn-primary register-button">Update</button>
                </div>
            </form>          
        </div>
    </body>
</html>

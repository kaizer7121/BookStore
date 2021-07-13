<%-- 
    Document   : update
    Created on : Jun 22, 2021, 11:35:42 AM
    Author     : Kaizer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="assignment.user.UserDTO"%>
<%@page import="assignment.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="Style/register.css" />
    </head>
    <body>

        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("login.jsp");
                return;
            } else if ("US".equals(loginUser.getRoleID())) {
                response.sendRedirect("user.jsp");
                return;
            }
        %>

        <div class="container">
            <h1 class="register-header">Update user: ${param.userID}</h1>
            <form action="MainController" class="mt-4 form-register">
                <div class="mb-3">
                    <label class="form-label">User name</label>
                    <input type="text" name="userID" value="${param.userID}" class="form-control" readonly/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Full name</label>
                    <input type="text" name="fullName" value="${param.fullName}" class="form-control"/>
                </div>
                <c:if test="${requestScope.USER_ERROR.errorFullName != null}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.USER_ERROR.errorFullName}
                    </div>
                </c:if>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="text" name="email" value="${param.email}" class="form-control"/>
                </div>
                <c:if test="${requestScope.USER_ERROR.errorEmail != null && requestScope.USER_ERROR.errorEmail != ''}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.USER_ERROR.errorEmail}
                    </div>
                </c:if>

                <div class="mb-3">
                    <label class="form-label">Phone</label>
                    <input type="text" name="phoneNumber" value="${param.phoneNumber}" class="form-control">
                </div>
                <c:if test="${requestScope.USER_ERROR.errorPhone != null && requestScope.USER_ERROR.errorPhone != ''}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.USER_ERROR.errorPhone}
                    </div>
                </c:if>
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <input type="text" name="address" value="${param.address}" class="form-control">
                </div>
                <c:if test="${requestScope.USER_ERROR.errorAddress != null && requestScope.USER_ERROR.errorAddress != ''}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.USER_ERROR.errorAddress}
                    </div>
                </c:if>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Role</label>
                    <select name="roleID" class="form-select mb-3" aria-label="Default select example">
                        <c:if test="${param.roleID == 'AD'}">
                            <option value="AD" selected="">AD</option>
                            <option value="US">US</option>
                        </c:if>
                        <c:if test="${param.roleID == 'US'}">

                            <option value="AD">AD</option>
                            <option value="US" selected="">US</option>
                        </c:if>
                    </select>
                    <c:if test="${requestScope.USER_ERROR.errorRoleID != null && requestScope.USER_ERROR.errorRoleID != ''}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.USER_ERROR.errorRoleID}
                        </div>
                    </c:if>
                </div>
                <div>
                    <input type="hidden" name="status" value="${param.status}" />
                    <input type="hidden" name="search" value="${param.search}" />
                    <c:url var="backAdminPage" value="MainController">
                        <c:param name="action" value="Search" />
                        <c:param name="search" value="${param.search}" />
                    </c:url>
                    <a href="${backAdminPage}"><button type="button" class="btn btn-primary register-button me-3 ps-4 pe-4">Back</button></a>
                    <button type="submit" name="action" value="Update User" class="btn btn-primary register-button">Update</button>
                </div>

            </form>          
        </div>

    </body>
</html>

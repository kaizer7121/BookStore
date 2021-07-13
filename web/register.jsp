<%-- 
    Document   : register
    Created on : Jun 24, 2021, 12:06:17 AM
    Author     : Kaizer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="assignment.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="Style/register.css" />

    </head>
    <body>
        <div class="container">
            <h1 class="register-header">Register form</h1>
            <form action="MainController" method="POST" class="mt-4 form-register">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">User name</label>
                    <input type="text" name="userID" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <c:if test="${requestScope.USER_ERROR.errorUserID != null && requestScope.USER_ERROR.errorUserID != ''}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.USER_ERROR.errorUserID}
                    </div>
                </c:if>

                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Full name</label>
                    <input type="text" name="fullName" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <c:if test="${requestScope.USER_ERROR.errorFullName != null && requestScope.USER_ERROR.errorFullName != ''}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.USER_ERROR.errorFullName}
                    </div>
                </c:if>

                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <c:if test="${requestScope.USER_ERROR.errorPassword != null && requestScope.USER_ERROR.errorPassword != ''}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.USER_ERROR.errorPassword}
                    </div>
                </c:if>

                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Confirm Password</label>
                    <input type="password" name="confirmPassword" class="form-control" id="exampleInputPassword1">
                </div>
                <c:if test="${requestScope.USER_ERROR.errorConfirm != null && requestScope.USER_ERROR.errorConfirm != ''}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.USER_ERROR.errorConfirm}
                    </div>
                </c:if>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Role</label>
                    <select name="roleID" class="form-select mb-3" aria-label="Default select example">
                        <option selected hidden>Choose role</option>
                        <option value="AD">AD</option>
                        <option value="US">US</option>
                    </select>
                    <c:if test="${requestScope.USER_ERROR.errorRoleID != null && requestScope.USER_ERROR.errorRoleID != ''}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.USER_ERROR.errorRoleID}
                        </div>
                    </c:if>
                </div>
                <div class="mb-3 ">
                    <a href="login.jsp">Already have an account ?</a>
                </div>
                <a href="user.jsp"><button type="button" class="btn btn-primary register-button me-3">Back home</button></a>
                <button type="submit" name="action" value="Register" class="btn btn-primary register-button">Sign up</button>
            </form>          
        </div>
    </body>
</html>

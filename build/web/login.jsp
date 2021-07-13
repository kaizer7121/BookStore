<%-- 
    Document   : login
    Created on : Jul 11, 2021, 9:08:41 PM
    Author     : Kaizer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="Style/login.css" />
    </head>
    <body>
        <div class="container">
            <h1 class="login-header">Login form</h1>
            <form action="MainController" method="POST" class="mt-4 form-login">
                <c:if test="${requestScope.LOGIN_MESSAGE != null}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.LOGIN_MESSAGE}
                    </div>
                </c:if>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">User name</label>
                    <input type="text" name="userID" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                </div>
                <div class="mb-3 ">
                    <a href="register.jsp">Create new account</a>
                </div>
                <a href="user.jsp"><button type="button" class="btn btn-primary login-button me-3">Back home</button></a>
                <button type="submit" name="action" value="Login" class="btn btn-primary login-button">Submit</button>
            </form>          
        </div>
    </body>
</html>

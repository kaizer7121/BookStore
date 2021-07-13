<%-- 
    Document   : admin
    Created on : Jun 22, 2021, 12:06:30 AM
    Author     : Kaizer
--%>

<%@page import="java.util.List"%>
<%@page import="assignment.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="Style/admin.css" />

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
        <div class="containter admin-container">
            <form action="MainController">
                <button type="submit" name="action" value="Logout" class="btn btn-danger mt-4 admin-button-logout me-3">Logout</button>
            </form>
            <h1 class="admin-header mt-3">Hello admin: <%= loginUser.getFullName()%></h1>
            <%
                String search = (String) request.getParameter("search");
                if (search == null) {
                    search = "";
                }
            %>
            <form action="MainController">
                <div class="mb-3 mt-2 admin-search-form">
                    <label class="form-label h4">Search:</label>
                    <input type="text" name="search" value="<%=search%>" class="form-control" placeholder="Search user ID"/>
                    <button type="submit" name="action" value="Search" class="btn btn-primary admin-search-form-button mt-3">Search</button>
                </div>
            </form>

            <%
                String errorMessage = (String) request.getAttribute("ERROR_MESSAGE");
                if (errorMessage == null) {
                    errorMessage = "";
                }
            %>
            <h1><%=errorMessage%></h1>
            <%            List<UserDTO> list = (List<UserDTO>) request.getAttribute("LIST_USER");
                if (list != null) {
                    if (!list.isEmpty()) {
                        int count = 1;
            %>

            <table class="table admin-table ">
                <thead>
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">UserID</th>
                        <th scope="col">FullName</th>
                        <th scope="col">RoleID</th>
                        <th scope="col">Password</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Address</th>
                        <th scope="col">Email</th>
                        <th scope="col">Status</th>
                        <th scope="col">Change Status</th>
                        <th scope="col">Update</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (UserDTO user : list) {
                    %>
                    <tr scope="row" class="align-middle">
                        <td><%= count++%></td>
                        <td><%= user.getUserID()%></td>
                        <td><%= user.getFullName()%></td>
                        <td><%= user.getRoleID()%></td>
                        <td><%= user.getPassword()%></td>
                        <td><%= user.getPhoneNumber()%></td>
                        <td><%= user.getAddress()%></td>
                        <td><%= user.getEmail()%></td>
                        <td><%= user.getStatus()%></td>
                        <td>
                            <% if (user.getUserID().equals(loginUser.getUserID())) {
                            %>
                            Can't change
                            <%} else if (user.getStatus().equals("Active")) {%>
                            <a href="MainController?userID=<%=user.getUserID()%>&action=ChangeStatus&type=Deactivate&search=<%= search%>">Deactivate</a>
                            <% } else {%>
                            <a href="MainController?userID=<%=user.getUserID()%>&action=ChangeStatus&type=Activate&search=<%= search%>">Activate</a>
                            <% }%>
                        </td>
                        <td>
                            <form action="MainController" method="POST">
                                <input type="hidden" name="userID" value="<%=user.getUserID()%>" />
                                <input type="hidden" name="fullName" value="<%=user.getFullName()%>" />
                                <input type="hidden" name="roleID" value="<%=user.getRoleID()%>" />
                                <input type="hidden" name="phoneNumber" value="<%=user.getPhoneNumber()%>" />
                                <input type="hidden" name="address" value="<%=user.getAddress()%>" />
                                <input type="hidden" name="email" value="<%=user.getEmail()%>" />
                                <input type="hidden" name="status" value="<%=user.getStatus()%>" />
                                <input type="hidden" name="search" value="<%=search%>" />
                                <button type="submit" name="action" value="Update" class="btn btn-info">Update</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
            <%
                    }
                }
            %>
        </div>
    </body>
</html>

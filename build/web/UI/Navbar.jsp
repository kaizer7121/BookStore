<nav class="navbar navbar-expand-lg navbar-dark bg-primary pe-5 ps-5">
    <div class="container-fluid">
        <a class="navbar-brand home-brand" href="user.jsp">Book store</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">                           
                <li class="nav-item">
                    <form class="d-flex ms-3" action="MainController">
                        <input type="text" name="searchBookName" value="${param.search}" class="form-control ms-3 me-2 home-search-book" placeholder="Search" />
                        <button type="submit" name="action" value="Search book" class="btn btn-outline-light">Search</button>
                    </form>
                </li>  
            </ul>

            <c:if test="${sessionScope.LOGIN_USER != null}">
                <a href="cart.jsp" class="nav-link h5 text-light mt-1">Your cart</a>
                <div class="dropdown">
                    <button class="btn dropdown-toggle text-light" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        <span class="h5">${sessionScope.LOGIN_USER.fullName}</span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a href="profile.jsp" class="text-dark nav-link h6">View profile</a></li>                                   
                        <li>
                        <c:url var="viewListUserOrders" value="MainController">
                            <c:param name="action" value="ViewListOrders"/>
                        </c:url>
                        <a href="${viewListUserOrders}" class="text-dark nav-link h6">View your orders</a>
                        </li>
                        <li>
                        <c:url var="logout" value="MainController">
                            <c:param name="action" value="Logout"/>
                        </c:url>
                        <a href="${logout}" class="text-dark nav-link h6">Sign out</a>
                        </li>
                    </ul>
                </div>
            </c:if>
            <c:if test="${sessionScope.LOGIN_USER == null}">                           
                <a href="login.jsp" class="text-light nav-link h5">Sign in</a>
                <a href="register.jsp" class="text-light nav-link h5">Register</a>
            </c:if>
        </div>
    </div>
</nav> 

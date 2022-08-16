<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        /*.container-fluid {*/
        /*    max-width: 1920px;*/
        /*}*/
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <ul class="navbar-nav container-fluid d-flex">
            <li class="nav-item">
                <a class="nav-link" href="/product-form/list_to_edit">Admin admission</a>
            </li>
            <li class="nav-item me-auto">
                <a class="nav-link" href="/cart">koszyk <span class="badge bg-primary rounded-pill">${itemsCount}</span></a>
            </li>
            <li class="nav-item">
                <a class="btn btn-success me-2" href="/login">Zaloguj się</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-warning" href="/create-user">Zarejestruj się</a>
            </li>
        </ul>
    </nav>

    <div class="container-fluid d-flex flex-wrap">
        <c:forEach items="${products}" var="product">
            <div class="p-2 col-3">
                <div class="card p-3" id="${product.id}">
<%--                    MIEJSCE NA ZDJECIE              --%>
<%--                    <img class="card-img-top" src="C:\Users\Andrzej\Desktop\kurs\end_project\src\main\fotos\cytryna.jpg" alt="${product.name}">--%>
<%--                    /MIEJSCE NA ZDJECIE              --%>
                    <div class="card-body">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="card-text">${product.description}</p>
<%--                        <a class="nav-link" href="${product.smallFotoLink}">${product.name}</a> &lt;%&ndash;to jest nowe&ndash;%&gt;--%>
                        <p class="card-text">Small foto link: ${product.smallFotoLink}</p>
<%--                        <img src="C:\Users\Andrzej\Desktop\kurs\end_project\src\main\fotos\cytryna.jpg"> &lt;%&ndash;to jest nowe&ndash;%&gt;--%>
                        <p class="card-text">Fotos link: ${product.fotosLink}</p>
                        <p class="card-text">Delivery period: ${product.deliveryPeriod}</p>
                        <p class="card-text">Price: ${product.price}</p>
                        <form action="${pageContext.request.contextPath}/add_to_cart" method="post">
                            <input type="hidden" name="id" value="${product.id}">
                            <div class="d-flex justify-space-between">
                                <input class="form-control me-3" type="number" name="quantity" placeholder="quantity of product" value="1">
                                <button class="btn btn-primary" style="white-space: nowrap;" type="submit">Add to cart</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
        </table>
    </div>
</body>
</html>
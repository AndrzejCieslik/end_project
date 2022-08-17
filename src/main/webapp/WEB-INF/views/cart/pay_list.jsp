<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        td {
            vertical-align: middle;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <ul class="navbar-nav container-fluid d-flex justify-content-start">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/product-form/list"/>">Back Home to search another products</a>
            </li>
            <%--<li class="nav-item">
                <a class="nav-link" href="/cart">Koszyk${itemsCount}</a>
            </li>--%>
        </ul>
    </nav>

    <div class="container-fluid">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>name</th>
                <th>description</th>
                <th>delivery time</th>
                <th>price</th>
                <th>quantity to edit</th>
                <th></th>
            </tr>
            </thead>

            <tbody>
            <c:set var="flag" value="true"/>
            <c:forEach items="${cart}" var="cartitem">
                <tr>
                        <%-- <td hidden>${.id}</td>--%>
                    <td>${cartitem.getProduct().getName()}</td>
                    <td>${cartitem.getProduct().getDescription()}</td>
                    <td>${cartitem.getProduct().getDeliveryPeriod()}</td>
                    <td>${cartitem.getProduct().getPrice()}</td>
                    <td>
                        <form class="m-0" action="${pageContext.request.contextPath}/edit_cart" method="post">
                            <input type="hidden" name="id" value="${cartitem.getProduct().getId()}">

                            <div class="d-flex">
                                <input class="form-control me-3" type="number" name="quantity" placeholder="quantity of product" value="${cartitem.getQuantity()}">
                                <button class="btn btn-primary" type="submit">submit</button>
                            </div>


                            <c:if test="${cartitem.getQuantity() > cartitem.getProduct().getQuantity()}">
                                <p class="error ms-3">Order to big. Max allowed order quantity totals "${cartitem.getProduct().getQuantity()}"</p>
                                <c:set var="flag" value="false"/>
                            </c:if>

                        </form>
                    </td>
                    <td style="vertical-align: baseline;">
                        <form class="m-0" action="${pageContext.request.contextPath}/delete_position_in_cart" method="post">
                            <input type="hidden" name="id" value="${cartitem.getProduct().getId()}">
                            <button class="btn btn-danger" type="submit">Delete position</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <c:if test="${flag}">
            <a class="btn btn-success" href="/save_cart">Buy</a>
        </c:if>

    </div>
</body>
</html>

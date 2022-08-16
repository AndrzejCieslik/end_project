<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Admin panel - edit list</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/product-form/list">Home - users</a>
            </li>
            <li class="nav-item">
                    <a class="nav-link" href="/order-form/search">Admin - orders search</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product-form/add">Admin - product add</a>
            </li>
        </ul>
    </nav>

    <div class="container-fluid">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>name</th>
                <th>description</th>
                <th>smallFotoLink</th>
                <th>fotosLink</th>
                <th>deliveryPeriod</th>
                <th>price</th>
                <th>quantity</th>
                <th>active</th>
                <th></th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td hidden>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.description}</td>
                    <td>${product.smallFotoLink}</td>
                    <td>${product.fotosLink}</td>
                    <td>${product.deliveryPeriod}</td>
                    <td>${product.price}</td>
                    <td>${product.quantity}</td>
                    <td>${product.active}</td>
                    <td>
                        <div class="d-flex flex-column">
                            <a class="btn btn-danger" href="<c:url value="/product-form/change-visibility/${product.id}"/>">${product.active ? "Deactivate" : "Activate"}</a></br>
                            <a class="btn btn-dark" href="<c:url value="/product-form/edit/${product.id}"/>">Update</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
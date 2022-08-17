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
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .error {
            color: red;
        }
    </style>
</head>

<div class="container">
    <div class="card mt-3 p-3">
        <h1>Zaloguj się</h1>
        <form action="/login" method="post">
            <div class="mb-3">
                <label class="form-label" for="username"> User Name:</label>
                <input class="form-control" id="username" type="text" name="username"/>
            </div>

            <div class="mb-3">
                <label class="form-label" for="password"> Password:</label>
                <input class="form-control" id="password" type="password" name="password"/>
            </div>

            <c:if test = "${error}">
                <p class="error">Nieprawidłowy login lub hasło<p>
            </c:if>

            <div class="mb-3">
                <button class="btn btn-primary" type="submit" value="Sign In">Sign in</button>
            </div>

            <div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </div>
        </form>
    </div>
</div>




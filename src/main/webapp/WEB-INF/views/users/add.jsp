<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="card mt-3 p-3">
            <h1>Zarejestruj się</h1>
            <form:form modelAttribute="user" method="post">
                <div class="mb-3">
                    <label class="form-label" for="username">User Name:</label>
                    <form:input path="username" placeholder="Set Your username" cssClass="form-control"/>
                    <form:errors path="username" cssClass="error"/>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="password">Password:</label>
                    <form:input path="password" placeholder="Set Your password" cssClass="form-control"/>
                    <form:errors path="password" cssClass="error"/>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="firstName">First Name:</label>
                    <form:input path="firstName" placeholder="Enter Your first name" cssClass="form-control"/>
                    <form:errors path="firstName" cssClass="error"/>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="lastName">Last Name:</label>
                    <form:input path="lastName" placeholder="Enter Your last name" cssClass="form-control"/>
                    <form:errors path="lastName" cssClass="error"/>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="city">City:</label>
                    <form:input path="city" placeholder="Enter Your city name" cssClass="form-control"/>
                    <form:errors path="city" cssClass="error"/>
                </div>

                <div class="mb-3 row">
                    <div class="col-4">
                        <label class="form-label" for="street">Street:</label>
                        <form:input path="street" placeholder="Street name" cssClass="form-control"/>
                    </div>
                    <div class="col-4">
                        <label class="form-label" for="number">Number:</label>
                        <form:input path="number" placeholder="Street number" cssClass="form-control"/>
                    </div>
                    <div class="col-4">
                        <label class="form-label" for="postcode">Post code:</label>
                        <form:input path="postcode" placeholder="City postcode" cssClass="form-control"/>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="email">E-mail:</label>
                    <form:input path="email" placeholder="email" cssClass="form-control"/>
                    <form:errors path="email" cssClass="error"/>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="deliveryAddress">Delivery address:</label>
                    <form:input path="deliveryAddress" placeholder="deliveryAddress" cssClass="form-control"/>
                    <form:errors path="deliveryAddress" cssClass="error"/>
                </div>

                <button class="btn btn-primary" type="submit">Submit register</button>
            </form:form>
        </div>
    </div>




<%--@elvariable id="user" type="andrzej.cieslik.ac.end_project.user.User"--%>
<%--<form:form modelAttribute="user" method="post">--%>
<%--    <div class="container">--%>
<%--        <form:input path="username" placeholder="username"/>--%>
<%--        <form:errors path="username" cssStyle="color: blueviolet;"/>--%>
<%--        <&lt;%&ndash;c:if test="${error == 1}">--%>
<%--            <h5>this username is occupied, choose another one "</h5>--%>
<%--        </c:if>&ndash;%&gt;--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <form:input path="password" placeholder="password"/>--%>
<%--        <form:errors path="password" cssStyle="color: blueviolet;"/>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <form:input path="firstName" placeholder="firstName"/>--%>
<%--        <form:errors path="firstName" cssStyle="color: blueviolet;"/>--%>
<%--    </div>--%>

<%--    <div>--%>
<%--        <form:input path="lastName" placeholder="lastName"/>--%>
<%--        <form:errors path="lastName" cssStyle="color: blueviolet;"/>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <form:input path="city" placeholder="city"/>--%>
<%--        <form:errors path="city" cssStyle="color: blueviolet;"/>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <form:input path="street" placeholder="street"/>--%>
<%--        <form:input path="number" placeholder="number"/>--%>
<%--        <form:input path="postcode" placeholder="postcode"/>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <form:input path="email" placeholder="email"/>--%>
<%--        <form:errors path="email" cssStyle="color: blueviolet;"/>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <form:input path="deliveryAddress" placeholder="deliveryAddress"/>--%>
<%--        <form:errors path="deliveryAddress" cssStyle="color: blueviolet;"/>--%>
<%--    </div>--%>

<%--    <input type="submit"/>--%>
<%--</form:form>--%>
</body>
</html>
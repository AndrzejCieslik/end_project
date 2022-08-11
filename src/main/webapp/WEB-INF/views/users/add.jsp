<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<%--@elvariable id="user" type="andrzej.cieslik.ac.end_project.user.User"--%>
<form:form modelAttribute="user" method="post">
    <div class="container">
        <form:input path="username" placeholder="username"/>
        <form:errors path="username" cssStyle="color: blueviolet;"/>
    </div>
    <div>
        <form:input path="password" placeholder="password"/>
        <form:errors path="password" cssStyle="color: blueviolet;"/>
    </div>
    <div>
        <form:input path="firstName" placeholder="firstName"/>
        <form:errors path="firstName" cssStyle="color: blueviolet;"/>
    </div>

    <div>
        <form:input path="lastName" placeholder="lastName"/>
        <form:errors path="lastName" cssStyle="color: blueviolet;"/>
    </div>
    <div>
        <form:input path="city" placeholder="city"/>
        <form:errors path="city" cssStyle="color: blueviolet;"/>
    </div>
    <div>
        <form:input path="street" placeholder="street"/>
        <form:input path="number" placeholder="number"/>
        <form:input path="postcode" placeholder="postcode"/>
    </div>
    <div>
        <form:input path="email" placeholder="email"/>
        <form:errors path="email" cssStyle="color: blueviolet;"/>
    </div>
    <div>
        <form:input path="deliveryAddress" placeholder="deliveryAddress"/>
        <form:errors path="deliveryAddress" cssStyle="color: blueviolet;"/>
    </div>

    <input type="submit"/>
</form:form>
</body>
</html>
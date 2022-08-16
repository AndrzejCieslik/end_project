<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <div class="card mt-3 p-3">
            <h1 class="mb-3">Update book</h1>
            <form:form modelAttribute="products" cssClass="some-class" action="/product-form/update">
                <form:hidden path="id"/>
                <div class="mb-3">
                    <label class="form-label" for="name">Name:</label>
                    <form:input path="name" cssClass="form-control"/>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="description">Description:</label>
                    <form:input path="description" cssClass="form-control"/>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="smallFotoLink">Small foto link:</label>
                    <form:input path="smallFotoLink" cssClass="form-control"/>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="fotosLink">Fotos link:</label>
                    <form:input path="fotosLink" cssClass="form-control"/>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="deliveryPeriod">Delivery period:</label>
                    <form:input path="deliveryPeriod" cssClass="form-control"/>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="price">Price:</label>
                    <form:input path="price" cssClass="form-control"/>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="quantity">Quantity:</label>
                    <form:input path="quantity" cssClass="form-control"/>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="active">Active:</label>
                    <form:input path="active" cssClass="form-control"/>
                </div>

                <button class="btn btn-primary" type="submit">Prześlij</button>
            </form:form>
        </div>
    </div>
    <%--@elvariable id="products" type="andrzej.cieslik.ac.end_project.model.Product"--%>
</body>
</html>

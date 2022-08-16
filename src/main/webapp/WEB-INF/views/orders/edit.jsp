<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <h3>Update book rwar</h3>
    <%--@elvariable id="orders" type="andrzej.cieslik.ac.end_project.model.Order"--%>
    <form:form modelAttribute="orders" cssClass="some-class" action="/author-form/update">
        <form:input path="client"/>
        <form:input path="orderState"/>
        <input type="submit"/>
    </form:form>
</body>
</html>

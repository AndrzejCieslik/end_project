<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../common/header.jsp"%>
<%--@elvariable id="products" type="andrzej.cieslik.ac.end_project.model.Product"--%>
<form:form modelAttribute="products" cssClass="some-class">
    <form:input path="name" placeholder="name"/>
    <form:input path="description" placeholder="description"/>
    <form:input path="smallFotoLink" placeholder="smallFotoLink"/>
    <form:input path="fotosLink" placeholder="fotosLink"/>
    <form:input path="deliveryPeriod" placeholder="deliveryPeriod"/>
    <form:input path="price" placeholder="price"/>

    <form:input path="quantity"/>
    <input type="submit"/>
</form:form>
</body>
</html>
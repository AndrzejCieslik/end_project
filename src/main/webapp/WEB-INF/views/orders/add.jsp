<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--@elvariable id="orders" type="pl.coderslab.author.Author"--%>
<form:form modelAttribute="orders" cssClass="some-class">
    <form:input path="name"/> <%--// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! nem jest z Clienta--%>
    <form:input path="orderstate"/>

    <input type="submit"/>
</form:form>
</body>
</html>
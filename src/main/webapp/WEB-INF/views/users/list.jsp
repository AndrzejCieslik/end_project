<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="<c:url value="/user-form/list"/>">home</a>
<table>
    <tr>
        <th>id</th>
        <th>username</th>
        <th>firstName</th>
        <th>lastName</th>
        <th>city</th>
        <th>street</th>
        <th>number</th>
        <th>postcode</th>
        <th>email</th>
        <th>deliveryAddress</th>

    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.city}</td>
            <td>${user.street}</td>
            <td>${user.number}</td>
            <td>${user.postcode}</td>
            <td>${user.email}</td>
            <td>${user.deliveryAddress}</td>
            <td>
                <a href="<c:url value="/client-form/delete/${user.id}"/>">delete</a></br>
                <a href="<c:url value="/client-form/edit/${user.id}"/>">update</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
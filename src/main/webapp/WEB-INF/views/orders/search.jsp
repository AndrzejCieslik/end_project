<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Andrzej
  Date: 16.08.2022
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order search</title>
</head>
<body>
<form method="post" action="/order-form/search">
    <label>
        Order No.
        <input type="number" name="orderId">
    </label>
    <label>
        First name
        <input type="text" name="firstName">
    </label>
    <label>
        Last name
        <input type="text" name="lastName">
    </label>
    <button type="submit" name="search">Search</button>
</form>
<c:if test="${notFound}">
    <h2>Order with given number not found</h2>
</c:if>
<c:if test="${orders != null && orders.size() > 0}">
    <ul>
        <c:forEach items="${orders}" var="order">
            <li>
                <a href="/order-form/order/${order.id}">
                    No. ${order.id} - ${order.user.firstName} ${order.user.lastName} - ${order.orderState}
                </a>
            </li>
        </c:forEach>
    </ul>
</c:if>
<c:if test="${orders != null && orders.size() == 0}">
    <h2>No matches found</h2>
</c:if>
</body>
</html>

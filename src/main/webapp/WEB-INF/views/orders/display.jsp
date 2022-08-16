<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Andrzej
  Date: 16.08.2022
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order</title>
</head>
<body>
<div>
    <span>Order No. ${order.id}</span>
    <span>${order.user.firstName} ${order.user.lastName}</span>
    <span>State: ${order.orderState}</span>
</div>
<table>
    <tr>
        <th>Name</th>
        <th>Qty</th>
        <th>Price</th>
    </tr>
    <c:forEach items="${orderItems}" var="orderItem">
        <tr>
            <td>${orderItem.product.name}</td>
            <td>${orderItem.quantity}</td>
            <td>${orderItem.price}</td>
        </tr>
    </c:forEach>
</table>
<span>Price total: ${total}</span>
<c:if test="${isAdmin}">
    <form action="/order-form/change_order_status">
        <input type="hidden" name="id" value="${order.id}">
        <h6>change of order status </h6>
        <select name="state">
            <option value="WAITING_FOR_PAYMENT">WAITING_FOR_PAYMENT</option>
            <option value="PAYED">PAYED</option>
            <option value="DELIVERED">DELIVERED</option>
            <option value="CANCELED">CANCELED</option>
        </select>
        <button type="submit">submit</button>
    </form>
    <a href="/order-form/search">Back to search</a>
</c:if>
</body>
</html>

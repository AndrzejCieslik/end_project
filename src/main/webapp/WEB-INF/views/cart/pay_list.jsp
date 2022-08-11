<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="<c:url value="/product-form/list"/>">home</a>
<a href="/cart">koszyk${itemsCount}</a>
<table>
    <tr>
        <th>name</th>
        <th>description</th>
        <th>delivery time</th>
        <th>price</th>
        <th>quantity to edit</th>
    </tr>
    <c:forEach items="${cart}" var="cartitem">
        <tr>
           <%-- <td hidden>${.id}</td>--%>
            <td>${cartitem.getProduct().getName()}</td>
            <td>${cartitem.getProduct().getDescription()}</td>
            <td>${cartitem.getProduct().getDeliveryPeriod()}</td>
            <td>${cartitem.getProduct().getPrice()}</td>
            <td>
                <form action="${pageContext.request.contextPath}/edit_cart" method="post">
                    <input type="hidden" name="id" value="${cartitem.getProduct().getId()}">
                    <label>
                        <input type="number" name="quantity" placeholder="quantity of product" value="${cartitem.getQuantity()}">
                    </label>
                    <label>
                        <button type="submit">submit</button>
                    </label>
                </form>
            </td>
            <td>
                <form action="${pageContext.request.contextPath}/delete_position_in_cart" method="post">
                    <input type="hidden" name="id" value="${cartitem.getProduct().getId()}">
                    <button type="submit">Delete position</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="/save_cart">przejdź do zakupu</a>
</body>
</html>

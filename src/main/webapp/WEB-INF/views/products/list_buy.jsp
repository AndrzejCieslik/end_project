<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="<c:url value="/home-form/"/>">home</a>
<a href="/cart">koszyk${itemsCount}</a>
<a href="/login">zaloguj się</a>
<a href="/create-user">zarejetruj się</a>
<table>
    <tr>
        <th>name</th>
        <th>description</th>
        <th>smallFotoLink</th>
        <th>fotosLink</th>
        <th>deliveryPeriod</th>
        <th>price</th>
        <th>quantity</th>
    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td hidden>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.description}</td>
            <td>${product.smallFotoLink}</td>
            <td>${product.fotosLink}</td>
            <td>${product.deliveryPeriod}</td>
            <td>${product.price}</td>
            <td>
                <form action="${pageContext.request.contextPath}/add_to_cart" method="post">
                    <input type="hidden" name="id" value="${product.id}">
                    <label>
                        <input type="number" name="quantity" placeholder="quantity of product" value="1">
                    </label>
                    <button type="submit">submit</button>
                </form>
            </td>

            <td>
                <a href="<c:url value="/product-form/add_to_cart/${product.id}/{quantity}"/>">add to cart</a></br>
            </td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
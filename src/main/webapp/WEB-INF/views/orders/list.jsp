<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="<c:url value="/home-form/"/>">home</a>
<form action="${pageContext.request.contextPath}/order-form/list" method="post">
    <h5>choose selecting parameter about user and orderState to get the order to update the state</h5>

    <select name="orderState">
        <option value="WAITING_FOR_PAYMENT">WAITING_FOR_PAYMENT</option>
        <option value="PAYED">PAYED</option>
        <option value="DELIVERED">DELIVERED</option>
        <option value="CANCELED">CANCELED</option>
    </select>
    <input name="firstName" type="text" placeholder="firstName">
    <input name="lastName" type="text" placeholder="lastName">
    <input name="city" type="text" placeholder="city">
    <button type="submit">submit</button>
</form>

<form action="${pageContext.request.contextPath}/order-form/list-date" method="post">
    <h5>chose orderdate (before/on day/after) and order state to get the orders </h5>
    <input name="formDate" type="text" placeholder="YYYY-MM-DD">
    <h5>what date is it ?</h5>
    <select>
        <option value="orderDate">orderDate</option>
        <option value="paymentDate">paymentDate</option>
        <option value="deliveryDate">deliveryDate</option>
        <option>value="deliveryDate">deliveryDate</option>
    </select>
    <select name="info">
        <option value="before">before</option>
        <option value="onDay">on day</option>
        <option value="after">after</option>
    </select>
    <h5>what is the select state</h5>
    <select name="orderState">
        <option value="WAITING_FOR_PAYMENT">WAITING_FOR_PAYMENT</option>
        <option value="PAYED">PAYED</option>
        <option value="DELIVERED">DELIVERED</option>
        <option value="CANCELED">CANCELED</option>
    </select>
    <button type="submit">submit</button>
</form>

<ul>
    <c:forEach items="${orders}" var="order">
        <li>
            <div>
                <h6>user first name    user last name</h6>
                <h6>${order.key.getFirstName()} ${order.key.getLastName()}</h6>
            </div>

            <table>
                <tr>
                    <th>order id</th>
                    <th>state</th>
                    <th>change state</th>
                </tr>
                <c:forEach items="${order.value}" var="o">
                <tr>
                   <td>${o.getId()}</td>
                    <td>${o.orderState}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/order-form/change_order_status">
                            <input type="hidden" name="id" value="${o.getId()}">
                           <h6>change of order status </h6>
                            <select name="state">
                               <%-- <option value="WAITING_FOR_PAYMENT">WAITING_FOR_PAYMENT</option>--%>
                                <option value="PAYED">PAYED</option>
                                <option value="DELIVERED">DELIVERED</option>
                                <option value="CANCELED">CANCELED</option>
                            </select>
                            <button type="submit">submit</button>
                        </form>
                        <form action="${pageContext.request.contextPath}/order-form/list-product-of orders">
                            <input type="hidden" name="id" value="${o.getId()}">
                            <h6>display order product list</h6>
                            <select name="type_of_list">
                                    <%-- <option value="WAITING_FOR_PAYMENT">WAITING_FOR_PAYMENT</option>--%>
                                <option value="productName">only product names and sum Value</option>
                                <option value="productNameAndQuantityAndProductId">productName productQuantity productId</option>
                            </select>
                            <button type="submit">submit</button>
                        </form>

                    </td>
                </tr>
                </c:forEach>

            </table>
        </li>

    </c:forEach>
</ul>

</body>
</html>
<%--
<td>${o.orderState}</td>--%>


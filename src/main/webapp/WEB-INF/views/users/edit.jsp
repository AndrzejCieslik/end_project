<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>Update client</h4>
<a href="/user-form/list">users - list</a>
<%--@elvariable id="users" type="andrzej.cieslik.ac.end_project.user.User"--%>
<form:form modelAttribute="users" cssClass="some-class" action="/user-form/update">
    <table>
    <tr>
        <th>         </th>
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
    <tr>
       <td><form:hidden path="id"/></td>
        <td>
            <form:input path="username"/>
            <form:errors path="username" cssClass="error"/>
        </td>

        <td>
            <form:input path="firstName"/>
            <form:errors path="firstName" cssClass="error"/>
        </td>
        <td>
            <form:input path="lastName"/>
            <form:errors path="lastName" cssClass="error"/>
        </td>
        <td>
            <form:input path="city"/>
            <form:errors path="city" cssClass="error"/>
        </td>
        <td>
            <form:input path="street"/>
            <form:errors path="street" cssClass="error"/>
        </td>
        <td>
            <form:input path="number"/>
            <form:errors path="number" cssClass="error"/>
        </td>
        <td>
            <form:input path="postcode"/>
            <form:errors path="postcode" cssClass="error"/>
        </td>
        <td>
            <form:input path="email"/>
            <form:errors path="email" cssClass="error"/>
        </td>
        <td>
            <form:input path="deliveryAddress"/>
            <form:errors path="deliveryAddress" cssClass="error"/>
        </td>
    </tr>
    </table>
    <button type="submit">submit</button>
</form:form>

</body>
</html>

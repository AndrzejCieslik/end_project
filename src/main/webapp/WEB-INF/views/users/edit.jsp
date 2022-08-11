<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>Update client</h4>
<%--@elvariable id="users" type="andrzej.cieslik.ac.end_project.user.User"--%>
<form:form modelAttribute="users" cssClass="some-class" action="/user-form/update">
    <table>
    <tr>
        <th>firstName</th>
        <th>lastName</th>
        <th>city</th>
        <th>street</th>
        <th>number</th>
        <th>postcode</th>
        <th>deliveryAddress</th>
    </tr>
    <tr>
       <td><form:hidden path="id"/></td>
        <td><form:input path="firstName"/></td>
        <td><form:input path="lastName"/></td>
        <td><form:input path="city"/></td>
        <td><form:input path="deliveryAddress"/></td>
        <td><form:input path="street"/></td>
        <td><form:input path="number"/></td>
        <td><form:input path="postcode"/></td>
    </tr>
    </table>
    <button type="submit">submit</button>
</form:form>

</body>
</html>

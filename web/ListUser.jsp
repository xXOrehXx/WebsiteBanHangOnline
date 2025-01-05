<%-- 
    Document   : ListUser
    Created on : Feb 2, 2024, 2:43:23 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Of Users</title>
    </head>
    <body>
        <a href="controlProduct">List of Products</a><br>
        <table border="1">
            <tr>
                <td>Account</td>
                <td>Password</td>
                <td>Name</td>
                <td>Gender</td>
                <td>Address</td>
                <td>Phone</td>
                <td>Date Of Birth</td>
                <td>Group</td>
            </tr>
            <c:forEach items="${data}" var="u">
                <tr>
                    <td>${u.getAccount()}</td>
                    <td>${u.getPassword()}</td>
                    <td>${u.getName()}</td>
                    <td>${u.getGender()}</td>
                    <td>${u.getAddress()}</td>
                    <td>${u.getPhone()}</td>
                    <td>${u.getDateofbirth()}</td>
                    <td>${u.getGroup()}</td>
                    <td><a href="controlUser?mod=1&acc=${u.getAccount()}">delete</a></td>
                </tr>
            </c:forEach>
        </table>
        <%@include file="AddUser.jsp" %>
    </body>
</html>

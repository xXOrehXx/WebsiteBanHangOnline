<%-- 
    Document   : ListUser
    Created on : Feb 2, 2024, 2:43:23 PM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Of Products</title>
    </head>
    <body>
        <form action="controlProduct" method="get">
            Name:<input type="text" name="name">
            <input type="submit" name="search" value="SEARCH">
        </form>        
        <table border="1">
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Price</td>
                <td>Image</td>
                <td>Description</td>
                <td>Category</td>
            </tr>
            <c:forEach items="${data}" var="p">
                <tr>
                    <td><a href="controlProduct?mod=2&id=${p.getId()}">${p.getId()}</a></td>
                    <td><a href="product?mod=${p.getId()}">${p.getName()}</a></td>
                    <td>${p.getPrice()}</td>
                    <td>${p.getImage()}</td>
                    <td>${p.getDescription()}</td>
                    <td>${p.getCategory()}</td>
                    <td style="border: white"><a href="controlProduct?mod=1&id=${p.getId()}">delete</a></td>
                </tr>
            </c:forEach>
        </table>
        <%@include file="AddProduct.jsp" %>
    </body>
</html>

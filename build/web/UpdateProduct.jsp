<%-- 
    Document   : AddProduct
    Created on : Feb 28, 2024, 4:35:26 PM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="controlProduct" method="post" enctype='multipart/form-data'>
            <table>
                <tr>
                    <td>ID:</td>
                    <td><input type="text" name="id" value="${p.getId()}"></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" value="${p.getName()}"></td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td><input type="text" name="price" value="${p.getPrice()}"></td>
                </tr>
                <tr>
                    <td>Image:</td>
                    <td>
                        <div class="change-avatar" id="ImageFileUpload">
                            <div class="selected-image-holder">
                                <img id="userAvatar" src="${p.getImage}" alt="User Image" style="height: 100px; width: 100px; margin-right: 15px">
                            </div>
                            <div class="upload-img">
                                <div class="change-photo-btn">
                                    <input type="file" name="image" class="upload" id="avatarInput">
                                </div>
                                <small class="form-text text-muted">Allowed PNG, JPG. Max size of 2MB</small>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td><input type="text" name="image" value="${p.getDescription()}"></td>
                </tr>
                <tr>
                    <td>Category:</td>
                    <td>
                        <select name="category">
                            <c:forEach items="${data}" var="c">
                                <c:choose>
                                    <c:when test="${c.getId()==p.getCategory()}">
                                        <option value="${c.getId()}" selected="">${c.getName()}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${c.getId()}">${c.getName()}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="submit" name="update" value="UPDATE"><br>
            ${message}
        </form>
    </body>
</html>

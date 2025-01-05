<%-- 
    Document   : AddProduct
    Created on : Feb 28, 2024, 4:35:26 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="controlUser" method="get">
            <table>
                <tr>
                    <td>Account:</td>
                    <td>
                        <input type="text" name="account">
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <input type="password" name="password">
                    </td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td>
                        <input type="text" name="name">
                    </td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>
                        <input type="radio" name="gender" value="1" checked="checked"> Male
                        <input type="radio" name="gender" value="0"> Female
                    </td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td>
                        <input type="text" name="address">
                    </td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td>
                        <input type="text" name="phone">
                    </td>
                </tr>
                <tr>
                    <td>Date Of Birth:</td>
                    <td>
                        <input type="date" name="dob">
                    </td>
                </tr>
                <tr>
                    <td>Group:</td>
                    <td>
                        <input type="text" name="group">
                    </td>
                </tr>
            </table>
            <input type="submit" name="add" value="ADD"><br>
        </form>
    </body>
</html>

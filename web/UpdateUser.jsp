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
        <title>User </title>
    </head>
    <body>
        <form action="controlUser" method="get">
            <table>
                <tr>
                    <td>Account:</td>
                    <td><input type="text" name="account" value="${p.getAccount()}"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="password" value="${p.getPassword()}"></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" value="${p.getName()}"></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <input type="radio" name="gender" value="1" ${male}> male
                        <input type="radio" name="gender" value="0" ${female}> female
                    </td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" value="${p.getAddress()}"></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><input type="text" name="phone" value="${p.getPhone()}"></td>
                </tr>
                <tr>
                    <td>Date of birth:</td>
                    <td><input type="date" name="dob" value="${p.getDateofbirth()}"></td>
                </tr>
                <tr>
                    <td>Group</td>
                    <td><input type="text" name="group" value="${p.getGroup()}"></td>
                </tr>
            </table>
                <input type="hidden" name="acc" value="${acc}">
            <input type="submit" name="update" value="UPDATE"><br>
        </form>
    </body>
</html>

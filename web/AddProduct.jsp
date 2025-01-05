<%-- 
    Document   : AddProduct
    Created on : Feb 28, 2024, 4:35:26 PM
    Author     : Admin
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="controlProduct" method="post"  enctype='multipart/form-data'>
            <table>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td><input type="text" name="price"></td>
                </tr>
                <tr>
                    <td>Image:</td>
                    <td>
                        <div class="change-avatar" id="ImageFileUpload">
                            <div class="selected-image-holder">
                                <img id="userAvatar" src="Image/placeholder.png" alt="User Image" style="height: 100px; width: 100px; margin-right: 15px">
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
                    <td><input type="text" name="description"></td>
                </tr>
                <tr>
                    <td>Category:</td>
                    <td>
                        <select name="category">
                            <c:forEach items="${data1}" var="c">
                                <option value="${c.getId()}">${c.getName()}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="submit" name="add" value="ADD"><br>
        </form>
    </body>
    <script>
        // Main Wrapper Selector
        const avatarFileUpload = document.getElementById('ImageFileUpload')
        // Preview Wrapper Selector
        const imageViewer = avatarFileUpload.querySelector('.selected-image-holder>img')
        // Image Input File Selector
        const imageInput = avatarFileUpload.querySelector('input[name="image"]')

        /** IF Selected Image has change */
        imageInput.addEventListener('change', e => {
            // Open File eader
            var reader = new FileReader();
            reader.onload = function () {
                // Preview Image
                imageViewer.src = reader.result;
            };
            // Read Selected Image as DataURL
            reader.readAsDataURL(e.target.files[0]);
        })
    </script>

    <script>
        document.getElementById('avatarInput').addEventListener('change', function (event) {
            const file = event.target.files[0];
            if (file) {
                // Ensure the file is a valid image type
                const validImageTypes = ['image/jpeg', 'image/png'];
                if (validImageTypes.includes(file.type) === false) {
                    alert('Please select a valid image file (PNG or JPG).');
                    location.reload(true);
                }
            }
        });
    </script>
    <script>
        document.querySelector('form').addEventListener('submit', function (event) {
            const imageInput = document.querySelector('input[name="image"]');

            // Check if image input is blank
            if (imageInput.files.length === 0) {
                alert('Please select an image.');
                event.preventDefault(); // Prevent form submission
            }
        });
    </script>
</html>
.
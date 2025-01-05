<%-- 
    Document   : SearchBar
    Created on : Mar 13, 2024, 10:20:57 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Thời trang nam</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
        <!-- MDB -->
        <link rel="stylesheet" href="css/mdb.min.css" />
        <!-- Custom styles -->
        <link rel="stylesheet" href="css/style.css" />
    </head>
    <body>
        <!--Main Navigation-->
        <header>
            <!-- Jumbotron -->
            <div class="p-3 text-center bg-white border-bottom">
                <div class="container">
                    <div class="row gy-3">
                        <!-- Left elements -->
                        <div class="col-lg-2 col-sm-4 col-4">
                            <a href="home" target="_self" class="float-start">
                                <img src="Image/Logo.png" height="35" />
                            </a>
                        </div>
                        <!-- Left elements -->

                        <!-- Center elements -->
                        <div class="order-lg-last col-lg-5 col-sm-8 col-8">
                            <div class="d-flex float-end">
                                <a href="User" class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center" target="_self"> <i class="fas fa-user-alt m-1 me-md-2"></i><p class="d-none d-md-block mb-0">${name}</p> </a>
                                <a href="cart" class="border rounded py-1 px-3 nav-link d-flex align-items-center" target="_self"> <i class="fas fa-shopping-cart m-1 me-md-2"></i><p class="d-none d-md-block mb-0">Giỏ hàng ${NoP}</p> </a>
                            </div>
                        </div>
                        <!-- Center elements -->

                        <!-- Right elements -->
                        <div class="col-lg-5 col-md-12 col-12">
                            <form action="product" method="get">
                                <div class="input-group float-center">
                                    <div class="form-outline">
                                        <input type="hidden" name="cat" value="${categoryid}">
                                        <input type="text" name="searchstring" id="form1" class="form-control" />
                                        <label class="form-label" for="form1">Tìm kiếm</label>
                                    </div>
                                    <button type="submit" name="search" value="search" class="btn btn-primary shadow-0">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                        <!-- Right elements -->
                    </div>
                </div>
            </div>
            <!-- Jumbotron -->
    </body>
</html>

<%-- 
    Document   : newjsp
    Created on : Mar 10, 2024, 5:55:24 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <%@include file="SearchBar.jsp" %>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white">
            <!-- Container wrapper -->
            <div class="container justify-content-center justify-content-md-between">
                <!-- Toggle button -->
                <button
                    class="navbar-toggler border py-2 text-dark"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarLeftAlignExample"
                    aria-controls="navbarLeftAlignExample"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Collapsible wrapper -->
                <div class="collapse navbar-collapse" id="navbarLeftAlignExample">
                    <!-- Left links -->
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link text-dark" aria-current="page" href="home">Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="product?cat=1">Áo sơ mi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="product?cat=2">Cà vạt</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="product?cat=3">Giày</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="product?cat=4">Suits</a>
                        </li>
                    </ul>
                    <!-- Left links -->
                </div>
            </div>
            <!-- Container wrapper -->
        </nav>
        <!-- Navbar -->
        <!-- Jumbotron -->
        <div class="bg-primary text-white py-5">
            <div class="container py-5">
                <h1>
                    <!--Lịch lãm & <br />
                    sang trọng-->
                </h1>
                <p>
                    Trang phục nam theo xu hướng, chất lượng cao
                </p>
            </div>
        </div>
        <!-- Jumbotron -->
    </header>
    <!-- Products -->
    <section>
        <div class="container my-5">
            <header class="mb-4">
                <h3>Sản phẩm mới</h3>
            </header>
            <form action="cart" method="post">
                <div class="row">
                    <c:forEach items="${data}" var="hp">
                        <div class="col-lg-3 col-md-6 col-sm-6 d-flex">
                            <div class="card w-100 my-2 shadow-2-strong">
                                <a href="product?mod=${hp.getId()}"><img src="${hp.getImage()}" class="card-img-top" style="aspect-ratio: 1 / 1" /></a>
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title" ${hp.getInCart()}>${hp.getName()}</h5>
                                    <p class="card-text">${hp.getPrice()}</p>
                                    <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
                                        <button class="btn btn-primary shadow-0 me-1" type="submit" name="addcart" value="${hp.getId()}">Thêm vào giỏ hàng</button>
                                        <a href="controlProduct?mod=1&id=${hp.getId()}&page=home">${delete}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </form>
        </div>
    </section>
    <!-- Products -->

    <!-- Footer -->
    <footer class="text-center text-lg-start text-muted mt-3" style="background-color: #f5f5f5;">
        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start pt-4 pb-4">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-12 col-lg-3 col-sm-12 mb-2">
                        <!-- Content -->
                        <a href="https://mdbootstrap.com/" target="_blank" class="">
                            <img src="https://mdbootstrap.com/img/logo/mdb-transaprent-noshadows.png" height="35" />
                        </a>
                        <p class="mt-2 text-dark">
                            © 2023 Copyright: MDBootstrap.com
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-6 col-sm-4 col-lg-2">
                        <!-- Links -->
                        <h6 class="text-uppercase text-dark fw-bold mb-2">
                            Cửa hàng
                        </h6>
                        <ul class="list-unstyled mb-4">
                            <li><a class="text-muted" href="#">Thông tin về chúng tôi</a></li>
                            <li><a class="text-muted" href="#">Địa chỉ cửa hàng</a></li>
                        </ul>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-6 col-sm-4 col-lg-2">
                        <!-- Links -->
                        <h6 class="text-uppercase text-dark fw-bold mb-2">
                            Thông tin
                        </h6>
                        <ul class="list-unstyled mb-4">
                            <li><a class="text-muted" href="#">Thông tin vận chuyển</a></li>
                            <li><a class="text-muted" href="#">Yêu cầu hoàn tiền</a></li>
                        </ul>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-6 col-sm-4 col-lg-2">
                        <!-- Links -->
                        <h6 class="text-uppercase text-dark fw-bold mb-2">
                            Hỗ trợ
                        </h6>
                        <ul class="list-unstyled mb-4">
                            <li><a class="text-muted" href="#">Trung tâm hỗ trợ</a></li>
                            <li><a class="text-muted" href="#">Tài liệu</a></li>
                            <li><a class="text-muted" href="#">Khôi phục tài khoản</a></li>
                        </ul>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-12 col-sm-12 col-lg-3">
                        <!-- Links -->
                        <h6 class="text-uppercase text-dark fw-bold mb-2">TIN TỨC</h6>
                        <p class="text-muted">Cập nhật thông tin mới nhất về những sản phẩm và đề xuất của chúng tôi</p>
                        <div class="input-group mb-3">
                            <input type="email" class="form-control border" placeholder="Email" aria-label="Email" aria-describedby="button-addon2" />
                            <button class="btn btn-light border shadow-0" type="button" id="button-addon2" data-mdb-ripple-color="dark">
                                Join
                            </button>
                        </div>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <div class="">
            <div class="container">
                <div class="d-flex justify-content-between py-4 border-top">
                    <!--- payment --->
                    <div>
                        <i class="fab fa-lg fa-cc-visa text-dark"></i>
                        <i class="fab fa-lg fa-cc-amex text-dark"></i>
                        <i class="fab fa-lg fa-cc-mastercard text-dark"></i>
                        <i class="fab fa-lg fa-cc-paypal text-dark"></i>
                    </div>
                    <!--- payment --->

                </div>
            </div>
        </div>
    </footer>
    <!-- Footer -->
    <!-- MDB -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript" src="js/script.js"></script>
</body>
</html>


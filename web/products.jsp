<%-- 
    Document   : products
    Created on : Mar 15, 2024, 1:07:56 AM
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
        <title>Sản phẩm</title>
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

        <!-- Heading -->
        <div class="bg-primary mb-4">
            <div class="container py-4">
                <h3 class="text-white mt-2">${category}</h3>
                <!-- Breadcrumb -->
                <nav class="d-flex mb-2">
                    <h6 class="mb-0">
                        <a href="home" class="text-white-50">Trang chủ</a>
                        <span class="text-white-50 mx-2"> > </span>
                        <a href="" class="text-white"><u>${category}</u></a>
                    </h6>
                </nav>
                <!-- Breadcrumb -->
            </div>
        </div>
        <!-- Heading -->
    </header>

    <!-- sidebar + content -->
    <section class="">
        <div class="container">
            <div class="row">
                <!-- sidebar -->
                <div class="col-lg-3">
                    <!-- Toggle button -->
                    <button
                        class="btn btn-outline-secondary mb-3 w-100 d-lg-none"
                        type="button"
                        data-mdb-toggle="collapse"
                        data-mdb-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                        >
                        <span>Show filter</span>
                    </button>
                    <!-- Collapsible wrapper -->
                    <div class="collapse card d-lg-block mb-5" id="navbarSupportedContent">
                        <div class="accordion" id="accordionPanelsStayOpenExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button
                                        class="accordion-button text-dark bg-light"
                                        type="button"
                                        data-mdb-toggle="collapse"
                                        data-mdb-target="#panelsStayOpen-collapseOne"
                                        aria-expanded="true"
                                        aria-controls="panelsStayOpen-collapseOne"
                                        >
                                        Các mục khác
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne">
                                    <div class="accordion-body">
                                        <ul class="list-unstyled">
                                            <c:forEach items="${data}" var="c">
                                                <li><a href="product?cat=${c.getId()}" class="text-dark">${c.getName()} </a></li>
                                                </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- sidebar -->
                <!-- content -->
                <div class="col-lg-9">
                    <header class="d-sm-flex align-items-center border-bottom mb-4 pb-3">
                        <strong class="d-block py-2">Tìm thấy ${NoR} sản phẩm </strong>
                    </header>
                    <form action="cart" method="post">
                        <div class="row">
                            <c:forEach items="${data1}" var="p">
                                <div class="col-lg-4 col-md-6 col-sm-6 d-flex">
                                    <div class="card w-100 my-2 shadow-2-strong">
                                        <a href="product?mod=${p.getId()}"><img src="${p.getImage()}" class="card-img-top" /></a>
                                        <div class="card-body d-flex flex-column">
                                            <div class="d-flex flex-row">
                                                <h5 class="mb-1 me-1">${p.getPrice()}</h5>
                                            </div>
                                            <p class="card-text">${p.getName()}</p>
                                            <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
                                                <button type="submit" name="addcart" class="btn btn-primary shadow-0 me-1" value="${p.getId()}">Thêm vào giỏ hàng</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </form>
                </div>
            </div>
        </div>            
    </section>
    <!-- sidebar + content -->

    <footer class="text-center text-lg-start text-muted bg-primary mt-3">
        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start pt-4 pb-4">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-12 col-lg-3 col-sm-12 mb-2">
                        <!-- Content -->
                        <a href="https://mdbootstrap.com/" target="_blank" class="text-white h2">
                            MDB
                        </a>
                        <p class="mt-1 text-white">
                            © 2023 Copyright: MDBootstrap.com
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-6 col-sm-4 col-lg-2">
                        <!-- Links -->
                        <h6 class="text-uppercase text-white fw-bold mb-2">
                            Cửa hàng
                        </h6>
                        <ul class="list-unstyled mb-4">
                            <li><a class="text-white-50" href="#">Thông tin về chúng tôi</a></li>
                            <li><a class="text-white-50" href="#">Địa chỉ cửa hàng</a></li>
                        </ul>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-6 col-sm-4 col-lg-2">
                        <!-- Links -->
                        <h6 class="text-uppercase text-white fw-bold mb-2">
                            Thông tin
                        </h6>
                        <ul class="list-unstyled mb-4">
                            <li><a class="text-white-50" href="#">Thông tin vận chuyển</a></li>
                            <li><a class="text-white-50" href="#">Yêu cầu hoàn tiền</a></li>
                        </ul>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-6 col-sm-4 col-lg-2">
                        <!-- Links -->
                        <h6 class="text-uppercase text-white fw-bold mb-2">
                            Hỗ trợ:
                        </h6>
                        <ul class="list-unstyled mb-4">
                            <li><a class="text-white-50" href="#">Trung tâm hỗ trợ</a></li>
                            <li><a class="text-white-50" href="#">Tài liệu</a></li>
                            <li><a class="text-white-50" href="#">Khôi phục tài khoản</a></li>
                        </ul>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-12 col-sm-12 col-lg-3">
                        <!-- Links -->
                        <h6 class="text-uppercase text-white fw-bold mb-2">TIN TỨC</h6>
                        <p class="text-white">Cập nhật thông tin mới nhất về những sản phẩm và đề xuất của chúng tôi</p>
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
                        <i class="fab fa-lg fa-cc-visa text-white"></i>
                        <i class="fab fa-lg fa-cc-amex text-white"></i>
                        <i class="fab fa-lg fa-cc-mastercard text-white"></i>
                        <i class="fab fa-lg fa-cc-paypal text-white"></i>
                    </div>
                    <!--- payment --->
                </div>
            </div>
        </div>
    </footer>
    <!-- MDB -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript" src="js/script.js"></script>
</body>
</html>



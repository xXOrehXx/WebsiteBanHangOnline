<%-- 
    Document   : product
    Created on : Mar 14, 2024, 11:54:19 PM
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
        <title>${p.getName()}</title>
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
        <header>
            <%@include file="SearchBar.jsp" %>

            <!-- Heading -->
            <div class="bg-primary">
                <div class="container py-4">
                    <!-- Breadcrumb -->
                    <nav class="d-flex">
                        <h6 class="mb-0">
                            <a href="home" class="text-white-50">Trang chủ</a>
                            <span class="text-white-50 mx-2"> > </span>
                            <a href="product?cat=${p.getCategory()}" class="text-white-50">${category}</a>
                            <span class="text-white-50 mx-2"> > </span>
                            <a href="product?mod=${p.getId()}" class="text-white"><u>${p.getName()}</u></a>
                        </h6>
                    </nav>
                    <!-- Breadcrumb -->
                </div>
            </div>
            <!-- Heading -->
        </header>
        <form action="cart" method="post">
            <!-- content -->
            <section class="py-5">
                <div class="container">
                    <div class="row gx-5">
                        <aside class="col-lg-6">
                            <div class="border rounded-4 mb-3 d-flex justify-content-center">
                                <img style="max-width: 100%; max-height: 50vh; margin: auto;" class="rounded-4 fit" src="${p.getImage()}" />
                            </div>
                        </aside>
                        <main class="col-lg-6">
                            <div class="ps-lg-3">
                                <h4 class="title text-dark">
                                    ${p.getName()}
                                </h4>

                                <div class="mb-3">
                                    <span class="h5">${p.getPrice()}</span>
                                    <span class="text-muted">/sản phẩm</span>
                                </div>

                                <p>
                                    ${p.getDescription()}
                                </p>
                                <hr />
                                <a href="home" class="btn btn-warning shadow-0"> Mua ngay </a>
                                <button name="addcart" class="btn btn-primary shadow-0" value="${p.getId()}"> <i class="me-1 fa fa-shopping-basket"></i> Thêm vào giỏ </button>
                            </div>
                        </main>
                    </div>
                </div>
            </section>
            <!-- content -->

            <section>
                <div class="container my-5">
                    <header class="mb-4">
                        <h3>Sản phẩm khác</h3>
                    </header>

                    <div class="row">
                        <c:forEach items="${data1}" var="p">
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="card px-4 border shadow-0 mb-4 mb-lg-0">
                                    <div class="mask px-2" style="height: 50px;">
                                    </div>
                                    <a href="product?mod=${p.getId()}" class="">
                                        <img src="${p.getImage()}" class="card-img-top rounded-2" />
                                    </a>
                                    <div class="card-body d-flex flex-column pt-3 border-top">
                                        <a href="#" class="nav-link">${p.getName()}</a>
                                        <div class="price-wrap mb-2">
                                            <strong class="">${p.getPrice()}</strong>
                                        </div>
                                        <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
                                            <button class="btn btn-outline-primary w-100" type="submit" name="addcart" value="${p.getId()}">Thêm vào giỏ hàng</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </form>

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



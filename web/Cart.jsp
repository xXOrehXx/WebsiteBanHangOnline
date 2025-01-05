<%-- 
    Document   : Cart
    Created on : Mar 13, 2024, 11:44:26 AM
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
        <title>Giỏ hàng của bạn</title>
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
                            <a href="home" target="_self" class="text-white-50">Trang chủ</a>
                            <span class="text-white-50 mx-2"> > </span>
                            <a href="" class="text-white"><u>Giỏ hàng</u></a>
                        </h6>
                    </nav>
                    <!-- Breadcrumb -->
                </div>
            </div>
            <!-- Heading -->
        </header>

        <!-- cart + summary -->
        <section class="bg-light my-5">
            <div class="container">
                <div class="row">
                    <!-- cart -->
                    <div class="col-lg-9">
                        <div class="card border shadow-0">
                            <div class="m-4">
                                <h4 class="card-title mb-4">Giỏ hàng của bạn</h4>
                                <c:forEach items="${data}" var="pc">
                                    <form name="form1" action="cart" method="post">
                                        <div class="row gy-3 mb-4">
                                            <div class="col-lg-5">
                                                <div class="me-lg-5">
                                                    <div class="d-flex">
                                                        <img src="${pc.getImage()}" class="border rounded me-3" style="width: 96px; height: 96px;" />
                                                        <div class="">
                                                            <a href="product?mod=${pc.getId()}" class="nav-link">${pc.getName()}</a>
                                                            <p class="text-muted">${pc.getCategory()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-sm-6 col-6 d-flex flex-row flex-lg-column flex-xl-row text-nowrap">
                                                <div class="form-outline" style="width: 22rem;">
                                                    <input type="hidden" name="id" value="${pc.getId()}">
                                                    <input name="submit" style="width: 100px" step="1" value="${pc.getAmount()}" type="number" id="inputField" class="form-control" min="1"/>
                                                </div>
                                                <div class="">
                                                    <text class="h6">${pc.getCost()}</text> <br />
                                                    <small class="text-muted text-nowrap"> ${pc.getPrice()} / sản phẩm </small>
                                                </div>
                                            </div>
                                            <div class="col-lg col-sm-6 d-flex justify-content-sm-center justify-content-md-start justify-content-lg-center justify-content-xl-end mb-2">
                                                <div class="float-md-end">
                                                    <a class="btn btn-light border text-danger icon-hover-danger" href="cart?mod=${pc.getId()}"> Xóa</a>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </c:forEach>
                            </div>

                            <div class="border-top pt-4 mx-4 mb-4">
                                <p><i class="fas fa-truck text-muted fa-lg"></i> Miễn phí ship trong bán kính 10km</p>
                            </div>
                        </div>
                    </div>
                    <!-- cart -->
                    <!-- summary -->
                    <div class="col-lg-3">
                        <div class="card shadow-0 border">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <p class="mb-2">Tổng tiền:</p>
                                    <p class="mb-2">${totalcost}</p>
                                </div>  

                                <div class="mt-3">
                                    <a href="home?mod=1" class="btn btn-success w-100 shadow-0 mb-2"> Mua ngay </a>
                                    <a href="home" class="btn btn-light w-100 border mt-2"> Về trang chủ </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- summary -->
                </div>
            </div>
        </section>
        <!-- cart + summary -->
        <section>
            <div class="container my-5">
                <header class="mb-4">
                    <h3>Sản phẩm khác</h3>
                </header>
                <form action="cart" method="post">
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
                </form>
            </div>
        </section>
        <!-- Recommended -->

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
        <script>
            document.getElementById('amount').onkeydown = function (e) {
                if (e.keyCode == 13) {
                    this.form1.submit();
                }
            };
            function submitForm(action) {
                var submitInput = document.querySelector('input[name="submit"]');
                submitInput.value = cart;
                document.form1.submit();
            }
        </script>
    </body>
</html>


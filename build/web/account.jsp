<%-- 
    Document   : account
    Created on : Mar 12, 2024, 9:04:52 AM
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
        <title>Thông tin tài khoản</title>
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
        <form action="User" method="post">
            <header>
                <%@include file="SearchBar.jsp" %>

                <!-- Heading -->
                <div class="bg-primary">
                    <div class="container py-4">
                        <!-- Breadcrumb -->
                        <nav class="d-flex">
                            <h6 class="mb-0">
                                <a target="_self" href="home" class="text-white-50">Trang chủ</a>
                                <span class="text-white-50 mx-2"> > </span>
                                <a href="" class="text-white"><u>Thông tin tài khoản</u></a>
                            </h6>
                        </nav>
                        <!-- Breadcrumb -->
                    </div>
                </div>
                <!-- Heading -->
            </header>
            <!-- content -->
            <section class="py-5 bg-light">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-xl-3">
                            <nav class="nav flex-lg-column w-100 d-flex nav-pills mb-4">
                                <a class="nav-link my-0 active" href="User"><p class="pb-0 mb-0" style="width: 100px">Thông tin tài khoản</p></a>
                                <a class="nav-link my-0 bg-light" href="cart"><p class="pb-0 mb-0" style="width: 100px">Giỏ hàng của bạn</p></a>
                                <button class="nav-link my-0 bg-light" type="submit" name="logout" value="logout" style="text-align: left">Đăng xuất</button>
                            </nav>
                        </div>
                        <main class="col-lg-9 col-xl-9">
                            <div class="card p-4 mb-0 shadow-0 border">
                                <div class="content-body">
                                    <div class="d-flex align-items-center">
                                        <div class="pt-2">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <b>Tên tài khoản:</b>
                                                    </td>
                                                    <td>
                                                        <input class="form-control" type="text" name="account" value="${u.getAccount()}" readonly="">
                                                    </td>
                                                    <td style="color: red">*</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>Mật khẩu:</b>
                                                    </td>
                                                    <td>
                                                        <input class="form-control" type="password" name="password" value="${u.getPassword()}" placeholder="Không được để trống">
                                                    </td>
                                                    <td style="color: red">*</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>Họ và tên:</b>
                                                    </td>
                                                    <td>
                                                        <input class="form-control" type="text"  name="name" value="${u.getName()}" placeholder="Không được để trống">
                                                    </td>
                                                    <td style="color: red">*</td>
                                                </tr>
                                            </table>
                                            <hr />
                                            <table>
                                                <tr>
                                                    <td>
                                                        <b>Giới tính:</b>
                                                    </td>
                                                    <td>
                                                        <input type="radio" name="gender" ${male} value="1"> Male
                                                        <span style="margin-left:2em"><input type="radio" name="gender" ${female} value="0"> Female</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>Địa chỉ:</b>
                                                    </td>
                                                    <td>
                                                        <input class="form-control" type="text" name="address" value="${u.getAddress()}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>Số điện thoại:</b>
                                                    </td>
                                                    <td>
                                                        <input class="form-control" type="tel" name="phone" value="${u.getPhone()}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>Ngày sinh:</b>
                                                    </td>
                                                    <td>
                                                        <input class="form-control" type="date" name="dob" value="${u.getDateofbirth()}">
                                                    </td>
                                                </tr>
                                            </table>
                                            <hr class="my-4" />
                                            <input class="btn btn-primary shadow-0" type="submit" name="update" value="Cập nhật">
                                            ${message}<br>
                                            <a href="controlUser">${link}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>
            </section>
            <!-- content -->
            <!-- Footer -->
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
            <!-- Footer -->
            <!-- MDB -->
            <script type="text/javascript" src="js/mdb.min.js"></script>
            <!-- Custom scripts -->
            <script type="text/javascript" src="js/script.js"></script>
        </form>
    </body>
</html>



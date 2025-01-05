<%-- 
    Document   : login
    Created on : Mar 11, 2024, 9:16:30 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Login</title>
        <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'>
        <link href='#' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>::-webkit-scrollbar {
                width: 8px;
            }
            /* Track */
            ::-webkit-scrollbar-track {
                background: #f1f1f1;
            }

            /* Handle */
            ::-webkit-scrollbar-thumb {
                background: #888;
            }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #555;
            }
            body{

                background-color: lightblue;
            }


            .card{

                width: 400px;
                border:none;

            }




            .btr{

                border-top-right-radius: 5px !important;
            }


            .btl{

                border-top-left-radius: 5px !important;
            }

            .btn-dark {
                color: #fff;
                background-color: #0d6efd;
                border-color: #0d6efd;
            }


            .btn-dark:hover {
                color: #fff;
                background-color: #0d6efd;
                border-color: #0d6efd;
            }


            .nav-pills{

                display:table !important;
                width:100%;
            }

            .nav-pills .nav-link {
                border-radius: 0px;
                border-bottom: 1px solid #0d6efd40;

            }

            .nav-item{
                display: table-cell;
                background: #0d6efd2e;
            }


            .form{

                padding: 10px;
                height: 250px;
            }

            .form input{

                margin-bottom: 12px;
                border-radius: 3px;
            }


            .form input:focus{

                box-shadow: none;
            }


            .form button{

                margin-top: 20px;
            }</style>
    </head>
    <body>
        <form name="myForm" action="User" method="get" onsubmit="return validateForm()">

            <div class="d-flex justify-content-center align-items-center mt-5">

                <div class="card">

                    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                        <li class="nav-item text-center">
                            <a class="nav-link active btl" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Đăng nhập</a>
                        </li>
                        <li class="nav-item text-center">
                            <a class="nav-link btr" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Đăng ký</a>
                        </li>
                    </ul>

                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">

                            <div class="form px-4 pt-5">

                                <input type="text" name="account" class="form-control prevent" placeholder="Tài khoản">

                                <input type="password" name="password" class="form-control" placeholder="Mật khẩu">

                                <button class="btn btn-dark btn-block" type="submit" name="login" value="login">Đăng nhập</button>

                                ${message}
                            </div>

                        </div>

                        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">


                            <div class="form px-4">

                                <input type="text" name="raccount" class="form-control prevent" placeholder="Tên tài khoản">

                                <input type="password" name="rpassword" class="form-control" placeholder="Mật khẩu">

                                <input type="text" name="name" class="form-control prevent" placeholder="Họ và tên">

                                <button class="btn btn-dark btn-block" type="submit" name="register" value="register">Đăng ký</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
        <script type='text/javascript' src='#'></script>
        <script type='text/javascript' src='#'></script>
        <script type='text/javascript' src='#'></script>
        <script type='text/javascript'>#</script>
        <script type='text/javascript'>
            var myLink = document.querySelector('a[href="#"]');
            myLink.addEventListener('click', function (e) {
                e.preventDefault();
            });
        </script>
        <script>
            $('.prevent').on('keypress', function (event) {
                var regex = new RegExp("^[a-zA-Z0-9]+$");
                var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                if (!regex.test(key)) {
                    event.preventDefault();
                    showPopup($(this));
                    return false;
                }
            });

            function validateForm() {
                var activeTabId = $('.tab-pane.active').attr('id'); // Get ID of active tab-pane
                var inputs = $('#' + activeTabId).find('input'); // Find inputs within active tab-pane
                var isValid = true;

                // Validate inputs within the active tab-pane
                inputs.each(function () {
                    var input = $(this);
                    if (input.val().trim() === "") {
                        isValid = false;
                        showErrorMessage(input, "This field is required.");
                    } else {
                        hideErrorMessage(input);
                    }
                });

                return isValid;
            }

            function showErrorMessage(input, message) {
                var errorDiv = $('<div class="text-danger">' + message + '</div>');
                input.closest('.form-group').append(errorDiv); // Append error message next to input
            }

            function hideErrorMessage(input) {
                input.closest('.form-group').find('.text-danger').remove(); // Remove error message
            }
        </script>
    </body>

</html>



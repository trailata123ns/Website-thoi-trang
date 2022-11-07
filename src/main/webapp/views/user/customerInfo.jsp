<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

    <!-- directive cua JSTL -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


                <!DOCTYPE html>
                <html lang="en">
                <!-- Basic -->

                <style>
                    body {
                        background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');

                    }

                    :root {
                        --input-padding-x: 1.5rem;
                        --input-padding-y: .75rem;
                    }


                    .card-signin {
                        border: 0;
                        border-radius: 1rem;
                        box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
                        overflow: hidden;
                    }

                    .card-signin .card-title {
                        margin-bottom: 2rem;
                        font-weight: 300;
                        font-size: 1.5rem;
                    }

                    .card-signin .card-img-left {
                        width: 45%;
                        /* Link to your background image using in the property below! */
                        background: scroll center url('https://source.unsplash.com/WEQbe2jBg40/414x512');
                        background-size: cover;
                    }

                    .card-signin .card-body {
                        padding: 2rem;
                    }

                    .form-signin {
                        width: 100%;
                    }

                    .form-signin .btn {
                        font-size: 80%;
                        border-radius: 5rem;
                        letter-spacing: .1rem;
                        font-weight: bold;
                        padding: 1rem;
                        transition: all 0.2s;
                    }

                    .form-label-group {
                        position: relative;
                        margin-bottom: 1rem;
                    }

                    .form-label-group input {
                        height: auto;
                        border-radius: 2rem;
                    }

                    .form-label-group>input,
                    .form-label-group>label {
                        padding: var(--input-padding-y) var(--input-padding-x);
                    }

                    .form-label-group>label {
                        position: absolute;
                        top: 0;
                        left: 0;
                        display: block;
                        width: 100%;
                        margin-bottom: 0;
                        /* Override default `<label>` margin */
                        line-height: 1.5;
                        color: #495057;
                        border: 1px solid transparent;
                        border-radius: .25rem;
                        transition: all .1s ease-in-out;
                    }

                    .form-label-group input::-webkit-input-placeholder {
                        color: transparent;
                    }

                    .form-label-group input:-ms-input-placeholder {
                        color: transparent;
                    }

                    .form-label-group input::-ms-input-placeholder {
                        color: transparent;
                    }

                    .form-label-group input::-moz-placeholder {
                        color: transparent;
                    }

                    .form-label-group input::placeholder {
                        color: transparent;
                    }

                    .form-label-group input:not(:placeholder-shown) {
                        padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
                        padding-bottom: calc(var(--input-padding-y) / 3);
                    }

                    .form-label-group input:not(:placeholder-shown)~label {
                        padding-top: calc(var(--input-padding-y) / 3);
                        padding-bottom: calc(var(--input-padding-y) / 3);
                        font-size: 12px;
                        color: #777;
                    }

                    .btn-google {
                        color: white;
                        background-color: #ea4335;
                    }

                    .btn-facebook {
                        color: white;
                        background-color: #3b5998;
                    }
                </style>

                <head>
                    <meta charset="utf-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">

                    <!-- Mobile Metas -->
                    <meta name="viewport" content="width=device-width, initial-scale=1">

                    <!-- Site Metas -->
                    <title>Thông tin cá nhân</title>
                    <meta name="keywords" content="">
                    <meta name="description" content="">
                    <meta name="author" content="">

                    <!-- VARIABLES -->
                    <jsp:include page="/views/common/variables.jsp"></jsp:include>

                    <!-- CSS -->
                    <jsp:include page="/views/user/layout/css.jsp"></jsp:include>

                </head>

                <body>

                    <jsp:include page="/views/user/layout/header.jsp"></jsp:include>

                    <!-- Start All Title Box -->
                    <div class="all-title-box">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h2>Thông tin khách hàng</h2>
                                    <!-- <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">Thông tin khách hàng</li>
                    </ul> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End All Title Box -->

                    <!-- Start Cart  -->
                    <!-- <div class="cart-box-main">
                        <div class="container">

                            <div class="row">
                                <div class="col-sm-6 col-lg-6 mb-3">
                                    <div class="checkout-address">
                                        <div class="title-left">
                                            <h3>Thông tin đăng ký</h3>
                                            <c:if test="${not empty thongbao }">
                                                <h2 style="color: blue;">Cập nhật thông tin thành công</h2>
                                            </c:if>
                                        </div>
                                        <form class="needs-validation" novalidate method="post"
                                            action="${base }/customerInfo">
                                            <c:if test="${isLogined }">

                                                <div class="mb-3">
                                                    <label for="username">Tên khách hàng</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control"
                                                            id="username customerName" name="customerName"
                                                            placeholder="" value="${userLogined.username }" readonly required>
                                                        <div class="invalid-feedback" style="width: 100%;"> Your name is
                                                            required. </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="email">Email Address *</label>
                                                    <input type="email" class="form-control" readonly id="customerEmail email"
                                                        name="customerEmail" placeholder=""
                                                        value="${userLogined.email}">
                                                    <div class="invalid-feedback"> Please enter a valid email address
                                                        for shipping updates. </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="address">Address *</label>
                                                    <input type="text" class="form-control" id="address customerAddress"
                                                        name="customerAddress" placeholder=""
                                                        value="${userLogined.address }" required>
                                                    <div class="invalid-feedback"> Please enter your shipping address.
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="address2">Phone *</label>
                                                    <input type="text" class="form-control" id="address2 customerPhone"
                                                        name="customerPhone" placeholder=""
                                                        value="${userLogined.phone }">
                                                </div>
                                            </c:if>

                                            <div class="mb-3">
                                                <button type="submit" class="btn btn-primary col-12 d-flex shopping-box"
                                                    style="text-align: center;">Cập nhật</button>
                                            </div>

                                            <hr class="mb-1">

                                    </div>
                                </div>


                                </form>
                            </div>

                        </div>
                    </div> -->

                    <div class="container">
                        <div class="row">
                            <div class="col-lg-10 col-xl-9 mx-auto">
                                <div class="card card-signin flex-row my-5">
                                    <div class="card-img-left d-none d-md-flex">
                                        <!-- Background image for card set in CSS! -->
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Thông tin khách hàng</h5>
                                        <form class="form-signin" method="POST" action="${base }/customerInfo">
                                            <c:if test="${isLogined }">
                                                <div class="form-label-group">
                                                    <input type="text" id="inputUserame" name="customerName"
                                                        value="${userLogined.username }" readonly class="form-control"
                                                        placeholder="Tài Khoản" required>
                                                    <label for="inputUserame">Tài khoản</label>
                                                </div>

                                                <div class="form-label-group">
                                                    <input type="email" id="inputEmail" name="customerEmail"
                                                        placeholder="" value="${userLogined.email}" class="form-control"
                                                        readonly required>
                                                    <label for="inputEmail">Email</label>
                                                </div>

                                                <hr>

                                                <div class="form-label-group">
                                                    <input type="text" id="imputAddress" name="customerAddress"
                                                        placeholder="" value="${userLogined.address }"
                                                        class="form-control" required>
                                                    <label for="imputAddress">Địa chỉ</label>
                                                </div>

                                                <div class="form-label-group">
                                                    <input type="number" id="imputPhone" name="customerPhone"
                                                        placeholder="" value="${userLogined.phone }"
                                                        class="form-control" required>
                                                    <label for="imputPhone">Số điện thoại</label>
                                                </div>
                                            </c:if>

                                            <button class="btn btn-lg btn-primary btn-block text-uppercase"
                                                onclick="onlickUpdate(event)" id="btnUpdate">Cập nhật</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- End Cart -->

                    <!-- Footer -->
                    <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>


                    <!-- JS -->

                    <script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script>

                    <jsp:include page="/views/user/layout/js.jsp"></jsp:include>

                    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

                    <script>
                        function onlickUpdate(event){
                            event.preventDefault();
                            var a = document.querySelector('.form-signin');
                            swal({
                                    title: "Cập nhật thông tin thành công",
                                    text: "Thành công",
                                    icon: "success",
                                    button: "Trờ lại",
                                });
                                 setTimeout(() => {a.submit()}, 2500);
                        }
                    </script>

                </body>

                </html>
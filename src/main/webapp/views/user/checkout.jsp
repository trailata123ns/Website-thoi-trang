<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

    <!-- directive cua JSTL -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


                <!DOCTYPE html>
                <html lang="en">
                <!-- Basic -->

                <head>
                    <meta charset="utf-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">

                    <!-- Mobile Metas -->
                    <meta name="viewport" content="width=device-width, initial-scale=1">

                    <!-- Site Metas -->
                    <title>Hades Store</title>
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
                                    <h2>Thanh toán</h2>
                                    <ul class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#"> Cửa hàng</a></li>
                                        <li class="breadcrumb-item active">Thanh toán</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End All Title Box -->

                    <!-- Start Cart  -->
                    <div class="cart-box-main">
                        <div class="container">
                            <div class="row new-account-login">
                                <!-- <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="title-left">
                        <h3>Account Login</h3>
                    </div>
                    <h5><a data-toggle="collapse" href="#formLogin" role="button" aria-expanded="false">Click here to Login</a></h5>
                    <form class="mt-3 collapse review-form-box" id="formLogin">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="InputEmail" class="mb-0">Email Address</label>
                                <input type="email" class="form-control" id="InputEmail" placeholder="Enter Email"> </div>
                            <div class="form-group col-md-6">
                                <label for="InputPassword" class="mb-0">Password</label>
                                <input type="password" class="form-control" id="InputPassword" placeholder="Password"> </div>
                        </div>
                        <button type="submit" class="btn hvr-hover">Login</button>
                    </form>
                </div> -->
                                <!-- <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="title-left">
                        <h3>Create New Account</h3>
                    </div>
                    <h5><a data-toggle="collapse" href="#formRegister" role="button" aria-expanded="false">Click here to Register</a></h5>
                    <form class="mt-3 collapse review-form-box" id="formRegister">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="InputName" class="mb-0">First Name</label>
                                <input type="text" class="form-control" id="InputName" placeholder="First Name"> </div>
                            <div class="form-group col-md-6">
                                <label for="InputLastname" class="mb-0">Last Name</label>
                                <input type="text" class="form-control" id="InputLastname" placeholder="Last Name"> </div>
                            <div class="form-group col-md-6">
                                <label for="InputEmail1" class="mb-0">Email Address</label>
                                <input type="email" class="form-control" id="InputEmail1" placeholder="Enter Email"> </div>
                            <div class="form-group col-md-6">
                                <label for="InputPassword1" class="mb-0">Password</label>
                                <input type="password" class="form-control" id="InputPassword1" placeholder="Password"> </div>
                        </div>
                        <button type="submit" class="btn hvr-hover">Register</button>
                    </form>
                </div> -->
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-lg-6 mb-3">
                                    <div class="checkout-address">
                                        <div class="title-left">
                                            <h3>Địa chỉ thanh toán</h3>
                                        </div>
                                        <form class="needs-validation" novalidate method="post"
                                            action="${base }/cart/finish">
                                            <c:choose>
                                                <c:when test="${isLogined }">
                                                    <div class="mb-3">
                                                        <label for="username">Tên khách hàng *</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control"
                                                                id="username customerName" name="customerName"
                                                                placeholder="" value="${userLogined.username }"
                                                                required>
                                                            <div class="invalid-feedback" style="width: 100%;"> Your
                                                                name is required. </div>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="email">Email *</label>
                                                        <input type="email" class="form-control"
                                                            id="customerEmail email" name="customerEmail" placeholder=""
                                                            value="${userLogined.email}">
                                                        <div class="invalid-feedback"> Please enter a valid email
                                                            address for shipping updates. </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="address">Địa chỉ *</label>
                                                        <input type="text" class="form-control"
                                                            id="address customerAddress" name="customerAddress"
                                                            placeholder="" value="${userLogined.address }" required>
                                                        <div class="invalid-feedback"> Please enter your shipping
                                                            address. </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="address2">Số điện thoại *</label>
                                                        <input type="text" class="form-control"
                                                            id="address2 customerPhone" name="customerPhone"
                                                            placeholder="" value="${userLogined.phone }">
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="mb-3">
                                                        <label for="username">Tên khách hàng *</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control"
                                                                id="username customerName" name="customerName"
                                                                placeholder="" required>
                                                            <div class="invalid-feedback" style="width: 100%;"> Your
                                                                name is required. </div>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="email">Email *</label>
                                                        <input type="email" class="form-control"
                                                            id="customerEmail email" name="customerEmail"
                                                            placeholder="">
                                                        <div class="invalid-feedback"> Please enter a valid email
                                                            address for shipping updates. </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="address">Địa chỉ *</label>
                                                        <input type="text" class="form-control"
                                                            id="address customerAddress" name="customerAddress"
                                                            placeholder="" required>
                                                        <div class="invalid-feedback"> Please enter your shipping
                                                            address. </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="address2">Số điện thoại *</label>
                                                        <input type="text" class="form-control"
                                                            id="address2 customerPhone" name="customerPhone"
                                                            placeholder="">
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>


                                            <hr class="mb-1">

                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-6 mb-3">
                                    <div class="row">

                                        <div class="col-md-12 col-lg-12">
                                            <div class="odr-box">
                                                <div class="title-left">
                                                    <h3>Giỏ hàng của bạn</h3>
                                                </div>
                                                <div class="rounded p-2 bg-light">

                                                    <c:forEach items="${cart.cartItems }" var="cartItem">
                                                        <div class="media mb-2 border-bottom">
                                                            <div class="media-body"> <a href="detail.html">
                                                                    ${cartItem.productName}</a>
                                                                <div class="small text-muted">${cartItem.priceUnit}đ
                                                                    <span class="mx-2">|</span>${cartItem.quanlity}
                                                                    <span class="mx-2">|</span>${cartItem.size}
                                                                    <span class="mx-2">|</span> Thành tiền:
                                                                    ${cartItem.quanlity * cartItem.priceUnit}đ</div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-lg-12">
                                            <div class="order-box">
                                                <div class="title-left">
                                                    <h3>Đơn đặt hàng của bạn</h3>
                                                </div>
                                                <div class="d-flex">
                                                    <div class="font-weight-bold">Sản phẩm</div>
                                                    <div class="ml-auto font-weight-bold">Tổng tiền</div>
                                                </div>
                                                <hr class="my-1">
                                                <div class="d-flex">
                                                    <h4>Thành tiền</h4>
                                                    <div class="ml-auto font-weight-bold"> <fmt:setLocale value="vi_VN" />
                                                        <fmt:formatNumber value="${totalPrice  }" type="NUMBER" />
                                                        VNĐ</div>
                                                </div>

                                                <div class="d-flex">
                                                    <h4>Phí vận chuyển</h4>
                                                    <div class="ml-auto font-weight-bold"> Miễn phí </div>
                                                </div>
                                                <hr>
                                                <div class="d-flex gr-total">
                                                    <h5>Tổng chi</h5>
                                                    <div class="ml-auto h5"> <fmt:setLocale value="vi_VN" />
                                                        <fmt:formatNumber value="${totalPrice  }" type="NUMBER" />
                                                        VNĐ</div>
                                                </div>
                                                <hr>
                                            </div>
                                        </div>
                                        <!-- <div class="col-12 d-flex shopping-box"> <a href="checkout.html" class="ml-auto btn hvr-hover">Place Order</a> </div> -->
                                        <button onclick="onlickUpdate(event)"
                                            class="btn btn-primary col-12 d-flex shopping-box"
                                            style="text-align: center;">Thanh toán</button>
                                    </div>
                                </div>

                                </form>
                            </div>

                        </div>
                    </div>
                    <!-- End Cart -->

                    <!-- Footer -->
                    <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>

                    <!-- JS -->
                    <jsp:include page="/views/user/layout/js.jsp"></jsp:include>

                    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

                    <script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script>

                    <script>
                        function onlickUpdate(event) {
                            event.preventDefault();
                            var a = document.querySelector('.needs-validation');
                            swal({
                                title: "Đặt hàng thành công",
                                text: "Thành công",
                                icon: "success",
                                button: "Trờ lại",
                            });
                            setTimeout(() => { a.submit() }, 1000);
                        }
                    </script>

                </body>

                </html>
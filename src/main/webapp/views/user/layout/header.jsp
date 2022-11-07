<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

    <!-- directive cua JSTL -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <style>
                .color-btn:hover{
                    color: red !important;
                }
            </style>

                <!-- Start Main Top -->
                <div class="main-top">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="text-slid-box">
                                    <div id="offer-box" class="carouselTicker">
                                        <ul class="offer-box">
                                            <li>
                                                <i class="fab fa-opencart"></i> Off 10%! Shop Now Man
                                            </li>
                                            <li>
                                                <i class="fab fa-opencart"></i> 50% - 80% off on Fashion
                                            </li>
                                            <li>
                                                <i class="fab fa-opencart"></i> 20% off Entire Purchase Promo code:
                                                offT20
                                            </li>
                                            <li>
                                                <i class="fab fa-opencart"></i> Off 50%! Shop Now
                                            </li>
                                            <li>
                                                <i class="fab fa-opencart"></i> Off 10%! Shop Now Man
                                            </li>
                                            <li>
                                                <i class="fab fa-opencart"></i> 50% - 80% off on Fashion
                                            </li>
                                            <li>
                                                <i class="fab fa-opencart"></i> 20% off Entire Purchase Promo code:
                                                offT20
                                            </li>
                                            <li>
                                                <i class="fab fa-opencart"></i> Off 50%! Shop Now
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="custom-select-box">
                                    <select id="basic" class="selectpicker show-tick form-control"
                                        data-placeholder="User">
                                        <option>Name: ${userLogined.username }</option>
                                    </select>
                                </div>
                                <!-- <div class="right-phone-box">
                                    <p>Số ĐT :- <a href="#"> +11 900 800 100</a></p>
                                </div> -->
                                <div class="our-link">
                                    <ul>
                                        <li>
                                            <c:if test="${!isLogined }">
                                                <a class="dropdown-item" href="${base }/login">Đăng nhập</a>
                                            </c:if>
                                        </li>
                                        <li>
                                            <c:if test="${!isLogined }">
                                                <a class="dropdown-item" href="${base }/register">Đăng ký</a>
                                            </c:if>
                                        </li>

                                        <li>
                                            <c:if test="${isLogined }">
                                                <a class="dropdown-item" href="${base }/customerInfo">TÀI KHOẢN</a>
                                            </c:if>
                                        </li>

                                        <li>
                                            <c:if test="${userLogined.roles.get(0).name=='ADMIN'}">
                                                <a class="dropdown-item" href="${base }/admin/index">Quản lý web</a>
                                        </c:if>
                                        </li>

                                        <li>
                                            <c:if test="${isLogined }">
                                                <form method="POST" action="/logout">
                                                    <button class="dropdown-item color-btn" style="color: white;"
                                                        type="submit">Đăng xuất</button>
                                                </form>
                                            </c:if>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Main Top -->

                <!-- Start Main Top -->
                <header class="main-header">
                    <!-- Start Navigation -->
                    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
                        <div class="container">
                            <!-- Start Header Navigation -->
                            <div class="navbar-header">
                                <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <a class="navbar-brand" href="index.html"><img src="${base}/user/images/hadeslogo.png"
                                        class="logo" alt=""></a>
                            </div>
                            <!-- End Header Navigation -->

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="navbar-menu">
                                <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                                    <li class="nav-item active"><a class="nav-link" href="${base}/home">Trang chủ</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link" href="${base}/aboutUs">Giới thiệu</a></li>
                                    <li class="dropdown megamenu-fw">
                                        <a href="${base}/shop" class="nav-link ">Sản phẩm</a>
                                        
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="nav-link">Cửa
                                            hàng</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="${base }/cart/view">Giỏ hàng</a></li>
                                            <li><a href="${base }/checkout">Thanh toán</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item"><a class="nav-link" href="${base}/user/order">Thông tin đặt
                                            hàng</a></li>
                                    <li class="nav-item"><a class="nav-link" href="${base}/contact">Liên hệ</a></li>
                                </ul>
                            </div>
                            <!-- /.navbar-collapse -->

                            <!-- Start Atribute Navigation -->
                            <div class="attr-nav">
                                <ul>
                                    <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                                    <li class="side-menu"><a href="${base}/cart/view">
                                            <i class="fa fa-shopping-bag"></i>
                                            <span id="totalCartItemId" class="badge">${totalItems }</span>
                                        </a></li>
                                </ul>
                            </div>
                            <!-- End Atribute Navigation -->
                        </div>
                        <!-- Start Side Menu -->

                        <c:forEach items="${cart.cartItems }" var="cartItem">

                            <div class="side">
                                <a href="#" class="close-side"><i class="fa fa-times"></i></a>
                                <li class="cart-box">
                                    <ul class="cart-list">
                                        <li>
                                            <a href="#" class="photo"><img
                                                    src="${base }/upload/${cartItem.productImage}" class="cart-thumb"
                                                    alt="" /></a>
                                            <h6><a href="#">${cartItem.productName}</a></h6>
                                            <p>${cartItem.quanlity}x - <span class="price">${cartItem.priceUnit }</span>
                                            </p>
                                        </li>

                                        <li class="total">
                                            <a href="${base}/cart/view" class="btn btn-default hvr-hover btn-cart">VIEW
                                                CART</a>
                                            <!-- <span class="float-right"><strong>Total</strong>: $180.00</span> -->
                                        </li>
                                    </ul>
                                </li>
                            </div>

                        </c:forEach>


                        <!-- End Side Menu -->
                    </nav>
                    <!-- End Navigation -->
                </header>
                <!-- End Main Top -->

                <!-- Start Top Search -->
                <div class="top-search">
                    <div class="container">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search">
                            <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                        </div>
                    </div>
                </div>
                <!-- End Top Search -->
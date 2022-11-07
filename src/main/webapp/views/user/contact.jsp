<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <!-- directive JSTL -->
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

                    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

                </head>

                <body>

                    <!-- Header -->
                    <jsp:include page="/views/user/layout/header.jsp"></jsp:include>

                    <!-- Start All Title Box -->
                    <div class="all-title-box">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h2>Liên hệ hỗ trợ</h2>
                                    <ul class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                                        <li class="breadcrumb-item active"> Liên hệ </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End All Title Box -->

                    <!-- Start Contact Us  -->
                    <div class="contact-box-main">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4 col-sm-12">
                                    <div class="contact-info-left">
                                        <h2>Thông tin liên lạc</h2>
                                        <p>Bạn hãy điền thông tin liên lạc để được giúp đỡ . Lưu ý thông tin của bạn
                                            phải chính xác để được hỗ trợ tốt nhất . Xin cảm ơn!</p>
                                        <ul>
                                            <li>
                                                <p><i class="fas fa-map-marker-alt"></i>Địa chỉ:Mai Dịch Cầu Giấy
                                                    <br>Thành phố Hà Nội,<br> Tòa G3
                                                </p>
                                            </li>
                                            <li>
                                                <p><i class="fas fa-phone-square"></i>Số điện thoại: <a
                                                        href="tel:+1-888705770">+012 345 657</a></p>
                                            </li>
                                            <li>
                                                <p><i class="fas fa-envelope"></i>Email: <a
                                                        href="mailto:contactinfo@gmail.com">contactinfo@gmail.com</a>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-sm-12">
                                    <div class="contact-form-right">
                                        <h2>Liên hệ hỗ trợ</h2>
                                        <p>Hãy mô tả các vấn đề bạn gặp phải 1 cách chi tiết nhất để nhận được sự hỗ trợ
                                            tốt nhất từ Hades Store</p>
                                        <sf:form id="contactForm" action="${base}/contact" method="post"
                                            modelAttribute="contactTiki" enctype="multipart/form-data" class="check">
                                            <c:if test="${isLogined }">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <input type="text"
                                                                class="form-control unicase-form-control text-input"
                                                                id="exampleInputName" name="name" readonly
                                                                placeholder="Tên của bạn" required
                                                                value="${userLogined.username }"
                                                                data-error="Please enter your name">
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <input type="text" placeholder="Email"
                                                                id="exampleInputEmail" type="email" readonly
                                                                class="form-control unicase-form-control text-input"
                                                                name="email" required value="${userLogined.email}"
                                                                data-error="Please enter your email">
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <input type="text"
                                                                class="form-control unicase-form-control text-input"
                                                                id="exampleInputTitle" name="name" placeholder="Tiêu đề"
                                                                required data-error="Please enter your Title">
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <textarea class="form-control unicase-form-control"
                                                                name="message" id="exampleInputComments"
                                                                placeholder="Nội dung hỗ trợ" rows="4"
                                                                data-error="Write your message" required></textarea>
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                        <div class="submit-button text-center">
                                                            <button class="btn hvr-hover" id="submit" type="button"
                                                                onclick="saveContactTiki()">Gửi hỗ trợ</button>
                                                            <div id="msgSubmit" class="h3 text-center hidden"></div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${!isLogined }">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <input type="text"
                                                                class="form-control unicase-form-control text-input"
                                                                id="exampleInputName" name="name"
                                                                placeholder="Tên của bạn" required
                                                                data-error="Vui lòng nhập tên">
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <input type="text" placeholder=" Email"
                                                                id="exampleInputEmail" type="email"
                                                                class="form-control unicase-form-control text-input"
                                                                name="email" required data-error="Vui lòng nhập email">
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <input type="text"
                                                                class="form-control unicase-form-control text-input"
                                                                id="exampleInputTitle" name="name" placeholder="Tiêu đề"
                                                                required data-error="Vui lòng nhập tiêu đề">
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <textarea class="form-control unicase-form-control"
                                                                name="message" id="exampleInputComments"
                                                                placeholder="Mô tả chi tiết" rows="4"
                                                                data-error="Vui lòng nhập mô tả" required></textarea>
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                        <div class="submit-button text-center">
                                                            <button class="btn hvr-hover" id="submit" type="button"
                                                                onclick="saveContactTiki(event)">Gửi hỗ trợ</button>
                                                            <div id="msgSubmit" class="h3 text-center hidden"></div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Cart -->

                    <c:if test="${not empty thongbao }">
                        <div class="alert alert-primary" role="alert">
                            ${thongbao }
                        </div>
                    </c:if>

                    <!-- Footer -->
                    <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>

                    <!-- JS -->
                    <jsp:include page="/views/user/layout/js.jsp"></jsp:include>

                    <script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script>

                    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

                    <script type="text/javascript">
                        function saveContactTiki(event) {
                            let data = {
                                txtName: $("#exampleInputName").val(),
                                txtEmail: $("#exampleInputEmail").val(),
                                txtTitle: $("#exampleInputTitle").val(),
                                txtComments: $("#exampleInputComments").val(),
                            };

                            // $ === jQuery
                            // json == javascript object
                            $.ajax({
                                url: "/contactTiki-ajax",
                                type: "post",
                                contentType: "application/json",
                                data: JSON.stringify(data),

                                dataType: "json",
                                success: function (jsonResult) {
                                    alert(jsonResult.message);
                                },
                                error: function (jqXhr, textStatus, errorMessage) { // error callback 

                                }
                            });
                        }
                    </script>

                </body>

                </html>
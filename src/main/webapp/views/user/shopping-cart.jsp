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
                                    <h2>Cart</h2>
                                    <ul class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                                        <li class="breadcrumb-item active">Cart</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End All Title Box -->

                    <!-- Start Cart  -->

                    <div class="cart-box-main">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-main table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>???nh s???n ph???m</th>
                                                    <th>T??n s???n ph???m</th>
                                                    <th>Gi??</th>
                                                    <th>S??? l?????ng</th>
                                                    <th>Size</th>
                                                    <th>Th??nh ti???n</th>
                                                    <th>X??a</th>
                                                </tr>
                                            </thead>

                                            <c:choose>
                                                <c:when test="${not empty thongbao2}">
                                                    <h2>Kh??ng c?? m???t h??ng n??o trong gi???</h2>
                                                </c:when>    
                                                <c:otherwise>
                                                    <tbody>
                                                        <tr>
                                                            <c:if test="${not empty thongbao }">
                                                                <div class="alert alert-primary" role="alert"
                                                                    style="color: blue;font-size: 24px;font-weight: bold;">
                                                                    ${thongbao }
                                                                </div>
                                                            </c:if>
                                                        </tr>
        
                                                        <c:forEach items="${cart.cartItems }" var="cartItem">
                                                            <tr>
                                                                <td class="thumbnail-img">
                                                                    <a href="#">
                                                                        <img class="img-fluid"
                                                                            src="${base }/upload/${cartItem.productImage}"
                                                                            alt="" />
                                                                    </a>
                                                                </td>
                                                                <td class="name-pr">
                                                                    <a href="#">
                                                                        ${cartItem.productName}
                                                                    </a>
                                                                </td>
                                                                <td class="price-pr">
        
                                                                    <p>
                                                                        <fmt:setLocale value="vi_VN" />
                                                                        <fmt:formatNumber value="${cartItem.priceUnit}"
                                                                            type="NUMBER" />
                                                                        VN??
                                                                    </p>
                                                                </td>
                                                                <td>
                                                                    <input type="number" onchange="updateCart(${cartItem.productId})" size="4" id="quantity" value="${cartItem.quanlity}" min="1" step="1" class="c-input-text qty text">
                                                                    
                                                                </td>
                                                                <td>${cartItem.size}</td>
                                                                <td class="total-pr">
                                                                    <p>
        
                                                                        <fmt:setLocale value="vi_VN" />
                                                                        <fmt:formatNumber
                                                                            value="${cartItem.quanlity * cartItem.priceUnit}"
                                                                            type="NUMBER" />
                                                                        VN??
                                                                    </p>
                                                                </td>
                                                                <td class="remove-pr">
                                                                    <a href="#" onclick="deleteProduct(${cartItem.productId})">
                                                                        <i class="fas fa-times"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
        
        
                                                    </tbody>
                                                </c:otherwise>
                                            </c:choose>

                                            
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <a href="${base}/cart/view" class="ml-auto btn hvr-hover">C???p nh???t gi??? h??ng</a>
                            </div>

                            <div class="row my-5">
                                <div class="col-lg-8 col-sm-12"></div>
                                <div class="col-lg-4 col-sm-12">
                                    <div class="order-box">
                                        <h3>Th??ng tin ????n h??ng</h3>
                                        <div class="d-flex">
                                            <h4>Th??nh ti???n</h4>
                                            <div class="ml-auto font-weight-bold">
                                                <fmt:setLocale value="vi_VN" />
                                                <fmt:formatNumber value="${totalPrice }" type="NUMBER" />
                                                VN??

                                            </div>
                                        </div>
                                        <div class="d-flex">
                                            <h4>Ph?? v???n chuy???n</h4>
                                            <div class="ml-auto font-weight-bold"> Mi???n ph?? </div>
                                        </div>
                                        <hr>
                                        <div class="d-flex gr-total">
                                            <h5>T???ng ti???n</h5>
                                            <div class="ml-auto h5">
                                                <fmt:setLocale value="vi_VN" />
                                                <fmt:formatNumber value="${totalPrice  }" type="NUMBER" />
                                                VN??
                                            </div>
                                        </div>
                                        <hr>
                                    </div>
                                </div>
                                <div class="col-12 d-flex shopping-box"><a href="${base}/checkout"
                                        class="ml-auto btn hvr-hover">Thanh to??n</a> </div>
                            </div>

                        </div>
                    </div>


                    <!-- End Cart -->

                    <!-- Footer -->

                    <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>

                    <!-- JS -->
                    <jsp:include page="/views/user/layout/js.jsp"></jsp:include>

                    <script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script>

                    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

                    <script type="text/javascript">
                        function deleteProduct(productId) {
                            let data = {
                                productId: productId
                            };

                            // $ === jQuery
                            // json == javascript object
                            $.ajax({
                                url: "/cart-delete",
                                type: "post",
                                contentType: "application/json",
                                data: JSON.stringify(data),// let data;

                                dataType: "json",
                                success: function (jsonResult) {
                                    //	alert("Chuc mung! da luu thanh cong dia chi email " + jsonResult.message.txtTitle);
                                    $("#totalCartItemId").html(jsonResult.totalItems);
                                    swal({
                                        title: "B???n ch???c ch???n mu???n x??a?",
                                        text: "Vui l??ng l???a chon",
                                        icon: "warning",
                                        buttons: true,
                                        dangerMode: true,
                                    })
                                        .then((willDelete) => {
                                            if (willDelete) {
                                                swal("X??a s???n ph???m th??nh c??ng", {
                                                    icon: "success",
                                                });
                                                setTimeout(() => { location.reload() }, 1000);
                                            }
                                        });
                                },
                                error: function (jqXhr, textStatus, errorMessage) { // error callback 

                                }
                            });
                        }
                    </script>

                    <script type="text/javascript">

                        function updateCart(productId) {

                            var a = document.getElementById("quantity").value;
                            let data = {
                                productId: productId,
                                quanlity: a
                            };

                            console.log(productId)
                            console.log(a)

                            jQuery.ajax({
                                url: "/cart/update",
                                type: "post",
                                contentType: "application/json",
                                data: JSON.stringify(data),
                                dataType: "json",
                                success: function (jsonResult) {
                                    let totalItems = jsonResult.totalItems;
                                },
                                error: function (jqXhr, textStatus, errorMessage) { // error callback
                                }
                            });
                        }

                    </script>


                </body>

                </html>
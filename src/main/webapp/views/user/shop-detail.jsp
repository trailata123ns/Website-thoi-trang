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
                    <title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
                    <meta name="keywords" content="">
                    <meta name="description" content="">
                    <meta name="author" content="">

                    <!-- VARIABLES -->
                    <jsp:include page="/views/common/variables.jsp"></jsp:include>

                    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

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
                                    <h2>Chi tiết sản phẩm</h2>
                                    <ul class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Cửa hàng</a></li>
                                        <li class="breadcrumb-item active">Chi tiết sản phẩm </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End All Title Box -->

                    <!-- Start Shop Detail  -->
                    <div class="shop-detail-box-main">
                        <div class="container">


                            <div class="row">
                                <div class="col-xl-5 col-lg-5 col-md-6">
                                    <div id="carousel-example-1" class="single-product-slider carousel slide"
                                        data-ride="carousel">
                                        <div class="carousel-inner" role="listbox">
                                            <div class="carousel-item active"> <img class="d-block w-100"
                                                    src="${base }/upload/${productDetail.avatar}" alt="First slide">
                                            </div>

                                            <c:forEach items="${productImgList}" var="productImg">
                                                <div class="carousel-item"> <img class="d-block w-100"
                                                        src="${base }/upload/${productImg.path}" alt="Second slide">
                                                </div>
                                            </c:forEach>

                                        </div>
                                        <a class="carousel-control-prev" href="#carousel-example-1" role="button"
                                            data-slide="prev">
                                            <i class="fa fa-angle-left" aria-hidden="true"></i>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carousel-example-1" role="button"
                                            data-slide="next">
                                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                                            <span class="sr-only">Next</span>
                                        </a>
                                        <ol class="carousel-indicators">
                                            <li data-target="#carousel-example-1" data-slide-to="0" class="active">
                                                <img class="d-block w-100 img-fluid"
                                                    src="${base }/upload/${productDetail.avatar}" alt="" />
                                            </li>
                                            <c:if test="${productImgList!=null}">
                                                <c:forEach items="${productImgList}" var="productImg">
                                                    <li data-target="#carousel-example-1" data-slide-to="2">
                                                        <img class="d-block w-100 img-fluid"
                                                            src="${base }/upload/${productImg.path}" alt="" />
                                                    </li>
                                                </c:forEach>
                                            </c:if>

                                        </ol>
                                    </div>
                                </div>


                                <div class="col-xl-7 col-lg-7 col-md-6">
                                    <div class="single-product-details">
                                        <h2>${productDetail.title}</h2>
                                        <h5> <del>${productDetail.price}₫</del> <fmt:setLocale value = "vi_VN"/>
                                            <fmt:formatNumber value = "${productDetail.priceSale}" type ="NUMBER"/>₫</h5>
                                        <h4>Mô tả :</h4>
                                        <p>${productDetail.details}</p>
                                        <h4>Số lượng tồn : ${productDetail.quantity}</h4>
                                        <ul>
                                            <li>
                                                <div class="form-group size-st">
                                                    <label class="size-label">Size</label>
                                                    <select id="txtSize" class="selectpicker show-tick form-control"
                                                        name="size">
                                                        <option value="S">S</option>
                                                        <option value="M">M</option>
                                                        <option value="L">L</option>
                                                        <option value="XL">XL</option>
                                                        <option value="XXL">XXL</option>
                                                    </select>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-group quantity-box">
                                                    <label class="control-label">Số lượng</label>
                                                    <input class="form-control" value="1" min="1" max="20" type="number"
                                                        name="keyword" id="sl">
                                                </div>
                                            </li>
                                        </ul>

                                        <c:choose>
                                            <c:when test="${productDetail.quantity==0}">
                                                <div class="price-box-bar">
                                                    <div class="cart-and-bay-btn">
                                                        <a class="btn hvr-hover" data-fancybox-close="" href="#"
                                                             >Sản phẩm đã hết hàng</a>
                                                    </div>
                                                </div>
                                            </c:when>    
                                            <c:otherwise>
                                                <div class="price-box-bar">
                                                    <div class="cart-and-bay-btn">
                                                        <a class="btn hvr-hover" data-fancybox-close="" href="#"
                                                            onclick="addToCart(${productDetail.id})">Thêm vào giỏ hàng</a>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                         </c:choose>

                                    </div>
                                </div>
                            </div>

                            <c:if test="${isLogined}">
                                <div class="row" style="margin-top: 50px">
                                    <div class="form-group">
                                        <form action="%{base}/reviewUser" class="check">
                                            <input type="hidden" name="id">
                                            <textarea class="form-control" placeholder="Nhập đánh giá của bạn"
                                                id="txtComment" cols="100%" rows="6"></textarea>
                                            <br><br>
                                            <input onclick="saveComment(${productDetail.id} , event)" value="Bình luận"
                                                class="btn btn-danger">
                                        </form>
                                    </div>
                                </div>
                            </c:if>

                            <br><br>

                            <div class="row">
                                <div class="col-md-12">
                                    <h3 style="text-align: center;">Danh sách bình luận</h3>
                                </div>
                            </div>

                            <br><br>

                            <c:if test="${empty reivewList}">
                                <div class="row">
                                    <dic class="col-md-4" style="text-align:center">Sản phẩm này chưa có đánh giá nào</dic>
                                </div>
                            </c:if>

                            <c:forEach items="${reivewList}" var="review">
                                <c:if test="${review.status==true}">

                                    <div class="row">
                                        <div class="col-md-2" style="padding: 10px;">
                                            <img src="${base}/user/images/avatar.png" alt="Avatar"
                                                class="rounded-circle img-fluid">
                                        </div>

                                        <div class="col-md-10 my-date">
                                            <p>${review.getUser().getUsername()}</p>
                                            <p>${review.content}</p>
                                            <i>${review.createdDate}</i>
                                        </div>
                                    </div>
                                </c:if>

                            </c:forEach>

                            <div class="row my-5">
                                <div class="col-lg-12">
                                    <div class="title-all text-center">
                                        <h1>Sản phẩm liên quan</h1>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus
                                            enim.</p>
                                    </div>
                                    <div class="featured-products-box owl-carousel owl-theme">

                                        <c:forEach var="product" items="${productList}">
                                            <div class="item">
                                                <div class="products-single fix">
                                                    <div class="box-img">
                                                        <img src="${base }/upload/${product.avatar}" class="img-fluid"
                                                            alt="Image">
                                                        <!-- <div class="mask-icon">
                                                            <ul>
                                                                <li><a href="#" data-toggle="tooltip"
                                                                        data-placement="right" title="View"><i
                                                                            class="fas fa-eye"></i></a></li>
                                                                <li><a href="#" data-toggle="tooltip"
                                                                        data-placement="right" title="Compare"><i
                                                                            class="fas fa-sync-alt"></i></a></li>
                                                                <li><a href="#" data-toggle="tooltip"
                                                                        data-placement="right"
                                                                        title="Add to Wishlist"><i
                                                                            class="far fa-heart"></i></a></li>
                                                            </ul>
                                                            <a class="cart" href="#">Add to Cart</a>
                                                        </div> -->
                                                    </div>
                                                    <div class="why-text">
                                                        <a href="${base}/productDetail/${product.id}">
                                                            <h4>${product.title} </h4>
                                                        </a>
                                                        <h5><fmt:setLocale value = "vi_VN"/>
                                                            <fmt:formatNumber value = "${product.priceSale}" type ="NUMBER"/>₫</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>


                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- End Cart -->

                    <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>

                    <script type="text/javascript">

                        function addToCart(productId) {
                            var a = document.getElementById("sl").value;
                            if(a < 1){
                                a = 1;
                            }
                            console.log(a);
                            let data = {
                                productId: productId,
                                quanlity: a,
                                size: $("#txtSize").val()
                            };

                            jQuery.ajax({
                                url: "/cart/add",
                                type: "post",
                                contentType: "application/json",
                                data: JSON.stringify(data),
                                dataType: "json",
                                success: function (jsonResult) {
                                    let totalItems = jsonResult.totalItems;
                                    jQuery("#totalCartItemId").html(totalItems);
                                    swal("Thêm vào giỏ hàng thành công", "Hoàn thành", "success");
                                },
                                error: function (jqXhr, textStatus, errorMessage) { // error callback
                                }
                            });
                        }

                    </script>

                    <script>
                        window.onload = function () {
                            let dates = document.querySelectorAll(".my-date > i");
                            for (let i = 0; i < dates.length; i++) {
                                let d = dates[i]
                                d.innerText = moment(d.innerText).fromNow()
                            }
                        }
                    </script>


                    <script type="text/javascript">
                        function saveComment(productId, event) {
                            let data = {
                                productId: productId,
                                content: $("#txtComment").val()
                            };

                            $.ajax({
                                url: "/reviewUser",
                                type: "post",
                                contentType: "application/json",
                                data: JSON.stringify(data),

                                dataType: "json",
                                success: function (jsonResult) {
                                    swal("Bình luận thành công", "Hoàn thành", "success");
                                    setTimeout(() => { window.location.href = `http://localhost:8081/productDetail/` + productId }, 2000);

                                },
                                error: function (jqXhr, textStatus, errorMessage) { // error callback 

                                }
                            });
                        }
                    </script>


                    <script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script>

                    <!-- JS -->
                    <jsp:include page="/views/user/layout/js.jsp"></jsp:include>

                    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

                </body>

                </html>
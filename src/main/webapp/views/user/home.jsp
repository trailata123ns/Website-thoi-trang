<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <!-- directive cua JSTL -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

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

                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modalmanager.min.js"
                        integrity="sha512-/HL24m2nmyI2+ccX+dSHphAHqLw60Oj5sK8jf59VWtFWZi9vx7jzoxbZmcBeeTeCUc7z1mTs3LfyXGuBU32t+w=="
                        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

                    <!-- <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> -->


                </head>

                <body>

                    <jsp:include page="/views/user/layout/header.jsp"></jsp:include>

                    <!-- Start Slider -->
                    <div id="slides-shop" class="cover-slides">
                        <ul class="slides-container">
                            <li class="text-left">
                                <img src="${base}/user/images/banner-01.jpg" alt="">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h1 class="m-b-20"><strong>Chào mừng bạn đến <br> Hades Shop</strong></h1>
                                            <p class="m-b-40">See how your users experience your website in realtime or
                                                view <br> trends to see any changes in performance over time.</p>
                                            <p><a class="btn hvr-hover" href="${base}/shop">Shop New</a></p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="text-center">
                                <img src="${base}/user/images/banner-02.jpg" alt="">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h1 class="m-b-20"><strong>Chào mừng bạn đến <br> Hades Shop</strong></h1>
                                            <p class="m-b-40">See how your users experience your website in realtime or
                                                view <br> trends to see any changes in performance over time.</p>
                                            <p><a class="btn hvr-hover" href="${base}/shop">Shop New</a></p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="text-right">
                                <img src="${base}/user/images/banner-03.jpg" alt="">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h1 class="m-b-20"><strong>Chào mừng bạn đến <br> Hades Shop</strong></h1>
                                            <p class="m-b-40">See how your users experience your website in realtime or
                                                view <br> trends to see any changes in performance over time.</p>
                                            <p><a class="btn hvr-hover" href="${base}/shop">Shop New</a></p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <div class="slides-navigation">
                            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
                        </div>
                    </div>
                    <!-- End Slider -->

                    <!-- Start Categories  -->
                    <!-- <div class="categories-shop">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Product Hot</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var="category" items="${listHotProduct}">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="shop-cat-box">
                            <img class="img-fluid" src="${base }/upload/${product.avatar}" alt="" />
                            <a class="btn hvr-hover" href="${base}/productDetail/${category.id}">${category.title}</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div> -->
                    <div class="products-box">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="title-all text-center">
                                        <h1>Sản phẩm bán chạy</h1>
                                        <p>Các sản phẩm đang thịnh hành</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="special-menu text-center">

                                    </div>
                                </div>
                            </div>

                            <div class="row special-list">
                                <c:forEach items="${listHotProduct}" var="product">

                                    <!-- Modal -->
                                    <!-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Thêm sản phẩm vào giỏ
                                                        hàng</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <table>

                                                        <tr
                                                            style="font-size:18px ; font-weight: bold; padding: 10px; margin-right: 10px;">
                                                            Vui lòng chọn size</tr>
                                                        <tr>
                                                            <select name="size" id="txtSize" style="padding: 10px ;width: 200px;
                                                            margin-left: 20px;">
                                                                <option value="S">S</option>
                                                                <option value="M">M</option>
                                                                <option value="L">L</option>
                                                                <option value="XL">XL</option>
                                                                <option value="XXL">XXL</option>
                                                            </select>
                                                        </tr>
                                                        <br><br>
                                                        <tr
                                                            style="font-size:18px ; font-weight: bold; padding: 10px; margin-right: 10px">
                                                            Số lượng
                                                        </tr>
                                                        <tr>
                                                            <input class="form-control" value="1" min="1" max="20"
                                                                type="number" name="keyword" id="sl">
                                                        </tr>

                                                    </table>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Đóng</button>
                                                    <button type="button" class="btn btn-primary"
                                                        onclick="addToCart(${product.id})">Thêm vào giỏ hàng</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->

                                    <div class="col-lg-3 col-md-6 special-grid best-seller">
                                        <div class="products-single fix">
                                            <div class="box-img-hover">
                                                
                                                <img src="${base }/upload/${product.avatar}" class="img-fluid"
                                                    alt="Image">
                                                <div class="mask-icon">
                                                    <ul>
                                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                                title="View"><i class="fas fa-eye"></i></a></li>
                                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                                title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                                title="Add to Wishlist"><i class="far fa-heart"></i></a>
                                                        </li>
                                                    </ul>
                                                    <!-- <button class="btn btn-primary" id="sw_al"
                                                        style=" position: absolute ;bottom:0 ;right: 0;"
                                                        data-toggle="modal" data-target="#exampleModal">
                                                        Thêm vào giỏ hàng
                                                    </button> -->
                                                </div>
                                            </div>
                                            <div class="why-text">
                                                <a href="${base}/productDetail/${product.id}">
                                                    <h4>${product.title }</h4>
                                                </a>
                                                <h5> <fmt:setLocale value = "vi_VN"/>
                                                    <fmt:formatNumber value = "${product.priceSale}" type ="NUMBER"/>₫</h5>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <!-- End Categories -->

                    <!-- Start Products  -->
                    <div class="products-box">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="title-all text-center">
                                        <h1>Sản phẩm nổi bật</h1>
                                        <p>Sản phẩm nổi bật trong tháng vừa qua</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="special-menu text-center">

                                    </div>
                                </div>
                            </div>

                            <div class="row special-list">
                                <c:forEach items="${listProduct.content}" var="product">
                                    <div class="col-lg-3 col-md-6 special-grid best-seller">
                                        <div class="products-single fix">
                                            <div class="box-img">
                                                <!-- <div class="type-lb">
                                                    <p class="sale">Giảm giá</p>
                                                </div> -->
                                                <img src="${base }/upload/${product.avatar}" class="img-fluid"
                                                    alt="Image">
                                                <!-- <div class="mask-icon">
                                                    <ul>
                                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                                title="View"><i class="fas fa-eye"></i></a></li>
                                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                                title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                                        <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                                title="Add to Wishlist"><i class="far fa-heart"></i></a>
                                                        </li>
                                                    </ul>
                                                    <button class="btn btn-primary" id="sw_al"
                                                        onclick="addToCart(${product.id},1)"
                                                        style=" position: absolute ;bottom:0 ;right: 0;">
                                                        Thêm vào giỏ hàng
                                                    </button>
                                                </div> -->
                                            </div>
                                            <div class="why-text">
                                                <a href="${base}/productDetail/${product.id}">
                                                    <h4>${product.title }</h4>
                                                </a>
                                               
                                                <h5>
                                                    <fmt:setLocale value = "vi_VN"/>
                                                    <fmt:formatNumber value = "${product.priceSale}" type ="NUMBER"/>đ
                                                </h5>
                                                    
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>


                            </div>
                        </div>
                    </div>
                    <!-- End Products  -->

                    <!-- Start Blog  -->
                    <div class="latest-blog">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="title-all text-center">
                                        <h1>Thông tin mới nhất</h1>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus
                                            enim.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-lg-4 col-xl-4">
                                    <div class="blog-box">
                                        <div class="blog-img">
                                            <img class="img-fluid" src="${base}/user/images/blog-img.jpg" alt="" />
                                        </div>
                                        <div class="blog-content">
                                            <div class="title-blog">
                                                <h3>Hades - Vietnamese Streetwear</h3>
                                                <p>Ra đời từ những năm cuối thế kỷ 20, streetwear là phong cách thời
                                                    trang phổ biến của cộng đồng đam mê bộ môn skateboard. Dù mới “bén
                                                    duyên” với giới...</p>
                                            </div>
                                            <ul class="option-blog">
                                                <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                        title="Likes"><i class="far fa-heart"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                        title="Views"><i class="fas fa-eye"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                        title="Comments"><i class="far fa-comments"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-4">
                                    <div class="blog-box">
                                        <div class="blog-img">
                                            <img class="img-fluid" src="${base}/user/images/blog-img-01.jpg" alt="" />
                                        </div>
                                        <div class="blog-content">
                                            <div class="title-blog">
                                                <h3>Hades Highshool Crew"</h3>
                                                <p>Tiếp tục thực hiện sứ mệnh "lan toả phong cách sống tích cực tới thế
                                                    hệ trẻ", Hades chính thức nhận lời mời đồng hành cùng High School
                                                    Best Dance...</p>
                                            </div>
                                            <ul class="option-blog">
                                                <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                        title="Likes"><i class="far fa-heart"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                        title="Views"><i class="fas fa-eye"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                        title="Comments"><i class="far fa-comments"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-4">
                                    <div class="blog-box">
                                        <div class="blog-img">
                                            <img class="img-fluid" src="${base}/user/images/blog-img-02.jpg" alt="" />
                                        </div>
                                        <div class="blog-content">
                                            <div class="title-blog">
                                                <h3>Hades Classic</h3>
                                                <p>Thời trang cổ điển là một trong những thuật ngữ chung chỉ những mẫu
                                                    trang phục từ những thập niên trước. Nói cách khác phong cách cổ
                                                    điển là kiểu thời trang khơi gợi những cái đẹp xưa cũ</p>
                                            </div>
                                            <ul class="option-blog">
                                                <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                        title="Likes"><i class="far fa-heart"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                        title="Views"><i class="fas fa-eye"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                        title="Comments"><i class="far fa-comments"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Blog  -->

                    <script>
                        function toVnd(a){
                            const formatter = new Intl.NumberFormat("vn");
                            formatter.format(a)
                            return a;
                        }
                    </script>

                    <script type="text/javascript">
                        function addToCart(productId) {
                            var a = document.getElementById("sl").value;
                            let data = {
                                productId: productId,
                                quanlity: a,
                                size: $("#txtSize").val(),
                            };
                            // $ === jQuery
                            // json == javascript object
                            jQuery.ajax({
                                url: "/cart/add",
                                type: "post",
                                contentType: "application/json",
                                data: JSON.stringify(data),
                                dataType: "json",
                                success: function (jsonResult) {
                                    let totalItems = jsonResult.totalItems;
                                    jQuery("#totalCartItemId").html(totalItems);
                                    //    alert(jsonResult.message);
                                    swal("Thêm vào giỏ hàng thành công", "Hoàn thành", "success");
                                },
                                error: function (jqXhr, textStatus, errorMessage) { // error callback
                                }
                            });
                        }

                        // function addToCart(productId , quantity) {
                        //     let data = {
                        //         productId: productId,
                        //         quanlity: quantity,
                        //         size: $("#txtSize").val(),
                        //     };
                        //     // $ === jQuery
                        //     // json == javascript object
                        //     jQuery.ajax({
                        //         url: "/cart/add",
                        //         type: "post",
                        //         contentType: "application/json",
                        //         data: JSON.stringify(data),
                        //         dataType: "json",
                        //         success: function (jsonResult) {
                        //             let totalItems = jsonResult.totalItems;
                        //             jQuery("#totalCartItemId").html(totalItems);
                        //             //    alert(jsonResult.message);
                        //             // swal("Thêm vào giỏ hàng thành công", "Hoàn thành", "success");
                        //         },
                        //         error: function (jqXhr, textStatus, errorMessage) { // error callback
                        //         }
                        //     });
                        // }


                    </script>


                    <!-- Footer -->

                    <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>

                    <!-- JS -->

                    <script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script>

                    <jsp:include page="/views/user/layout/js.jsp"></jsp:include>

                    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>



                </body>

                </html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

    <!-- CSS -->
        <jsp:include page="/views/user/layout/css.jsp"></jsp:include>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <jsp:include page="/views/user/layout/header.jsp"></jsp:include>

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Shop</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Shop</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Shop Page  -->
    <div class="shop-box-inner">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="search-product">
                            <form action="#">
                                <input class="form-control" placeholder="Search here..." type="text" name="keyword">
                                <button type="submit"> <i class="fa fa-search"></i> </button>
                            </form>
                        </div>
                        <div class="filter-sidebar-left">
                            <div class="title-left">
                                <h3>Danh mục</h3>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                <c:forEach var="cat" items="${categories.content}">
                                    <a style="font-size: 18px; font-weight: bold;" href="${base}/shop/${cat.id}" class="list-group-item list-group-item-action"> ${cat.name}<small class="text-muted"> (${cat.getProducts().size()})</small></a>
                                </c:forEach>
                            
                            </div>
                        </div>
                        <!-- <div class="filter-price-left">
                            <div class="title-left">
                                <h3>Price</h3>
                            </div>
                            <div class="price-box-slider">
                                <div id="slider-range"></div>
                                <p>
                                    <input type="text" id="amount" readonly style="border:0; color:#fbb714; font-weight:bold;">
                                    <button class="btn hvr-hover" type="submit">Filter</button>
                                </p>
                            </div>
                        </div> -->
                        <!-- <div class="filter-brand-left">
                            <div class="title-left">
                                <h3>Brand</h3>
                            </div>
                            <div class="brand-box">
                                <ul>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios1" value="Yes" type="radio">
                                            <label for="Radios1"> Supreme </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios2" value="No" type="radio">
                                            <label for="Radios2"> A Bathing Ape </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios3" value="declater" type="radio">
                                            <label for="Radios3"> The Hundreds </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios4" value="declater" type="radio">
                                            <label for="Radios4"> Alife </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios5" value="declater" type="radio">
                                            <label for="Radios5"> Neighborhood </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios6" value="declater" type="radio">
                                            <label for="Radios6"> CLOT </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios7" value="declater" type="radio">
                                            <label for="Radios7"> Acapulco Gold </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios8" value="declater" type="radio">
                                            <label for="Radios8"> UNDFTD </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios9" value="declater" type="radio">
                                            <label for="Radios9"> Mighty Healthy </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios10" value="declater" type="radio">
                                            <label for="Radios10"> Fiberops </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div> -->

                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                    <div class="right-product-box">
                        <div class="product-item-filter row">
                            <div class="col-12 col-sm-8 text-center text-sm-left">
                                <div class="toolbar-sorter-right">
                                    <span>Sắp xếp:</span>
                                    <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD" name="orderBy" onchange="onlickOrderBy(event)">
									<option data-display="Select" value="0">Tất cả</option>
									<option value="1">Giá cao đến thấp</option>
									<option value="2">Giá thấp đến cao</option>
									<option value="3">Tên từ A-Z</option>
									<!-- <option value="4">Best Selling</option> -->
								</select>
                                </div>
                            </div>
                            <div class="col-12 col-sm-4 text-center text-sm-right">
                                <ul class="nav nav-tabs ml-auto">
                                    <li>
                                        <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
                                    </li>
                                    <li>
                                        <a class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <c:if test="${empty listProduct}">
                            <h2>Không có sản phẩm nào thuộc danh mục này</h2>
                        </c:if>

                        <c:if test="${not empty listProduct}">
                            <div class="row product-categorie-box">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                        <div class="row">
                                            <c:forEach var="product" items="${listProduct}">

                                                    <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                        <div class="products-single fix">
                                                            <div class="box-img">
                                                                <!-- <div class="type-lb">
                                                                    <p class="sale">Sale</p>
                                                                </div> -->
                                                                <img src="${base }/upload/${product.avatar}" class="img-fluid" alt="Image">
                                                                <!-- <div class="mask-icon">
                                                                    <ul>
                                                                        <li><a href="#${base}/productDetail/${product.id} data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                    </ul>
                                                                    <button class="btn btn-primary" onclick="addToCart(${product.id},1)" style=" position: absolute ;bottom:0 ;right: 0;">
                                                                        Thêm vào giỏ hàng
                                                                    </button>
                                                                    
                                                                </div> -->
                                                            </div>
                                                            <div class="why-text">
                                                                <a href="${base}/productDetail/${product.id}"><h4>${product.title} </h4></a>
                                                                <h5><fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${product.priceSale}" type ="NUMBER"/>₫</h5>
                                                            </div>
                                                        </div>
                                                    </div>

                                            </c:forEach>
    
                                    </div>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                          <li class="page-item"><a class="page-link" href="${base }/shop?page=${p-1 }&order=${od}">Previous</a></li>
                                          <c:forEach items="${listPage}" var="p">
                                                <li class="page-item"><a class="page-link" href="${base }/shop?page=${p }&order=${od}" >${p }</a></li>
                                          </c:forEach>
                                         
                                          <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                        </ul>
                                      </nav>
                                    
                                </div>
                            </div>
    
                        </div>
                        </c:if>

                    <br>
                    <br>

                </div>
            </div>
        </div>
    </div>
    <!-- End Shop Page -->

    <!-- Footer -->
        <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>

    <!-- JS -->
        <jsp:include page="/views/user/layout/js.jsp"></jsp:include>

        <script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script> 

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

    <script type="text/javascript">
        function addToCart(productId,quanlity) {
              let data = {
                   productId: productId,
                   quanlity: quanlity	
               };
               // $ === jQuery
               // json == javascript object
                jQuery.ajax({
                   url : "/cart/add",
                   type : "post",
                   contentType : "application/json",
                   data : JSON.stringify(data),
                   dataType : "json", 
                   success : function(jsonResult) {
                       let totalItems = jsonResult.totalItems;
                       jQuery("#totalCartItemId").html(totalItems);
                       swal ("Thêm vào giỏ hàng thành công","Hoàn thành","success");
                   },
                   error : function(jqXhr, textStatus, errorMessage) { // error callback
                   } 
               });    
        }

        function onlickOrderBy(event){
            console.log(event.target.value);
            console.log("event.target.value");
            
            var a = `http://localhost:8081/shop?orderBy=`+event.target.value;
            console.log(a);
            window.location.href=a;
        }
   </script>

</body>
</html>
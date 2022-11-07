<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Detail Order - SB Admin</title>
        <!-- VARIABLES -->
		<jsp:include page="/views/common/variables.jsp"></jsp:include>
		
		<!-- CSS -->
		<jsp:include page="/views/user/layout/css.jsp"></jsp:include>
        
    </head>
    <body class="sb-nav-fixed">
        <!-- HEADER -->
        <jsp:include page="/views/user/layout/header.jsp"></jsp:include>
        <div id="layoutSidenav">

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Detail Order</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Chi tiết đơn hàng</li>
                        </ol>
                        
                        <h3 align="center">Chi tiết đơn hàng</h3>
                        
                        <p>
                        	
                        	<table class="table table-striped table-dark">
								  <thead>
								    <tr>
								      <th scope="col">Mã sản phẩm</th>
								      <th scope="col">Tên sản phẩm</th>
								      <th scope="col">Hình ảnh</th>
								      <th scope="col">Số lượng</th>
								      <th scope="col">Giá bán</th>
								      <th scope="col">Thành tiền</th>
								    </tr>
								  </thead>
								  <c:forEach var="product" items="${list }">
                        	
								  <tbody>
								    <tr>
								      <th scope="row">${product.getProduct().id }</th>
								      <td>${product.getProduct().title }</td>
								      <td><img style="width: 100px; height: auto;" src="${base }/upload/${product.getProduct().getAvatar()}" alt="" /></td>
								      <td>${product.quality }</td>
								      <td>${product.getProduct().getPriceSale() }</td>
								      <td>${product.quality * product.getProduct().getPriceSale() }</td>
								      <td>
								      </td>
								    </tr>
								    
								  </tbody>
								  </c:forEach>
								  <tr>
                      <td colspan="6" style="text-align: right;">
                          Tổng tiền: ${saleOrder.total}
                      </td>
								  </tr>
                    
								</table>
                                
                        </p>
                        
                    </div>
                </main>
                
                <!-- Footer -->
                <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>
            </div>
        </div>
        <!-- JAVASCRIPT -->
        <jsp:include page="/views/user/layout/js.jsp"></jsp:include>
    </body>
</html>
	
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

	<!-- directive cua JSTL -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<!DOCTYPE html>
				<html lang="en">

				<head>
					<meta charset="utf-8" />
					<meta http-equiv="X-UA-Compatible" content="IE=edge" />
					<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
					<meta name="description" content="" />
					<meta name="author" content="" />
					<title>Danh sách sản phẩm</title>

					<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">	

					<!-- VARIABLES -->
					<jsp:include page="/views/common/variables.jsp"></jsp:include>

					<!-- CSS -->
					<jsp:include page="/views/manager/layout/css.jsp"></jsp:include>

					<style>
						.toggle.ios, .toggle-on.ios, .toggle-off.ios { border-radius: 20px; }
						.toggle.ios .toggle-handle { border-radius: 20px; }
					  </style>

				</head>

				<body class="sb-nav-fixed">
					<!-- HEADER -->
					<jsp:include page="/views/manager/layout/header.jsp"></jsp:include>
					<div id="layoutSidenav">
						<div id="layoutSidenav_nav">
							<!-- MENU -->
							<jsp:include page="/views/manager/layout/menu.jsp"></jsp:include>
						</div>
						<div id="layoutSidenav_content">
							<main>
								<div class="container-fluid">
									<h1 class="mt-4">Sản phẩm</h1>
									<ol class="breadcrumb mb-4">
										<li class="breadcrumb-item"><a href="${base}/admin/index">Dashboard</a></li>
										<li class="breadcrumb-item active">Sản phẩm / Danh sách sản phẩm</li>
									</ol>
									<!-- <form action="">
							<input type="text" name="pageNumber">
							<input type="submit" value="Check">
						</form> -->
									<h3 align="center">Danh sách sản phẩm</h3>
									<form action="${base }/admin/list-product" method="get">
										<label>Tìm kiếm sản phẩm: </label>
										<input type="text" name="keyword" /> <!-- Keyword lấy theo parameter  -->
										<button type="submit" class="btn btn-info">Tìm kiếm</button>
										<a href="${base }/admin/add-product" class="btn btn-primary">Thêm mới sản
											phẩm</a>
										<p>
											<!-- Để dùng đc jstl thì phải include nó vào -->
										<table class="table table-striped table-dark">
											<thead>
												<tr>
													<th scope="col">Mã SP</th>
													<th scope="col">Tiêu đề</th>
													<th scope="col">Giá</th>
													<th scope="col">Giảm giá</th>
													<th scope="col">Mô tả ngắn</th>
													<th scope="col">Mô tả chi tiết</th>
													<th scope="col">Ảnh đại diện</th>
													<th scope="col">Thương hiệu</th>
													<th scope="col">Status</th>
													<th scope="col">Thao tác</th>
												</tr>
											</thead>
											<c:forEach var="product" items="${products }">
												<!-- items ở đây là biến mà ta đẩy từ thằng controller -->
												<%-- <p>${category.name }</p>
													<p>${category.description }</p> --%>

													<tbody>
														<tr>
															<th scope="row">${product.id }</th>
															<td>${product.title }</td>
															<td> <fmt:setLocale value = "vi_VN"/>
																<fmt:formatNumber value = "${product.price }" type ="NUMBER"/></td>
															<td>
																<fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${product.priceSale }" type ="NUMBER"/>
																</td>
															<td>${product.shortDescription }</td>
															<td>${product.details }</td>
															<td>
																<img alt="" width="50px"
																	src="${base }/upload/${product.avatar}" />
															</td>
															<td>${product.categories.name }</td>
															<td>
																<c:choose>
																	<c:when test="${product.status}">
																		<input onchange="changeStatus(${product.id })" type="checkbox" checked data-toggle="toggle" data-style="ios">
																	</c:when>
																	<c:otherwise>
																		<input onchange="changeStatus(${product.id })" type="checkbox" data-toggle="toggle" data-style="ios">
																	</c:otherwise>
																</c:choose>
																
															</td>
															<td>

																<a href="${base }/admin/delete/${product.id}"
																	 class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm?')" >Xóa</a>
																<a href="${base }/admin/edit-product/${product.id }"
																	class="btn btn-success">Sửa</a>
															</td>
														</tr>

													</tbody>
											</c:forEach>
										</table>
										<nav aria-label="Page navigation example">
											<ul class="pagination">
												<li class="page-item"><a class="page-link"
														href="${base }/admin/list-product?page=${p-1 }">Previous</a>
												</li>
												<c:forEach items="${listPage}" var="p">
													<li class="page-item"><a class="page-link"
															href="${base }/admin/list-product?page=${p }">${p }</a></li>
												</c:forEach>

												<li class="page-item"><a class="page-link" href="#">Next</a></li>
											</ul>
										</nav>
										</p>
									</form>
								</div>
							</main>
							<!-- Footer -->
							<jsp:include page="/views/manager/layout/footer.jsp"></jsp:include>
						</div>
					</div>
					<!-- JAVASCRIPT -->
					<jsp:include page="/views/manager/layout/js.jsp"></jsp:include>
					<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>	
					
					<script>
						$(function() {
						  $('#toggle-event').change(function() {
							// $('#console-event').html('Toggle: ' + $(this).prop('checked'))
						  })
						})

						function changeStatus(productId) {
							GrowlNotification.notify({
								description: 'Thay đổi trạng thái thành công',
								type: 'success',
								position: 'top-right',
								closeTimeout: 3000
							});

							setTimeout(() => {window.location.href = `http://localhost:8081/admin/changeStatusProduct?id=` + productId;},1500);
							}

					  </script>


				</body>

				</html>
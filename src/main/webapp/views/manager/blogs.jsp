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
									<h1 class="mt-4">Blogs</h1>
									<ol class="breadcrumb mb-4">
										<li class="breadcrumb-item"><a href="${base}/admin/index">Dashboard</a></li>
										<li class="breadcrumb-item active">Cửa hàng / Danh sách Blog</li>
									</ol>
									<!-- <form action="">
							<input type="text" name="pageNumber">
							<input type="submit" value="Check">
						</form> -->
									<h3 align="center">Danh sách Blog</h3>

									<div class="card-header">
										<i class="fas fa-table mr-1"></i>
				
									</div>
									<table id="dtBasicExample" class="table table-striped table-bordered table-sm"
										cellspacing="0" width="100%">
										<thead>
											<tr>
												<th class="th-sm">Mã

												</th>
												<th class="th-sm">Ảnh đại diện

												</th>
												<th class="th-sm">Tiêu đề

												</th>
												<th class="th-sm">Nội dung

												</th>
												<th class="th-sm">Trạng thái

												</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${blogs}" var="re">
												<tr>
													<td>${re.id}</td>
													<td>
														<img src="${base }/upload/${re.avatar}"
															class="img-fluid" alt="Image"
															style="width: 100px; height: auto;">
													</td>
													<td>${re.title}</td>
													<td>${re.content}</td>
													<td>
														<c:choose>
															<c:when test="${re.status}" >
																<input onclick="changeStatus()" type="checkbox" checked data-toggle="toggle" data-style="ios">
															</c:when>
															<c:otherwise>
																<input onclick="changeStatus()" type="checkbox" data-toggle="toggle" data-style="ios">
															</c:otherwise>
														</c:choose>

													</td>
												</tr>
											</c:forEach>

										</tbody>

									</table>
									
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

						function changeStatus() {
							GrowlNotification.notify({
								description: 'Thay đổi trạng thái thành công',
								type: 'success',
								position: 'top-right',
								closeTimeout: 3000
							});
							}

					  </script>


				</body>

				</html>
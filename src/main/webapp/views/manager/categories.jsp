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
        <title>Category - SB Admin</title>
        <!-- VARIABLES -->
		<jsp:include page="/views/common/variables.jsp"></jsp:include>
		
		<!-- CSS -->
		<jsp:include page="/views/manager/layout/css.jsp"></jsp:include>
        
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
                        <h1 class="mt-4">Category</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="${base}/admin/index">Dashboard</a></li>
                            <li class="breadcrumb-item active">Danh mục / Danh sách danh mục</li>
                        </ol>
                        
                        <h3 align="center">Danh sách danh mục</h3>
                        <form action="${base }/admin/categories" method="get">
                      	<label>Tìm kiếm danh mục: </label>
                        <input type="text" name="keyword" /> <!-- Keyword lấy theo parameter  -->
                        <button type="submit" class="btn btn-info">Tìm kiếm</button>
                        <a href="${base }/admin/add-category" class="btn btn-primary">Thêm mới danh mục</a>
                        <p>
                        	<!-- Để dùng đc jstl thì phải include nó vào -->
                        	<table class="table table-striped table-dark">
								  <thead>
								    <tr>
								      <th scope="col">Mã danh mục</th>
								      <th scope="col">Tên danh mục</th>
								      <th scope="col">Mô tả</th>
								      <th scope="col">Thao tác</th>
								    </tr>
								  </thead>
								  <c:forEach var="category" items="${categories }">
                        			<!-- items ở đây là biến mà ta đẩy từ thằng controller -->
                        		<%-- <p>${category.name }</p>
                        		<p>${category.description }</p> --%>
                        	
								  <tbody>
								    <tr>
								      <th scope="row">${category.id }</th>
								      <td>${category.name }</td>
								      <td>${category.description }</td>
								      <td>
								      	<a href="${base }/admin/del-category/${category.id}" class="btn btn-danger"  onclick="return confirm('Bạn có chắc muốn xóa danh mục này?')" >Xóa danh mục</a>
								      	<a href="${base }/admin/edit-category/${category.id}" class="btn btn-success">Sửa danh mục</a>
								      </td>
								    </tr>
								    
								  </tbody>
								  </c:forEach>
								</table>
                        		<nav aria-label="Page navigation example">
								  <ul class="pagination">
								    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
								    <c:forEach items="${listPage}" var="p">
								    	  <li class="page-item"><a class="page-link" href="${base }/admin/categories?page=${p }" >${p }</a></li>
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
    </body>
</html>
	
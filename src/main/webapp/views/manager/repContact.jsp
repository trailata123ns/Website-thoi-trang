<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
	<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- VARIABLES -->
<jsp:include page="/views/common/variables.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Trả lời phản hồi</title>
        
        
		
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
                        <h1 class="mt-4">Trả lời phản hồi của khách hàng</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="${base}/admin/index">Dashboard</a></li>
                            <li class="breadcrumb-item active">Hỗ trợ / Trả lời hỗ trợ</li>
                        </ol>
    <div class="col-md-9 contact-form">
    
    <form action="${base }/admin/reply-category/{id}" method="POST">

        <div class="col-md-12 ">
            <!-- <form class="register-form" role="form"> -->
                <div class="form-group">
                <label class="info-title" for="exampleInputName">Email khách hàng: (required) <span></span></label>
                <input type="text" readonly name="email" value="${contact.email}" class="form-control unicase-form-control text-input" id="exampleInputName"/>
              </div>
            <!-- </form> -->
        </div>
    
        <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            <div class="form-group">
            <label class="info-title" for="exampleInputName">Tiêu đề: (required) <span></span></label>
            <input type="text" name="rep" class="form-control unicase-form-control text-input" id="exampleInputName"/>
          </div>
        <!-- </form> -->
    </div>
    
    <div class="col-md-12">
        <div class="register-form" role="form">
            <div class="form-group">
            <label class="info-title" for="exampleInputDetail">Mô tả chi tiết: (required) </label>
            <textarea name="description" class="form-control unicase-form-control" id="exampleInputDetail"></textarea>
          </div>
        </div>
    </div>
    
    
    <div class="col-md-12 outer-bottom-small m-t-20">
        <a href="${base }/admin/contact" class="btn-upper btn btn-secondary checkout-page-button">Back To List</a>

        <button  class="btn-upper btn btn-primary checkout-page-button">Gửi</button>
    </div>
    <form>
</div>
                    </div>
                </main>
                <!-- FOOTER -->
        		<jsp:include page="/views/manager/layout/footer.jsp"></jsp:include>
            </div>
        </div>
        <!-- JAVASCRIPT -->
        <jsp:include page="/views/manager/layout/js.jsp"></jsp:include>
    </body>
</html>
	
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	<!-- directive SPRING-FORM -->
	<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Add-Product - SB Admin</title>
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
                        <h1 class="mt-4">Thêm sản phẩm</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="${base}/admin/index">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Sản phẩm / Thêm sản phẩm</li>
                        </ol>
    <div class="col-md-9 contact-form">
    
    <sf:form action="${base}/admin/add-product" modelAttribute="product" enctype="multipart/form-data">
    
    	<sf:hidden path="id"/>
        <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            <div class="form-group">
            <label class="info-category" for="exampleInputCategory">Danh mục (required)<span></span></label>
            <%-- <sf:select path="categories.id" name="" id="" style="width: 100%;height: 40px;border: 1px solid #eee;border-radius: 5px; outline: none;">
                <sf:options value ="${categories }" itemValue ="id" itemLabel ="name"/>
                
            </sf:select> --%>
            <sf:select path="categories.id" class="form-control" id="category">
       			<sf:options items="${categories }" itemValue="id" itemLabel="name" />
			</sf:select>
          </div>
        <!-- </form> -->
        </div>
        <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            <div class="form-group">
            <label class="info-title" for="exampleInputTitle">Tiêu đề * <span></span></label>
            <sf:input path="title" type="text" class="form-control unicase-form-control text-input" onblur="checkrong()" id="exampleInputTitle" placeholder="Tên sản phẩm"/>
            <form:errors path="title"></form:errors>
        </div>
        <!-- </form> -->
    </div>
    <div class="col-md-12 ">
        <!-- <form class="register-form" role="form"> -->
            <div class="form-group">
            <label class="info-title" for="exampleInputPrice">Giá bán * </label>
            <sf:input path="price" type="number" class="form-control unicase-form-control text-input" onblur="checkrongPrice()" id="txtPrice" placeholder="Giá"/>
            <form:errors path="price"></form:errors>
        </div>
        <!-- </form> -->
    </div>
    <div class="col-md-12">
        <div class="register-form" role="form">
            <div class="form-group">
            <label class="info-title" for="exampleInputEmail1">Giảm giá * </label>
            <sf:input path="priceSale" type="input" class="form-control unicase-form-control text-input" onblur="checkrongPriceSale()" id="exampleInputPriceSale" placeholder="Giảm giá"/>
            <form:errors path="priceSale"></form:errors>
        </div>
        </div>
    </div>

    <div class="col-md-12">
        <div class="register-form" role="form">
            <div class="form-group">
            <label class="info-title" for="exampleInputEmail1">Số lượng * </label>
            <sf:input path="quantity" type="input" class="form-control unicase-form-control text-input" onblur="checkrongQuantity()" id="quantity" placeholder="Số lượng"/>
            <form:errors path="priceSale"></form:errors>
        </div>
        </div>
    </div>

    
    <div class="col-md-12">
        <div class="register-form" role="form">
            <div class="form-group">
            <label class="info-title" for="exampleInputTitle">Mô tả ngắn *</label>
            <sf:textarea path="shortDescription" class="form-control unicase-form-control" onblur="checkrongSDes()" id="exampleInputShortDescription" placeholder="Mô tả ngắn"></sf:textarea>
            <form:errors path="shortDescription"></form:errors>
        </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="register-form" role="form">
            <div class="form-group">
            <label class="info-title" for="exampleInputDetail">Chi tiết mô tả * </label>
            <%-- <sf:textarea path="details" class="form-control unicase-form-control" onblur="checkrongDes()" id="exampleInputDetail" placeholder="Mô tả chi tiết vấn đề của bạn"></sf:textarea> --%>
            <!-- <div id="summernote">Summernote</div> -->
            <sf:textarea path="details" id="summernote" name="editordata"></sf:textarea>
            <form:errors path="details"></form:errors>
        </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="register-form" role="form">
            <div class="form-group">
                <sf:checkbox path="isHot" name="exampleInputCheckbox"/>
                <label class="info-title" for="exampleInputCheckbox">Sản phẩm nổi bật </label>
          </div>
        </div>
    </div>
    <div class="col-md-12">
    <div class="form-group">
        <label for="inputFile">Ảnh đại diện</label>
        <input id="inputFile" name="inputAvatar" type="file" class="form-control-file" ">
    </div>
    </div>
    <div class="col-md-12">
    <div class="form-group">
        <label for="inputFile">Ảnh sản phẩm</label>
        <input id="inputFile" name="inputPictures" type="file" class="form-control-file" multiple="multiple">
    </div>
    </div>
    <div class="col-md-12 outer-bottom-small m-t-20">
    	<a href="${base }/admin/list-product" class="btn-upper btn btn-secondary checkout-page-button">Quay lại</a>
        <a href="${base }/admin/list-product"><sf:button  class="btn-upper btn btn-primary checkout-page-button" >Gửi</sf:button></a>
    </div>
    </sf:form>
</div>
                        
                        
</div>
</main>
             <!-- FOOTER -->
        	<jsp:include page="/views/manager/layout/footer.jsp"></jsp:include>
            </div>
        </div>
        <!-- JAVASCRIPT -->
        <jsp:include page="/views/manager/layout/js.jsp"></jsp:include>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
		<script type="text/javascript">
			//$('#summernote').summernote();
			$(document).ready(function() {
			    $('#summernote').summernote({
			      placeholder: 'mô tả chi tiết....',
			      tabsize: 2,
			      height: 200,
			      minHeight: 100,
			      maxHeight: 300,
			      focus: true,
			      
			    });
			  
			});
		</script>

        <script>
            function checkrong() {

                let title = $('#exampleInputTitle').val();

                if (title == '') {
                    GrowlNotification.notify({
                        description: 'Tiêu đề không được để trống !',
                        type: 'error',
                        position: 'top-right',
                        closeTimeout: 2500
                    });
                }
                
            }

            function checkrongPrice() {
                let price = $('#txtPrice').val();
                if (price == '' || price <= 0) {
                    GrowlNotification.notify({
                        description: 'Giá không hợp lệ !',
                        type: 'error',
                        position: 'top-right',
                        closeTimeout: 2500
                    });
                }
            }

            function checkrongQuantity() {
                let quantity = $('#quantity').val();
                if (quantity == '' || quantity <= 0) {
                    GrowlNotification.notify({
                        description: 'Số lượng không hợp lệ !',
                        type: 'error',
                        position: 'top-right',
                        closeTimeout: 2500
                    });
                }
            }

            function checkrongPriceSale() {
                 
                let priceSale = $('#exampleInputPriceSale').val();
                let price1 = $('#txtPrice').val();

                if (priceSale > price1 ) {
                    GrowlNotification.notify({
                        description: 'Giá giảm phải nhỏ hơn giá bán',
                        type: 'error',
                        position: 'top-right',
                        closeTimeout: 2500
                    });
                }
                
            }

            function checkrongSDes() {
                let shortDes = $('#exampleInputShortDescription').val();
                if (shortDes == '') {
                    GrowlNotification.notify({
                        description: 'Mô tả ngắn không được để trống !',
                        type: 'error',
                        position: 'top-right',
                        closeTimeout: 2500
                    });
                }
            }

            function checkrongDes() {
                let des = $('#summernote').val();
                if (des == '') {
                    GrowlNotification.notify({
                        description: 'Mô tả không được để trống !',
                        type: 'error',
                        position: 'top-right',
                        closeTimeout: 2500
                    });
                }

            }

        </script>

    </body>
</html>

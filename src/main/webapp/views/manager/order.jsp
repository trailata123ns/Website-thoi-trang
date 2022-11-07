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
          <title>Hades Store</title>
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
                  <h1 class="mt-4">Đơn hàng</h1>
                  <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="${base}/admin/index">Dashboard</a></li>
                    <li class="breadcrumb-item active">Đơn hàng / Danh sách đơn hàng đã xác nhận</li>
                  </ol>

                  <h3 align="center">Danh sách đơn hàng đã xác nhận</h3>

                  <p>

                  <table class="table table-striped table-dark">
                    <thead>
                      <tr>
                        <th scope="col">Mã đơn hàng</th>
                        <th scope="col">Tên người đặt</th>
                        <th scope="col">Địa chỉ</th>
                        <th scope="col">Số điện thoại</th>
                        <th scope="col">Email</th>
                        <th scope="col">Thành tiền</th>
                        <th scope="col">Thao tác</th>
                      </tr>
                    </thead>
                    <c:forEach var="order" items="${listOrder.content }">

                      <tbody>
                        <c:if test="${order.status }">
                          <tr>
                            <th scope="row">${order.id }</th>
                            <td>${order.customerName }</td>
                            <td>${order.customerAddress }</td>
                            <td>${order.customerPhone }</td>
                            <td>${order.customerEmail }</td>
                            <td><fmt:setLocale value = "vi_VN"/>
                              <fmt:formatNumber value = "${order.total }" type ="NUMBER"/></td>
                            <td>
                              <a href="${base }/admin/detailOrder/${order.id}" class="btn btn-success">Chi tiết</a>
                            </td>
                          </tr>
                        </c:if>
                        
                      </tbody>
                    </c:forEach>
                  </table>
                  <!-- Panigation -->
                  <nav aria-label="Page navigation example">
                      <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="/admin/order?p=0">First</a></li>
                        <li class="page-item"><a class="page-link"
                            href="/admin/order?p=${listOrder.number - 1}">Previous</a></li>
                        <li class="page-item"><a class="page-link"
                            href="/admin/order?p=${contactList.number + 1}">Next</a></li>
                        <li class="page-item"><a class="page-link"
                            href="/admin/order?p=${contactList.totalPages - 1}">Last</a></li>
                      </ul>
                  </nav>
                  </p>

                </div>
              </main>

              <!-- Footer -->
              <jsp:include page="/views/manager/layout/footer.jsp"></jsp:include>
            </div>
          </div>
          <!-- JAVASCRIPT -->
          <jsp:include page="/views/manager/layout/js.jsp"></jsp:include>

          <script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script>

          <script>
            function onlickUpdate() {
              // event.preventDefault();
              // var a = document.querySelector('.form-signin');
              swal({
                title: "Đã xác nhận đơn hàng",
                text: "Thành công",
                icon: "success",
                button: "Trờ lại",
              });
              //  setTimeout(() => {a.submit()}, 2500);
            }
          </script>

        </body>

        </html>
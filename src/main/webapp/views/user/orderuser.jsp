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
          <jsp:include page="/views/user/layout/css.jsp"></jsp:include>

        </head>

        <body class="sb-nav-fixed">
          <!-- HEADER -->
          <jsp:include page="/views/user/layout/header.jsp"></jsp:include>
          <div id="layoutSidenav">

            <div id="layoutSidenav_content">
              <main>
                <div class="container-fluid">
                  <h1 class="mt-4">Thông tin đặt hàng</h1>
                  <ol class="breadcrumb mb-4">

                    <li class="breadcrumb-item active">Danh sách đơn hàng đã đặt</li>
                  </ol>

                  <h3 align="center">Danh sách</h3>

                  <c:choose>

                    <c:when test="${isLogined }">
                      
                      <!-- <input type="hidden" name="email" value="${email}" /> -->
                      <p>${userLogined.email}</p>
                    
                    </c:when>

                    <c:otherwise>
                      <form action="${base }/user/order" method="get">
                        <label>Vui lòng nhập email đặt hàng: </label>
                        <input type="text" name="keyword" />
                        <button type="submit" class="btn btn-info">Tìm kiếm</button>
                      </form>
                    </c:otherwise>
                  </c:choose>

                  <br />

                  <p>

                  <table class="table table-striped table-dark">
                    <thead>
                      <tr>
                        <th scope="col">Mã đơn hàng</th>
                        <th scope="col">Tài khoản</th>
                        <th scope="col">Địa chỉ</th>
                        <th scope="col">Số điện thoại</th>
                        <th scope="col">Email đặt hàng</th>
                        <th scope="col">Tổng tiền</th>
                        <th scope="col">Thao tác</th>
                      </tr>
                    </thead>
                    <c:forEach var="order" items="${listOrder }">
                      <tbody>
                        <tr>
                          <th scope="row">${order.id }</th>
                          <td>${order.customerName }</td>
                          <td>${order.customerAddress }</td>
                          <td>${order.customerPhone }</td>
                          <td>${order.customerEmail }</td>
                          <td>${order.total }</td>
                          <td>
                            <a href="${base }/user/detailOrderUser/${order.id}" class="btn btn-success">Xem chi tiết</a>
                            <c:if test="${order.status==false}">
                              <c:if test="${order.updatedBy==null}">
                                <a href="#" class="btn btn-primary" >Chờ xác nhận</a>
                              </c:if>
                            </c:if>

                            <c:if test="${order.status==false}">
                              <c:if test="${order.updatedBy==1}">
                                <a href="#" class="btn btn-danger" >Đã hủy</a>
                              </c:if>
                            </c:if>

                            <c:if test="${order.status}">
                              <a href="#" class="btn btn-primary" >Đã xác nhận</a>
                            </c:if>
                          </td>
                        </tr>

                      </tbody>
                    </c:forEach>
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
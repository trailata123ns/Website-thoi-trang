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
                  <h1 class="mt-4">Hỗ trợ</h1>
                  <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="${base}/admin/index">Dashboard</a></li>
                    <li class="breadcrumb-item active">Hỗ trợ / Danh sách hỗ trợ</li>
                  </ol>

                  <h3 align="center">Danh sách hỗ trợ</h3>
                  <form action="${base }/admin/categories" method="get">
                    <p>
                      <!-- Để dùng đc jstl thì phải include nó vào -->
                    <table class="table table-striped table-dark">
                      <thead>
                        <tr>
                          <th scope="col">Mã</th>
                          <th scope="col">Tên người gửi</th>
                          <th scope="col">Email</th>
                          <th scope="col">Tiêu đề </th>
                          <th scope="col">Nội dung</th>
                          <th scope="col">Thao tác</th>
                        </tr>
                      </thead>
                      <c:forEach var="contact" items="${contactList.content }">
                        <!-- items ở đây là biến mà ta đẩy từ thằng controller -->


                        <tbody>
                          <tr>
                            <th scope="row">${contact.id }</th>
                            <td>${contact.lastName }</td>
                            <td>${contact.email }</td>
                            <td>${contact.requestType }</td>
                            <td>${contact.message }</td>
                            <td>
                              <a href="${base }/admin/del-contact/${contact.id}" class="btn btn-danger">Xóa</a>
                              <a href="${base }/admin/reply-category/${contact.id}?email=${contact.email}&id=${contact.id}"
                                class="btn btn-success">Trả lời</a>
                            </td>
                          </tr>

                        </tbody>
                      </c:forEach>
                    </table>
                    <nav aria-label="Page navigation example" style="margin-right: 0;">
                      <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="/admin/contact?p=0">First</a></li>
                        <li class="page-item"><a class="page-link"
                            href="/admin/contact?p=${contactList.number - 1}">Previous</a></li>
                        <li class="page-item"><a class="page-link"
                            href="/admin/contact?p=${contactList.number + 1}">Next</a></li>
                        <li class="page-item"><a class="page-link"
                            href="/admin/contact?p=${contactList.totalPages - 1}">Last</a></li>
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
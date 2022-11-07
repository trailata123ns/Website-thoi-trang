<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

  <!-- directive cua JSTL -->
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!-- directive SPRING-FORM -->
        <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
          <!-- VARIABLES -->
          <jsp:include page="/views/common/variables.jsp"></jsp:include>
          <jsp:include page="/views/user/layout/css.jsp"></jsp:include>

          <!DOCTYPE html>
          <html lang="en">

          <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">
            <title>Please register</title>
            <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
              crossorigin="anonymous">
            <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet"
              crossorigin="anonymous" />
            <style>
              body {
                background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');

              }

              :root {
                --input-padding-x: 1.5rem;
                --input-padding-y: .75rem;
              }


              .card-signin {
                border: 0;
                border-radius: 1rem;
                box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
                overflow: hidden;
              }

              .card-signin .card-title {
                margin-bottom: 2rem;
                font-weight: 300;
                font-size: 1.5rem;
              }

              .card-signin .card-img-left {
                width: 45%;
                /* Link to your background image using in the property below! */
                background: scroll center url('https://source.unsplash.com/WEQbe2jBg40/414x512');
                background-size: cover;
              }

              .card-signin .card-body {
                padding: 2rem;
              }

              .form-signin {
                width: 100%;
              }

              .form-signin .btn {
                font-size: 80%;
                border-radius: 5rem;
                letter-spacing: .1rem;
                font-weight: bold;
                padding: 1rem;
                transition: all 0.2s;
              }

              .form-label-group {
                position: relative;
                margin-bottom: 1rem;
              }

              .form-label-group input {
                height: auto;
                border-radius: 2rem;
              }

              .form-label-group>input,
              .form-label-group>label {
                padding: var(--input-padding-y) var(--input-padding-x);
              }

              .form-label-group>label {
                position: absolute;
                top: 0;
                left: 0;
                display: block;
                width: 100%;
                margin-bottom: 0;
                /* Override default `<label>` margin */
                line-height: 1.5;
                color: #495057;
                border: 1px solid transparent;
                border-radius: .25rem;
                transition: all .1s ease-in-out;
              }

              .form-label-group input::-webkit-input-placeholder {
                color: transparent;
              }

              .form-label-group input:-ms-input-placeholder {
                color: transparent;
              }

              .form-label-group input::-ms-input-placeholder {
                color: transparent;
              }

              .form-label-group input::-moz-placeholder {
                color: transparent;
              }

              .form-label-group input::placeholder {
                color: transparent;
              }

              .form-label-group input:not(:placeholder-shown) {
                padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
                padding-bottom: calc(var(--input-padding-y) / 3);
              }

              .form-label-group input:not(:placeholder-shown)~label {
                padding-top: calc(var(--input-padding-y) / 3);
                padding-bottom: calc(var(--input-padding-y) / 3);
                font-size: 12px;
                color: #777;
              }

              .btn-google {
                color: white;
                background-color: #ea4335;
              }

              .btn-facebook {
                color: white;
                background-color: #3b5998;
              }
            </style>
          </head>

          <body>
            <jsp:include page="/views/user/layout/header.jsp"></jsp:include>
            <!-- <div class="container">
              <sf:form class="form-signin" method="POST" action="${base }/register" modelAttribute="regis">
                <h2 class="form-signin-heading text-center">Đăng ký</h2>
                  <p>
                    <label for="username" class="sr-only">Username</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Username"
                      required autofocus>
                  </p>
                  <p>
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Password"
                      required>
                  </p>
                  <p>
                    <label for="password" class="sr-only">Confirm Password</label>
                    <input type="password" id="cfpassword" name="cfpassword" class="form-control"
                      placeholder="Confirm Password" required>
                  </p>
                  <p>
                    <label for="email" class="sr-only">Email</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Email" required>
                  </p>
                  <p>
                    <label for="email" class="sr-only">Address</label>
                    <input type="text" id="email" name="address" class="form-control" placeholder="Address" required>
                  </p>
                  <p>
                    <label for="email" class="sr-only">Phone</label>
                    <input type="number" id="email" name="phone" class="form-control" placeholder="Phone" required>
                  </p>
                  <button class="btn btn-lg btn-primary btn-block" type="submit">Đăng ký</button>
                  <a href="${base }/login" style="margin: auto auto">Đăng nhập</a>
                  <c:if test="${not empty thongbao }">
                    <div class="alert alert-primary text-center" role="alert" style="font-size: 24px; color: blue">
                      ${thongbao }
                    </div>
                  </c:if>
              </sf:form>
            </div> -->

            <sf:form method="POST" action="${base }/register" modelAttribute="regis">
              <div class="container">
                <div class="row">
                  <div class="col-lg-10 col-xl-9 mx-auto">
                    <div class="card card-signin flex-row my-5">
                      <div class="card-img-left d-none d-md-flex">
                        <!-- Background image for card set in CSS! -->
                      </div>
                      <div class="card-body">
                        <h5 class="card-title text-center">Đăng ký</h5>
                        <c:if test="${not empty thongbao1}">
                            <h5 style="color: red ;">${thongbao1}</h5>
                        </c:if>
                        <form class="form-signin">
                          <div class="form-label-group">
                            <input type="text" id="inputUserame" name="username" class="form-control"
                              placeholder="Tài Khoản" required autofocus>
                            <label for="inputUserame">Tài khoản</label>
                          </div>

                          <div class="form-label-group">
                            <input type="email" id="inputEmail" class="form-control" placeholder="Email" name="email"
                              required>
                            <label for="inputEmail">Email</label>
                          </div>

                          <hr>

                          <div class="form-label-group">
                            <input type="password" id="inputPassword" name="password" class="form-control" id="password"
                              placeholder="Mật khẩu" required>
                            <label for="inputPassword">Mật khẩu</label>
                          </div>

                          <div class="form-label-group">
                            <input type="text" id="imputAddress" name="address" class="form-control"
                              placeholder="Địa chỉ" required>
                            <label for="imputAddress">Địa chỉ</label>
                          </div>

                          <div class="form-label-group">
                            <input type="number" id="imputPhone" name="phone" class="form-control"
                              placeholder="Số điện thoại" required>
                            <label for="imputPhone">Số điện thoại</label>
                          </div>

                          <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Đăng ký</button>
                          <a class="d-block text-center mt-2 small" href="${base }/login">Đăng nhập</a>
                          <hr class="my-4">
                          <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i
                              class="fab fa-google mr-2"></i> Sign up with Google</button>
                          <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i
                              class="fab fa-facebook-f mr-2"></i> Sign up with Facebook</button>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </sf:form>

            <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>
            <jsp:include page="/views/user/layout/js.jsp"></jsp:include>
          </body>

          </html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

  <!-- directive cua JSTL -->
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
          <title>Forgot password</title>
          <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
          <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet"
            crossorigin="anonymous" />
          <!--Bootsrap 4 CDN-->
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
            integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
          <!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
            id="bootstrap-css"> -->
          <!--Fontawesome CDN-->
          <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
            integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
          <style>
            /* Made with love by Mutiullah Samim*/

            @import url('https://fonts.googleapis.com/css?family=Numans');

            html,
            body {
              background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
              /* background-size: cover;
              background-repeat: no-repeat;
              height: 100%;
              font-family: 'Numans', sans-serif; */
            }

            .container {
              height: 100%;
              align-content: center;
            }

            .card {
              height: 370px;
              margin-top: auto;
              margin-bottom: auto;
              width: 400px;
              background-color: rgba(0, 0, 0, 0.5) !important;
            }

            .social_icon span {
              font-size: 60px;
              margin-left: 10px;
              color: #FFC312;
            }

            .social_icon span:hover {
              color: white;
              cursor: pointer;
            }

            .card-header h3 {
              color: white;
            }

            .social_icon {
              position: absolute;
              right: 20px;
              top: -45px;
            }

            .input-group-prepend span {
              width: 50px;
              background-color: #FFC312;
              color: black;
              border: 0 !important;
            }

            input:focus {
              outline: 0 0 0 0 !important;
              box-shadow: 0 0 0 0 !important;

            }

            .remember {
              color: white;
            }

            .remember input {
              width: 20px;
              height: 20px;
              margin-left: 15px;
              margin-right: 5px;
            }

            .login_btn {
              color: black;
              background-color: #FFC312;
              width: 100px;
            }

            .login_btn:hover {
              color: black;
              background-color: white;
            }

            .links {
              color: white;
            }

            .links a {
              margin-left: 4px;
            }
          </style>
        </head>

        <body>

          <jsp:include page="/views/user/layout/header.jsp"></jsp:include>

          <!-- <div class="container">
            <form class="form-signin" method="POST" action="/perform_login">
              <h2 class="form-signin-heading text-center">Đăng nhập</h2>
              <c:if test="${not empty param.login_error }">
                <div class="alert alert-danger" role="alert">Login attempt was not successful, try again</div>
              </c:if>

              <p>
                <label for="username" class="sr-only">Username</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Username" required
                  autofocus>
              </p>
              <p>
                <label for="password" class="sr-only">Password</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password"
                  required>
              </p>
              <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
              <span style="font-size: 16px">Bạn chưa có tài khoản? </span><a href="${base }/register">Đăng ký</a>
              <br>
              <span style="font-size: 16px"></span><a href="${base }/forgot_password">Quên mật khẩu</a>
            </form>

          </div> -->

          <div class="container">
            <form method="POST" action="/perform_login">
            <div class="d-flex justify-content-center h-100">
              <div class="card">
                <div class="card-header">
                  <h3>Đăng nhập</h3>
                  <div class="d-flex justify-content-end social_icon">
                    <span><i class="fab fa-facebook-square"></i></span>
                    <span><i class="fab fa-google-plus-square"></i></span>
                    <span><i class="fab fa-twitter-square"></i></span>
                  </div>
                </div>
                <c:if test="${not empty param.login_error }">
                <div class="alert alert-danger" role="alert">Nỗ lực đăng nhập không thành công, hãy thử lại</div>
              </c:if>
                <div class="card-body">
                  <form>
                    <div class="input-group form-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                      </div>
                      <input type="text" class="form-control" id="username" name="username" placeholder="Tài khoản">
                      
                    </div>
                    <div class="input-group form-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                      </div>
                      <input type="password" id="password" name="password" class="form-control" placeholder="Mật khẩu">
                    </div>
                    <!-- <div class="row align-items-center remember">
                      <input type="checkbox">Remember Me
                    </div> -->
                    <div class="form-group">
                      <input type="submit" value="Đăng nhập" class="btn float-right login_btn">
                    </div>
                  </form>
                </div>
                <div class="card-footer">
                  <div class="d-flex justify-content-center links">
                    Bạn chưa có tài khoản?<a href="${base }/register">Đăng ký</a>
                  </div>
                  <div class="d-flex justify-content-center">
                    <a href="${base }/forgot_password">Quên mật khẩu</a>
                  </div>
                </div>
              </div>
            </div>
          </form>
          </div>

          <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>
          <jsp:include page="/views/user/layout/js.jsp"></jsp:include>
          <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
          <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        </body>

        </html>
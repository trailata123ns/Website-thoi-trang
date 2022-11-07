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
            <style>
              body {
              background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
            }
            </style>
        </head>

        <body>

          <jsp:include page="/views/user/layout/header.jsp"></jsp:include>

          <div class="container">
            <form class="form-signin" method="POST" action="${base}/reset_password">
              <h2 class="form-signin-heading text-center">Reset password</h2>
              <!-- <c:if test="${not empty param.login_error }">
        <div class="alert alert-danger" role="alert">Login attempt was not successful, try again</div>
      </c:if> -->
              <input type="hidden" name="token" value="${token}" />
              <p>
                <label for="username" class="sr-only">Mật khẩu mới:</label>
                <input type="password" id="password" name="password" class="form-control"
                  placeholder="Enter your new password" required autofocus>
              </p>
              <p>
                <label for="password" class="sr-only">Nhập lại:</label>
                <input type="password" class="form-control" placeholder="Confirm your new password" required
                  oninput="checkPasswordMatch(this);">
              </p>
              <!-- <input name="_csrf" type="hidden" value="b6b7713e-d5e7-4f74-a843-898bafa7f75f" /> -->
              <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
              <span style="font-size: 16px">Bạn chưa có tài khoản? </span><a href="${base }/register">Đăng ký</a>
              <br>
              <span style="font-size: 16px"></span><a href="${base }/forgot_password">Quên mật khẩu</a>
            </form>

          </div>

          <script>
            function checkPasswordMatch(fieldConfirmPassword) {
              if (fieldConfirmPassword.value != $("#password").val()) {
                fieldConfirmPassword.setCustomValidity("Passwords do not match!");
              } else {
                fieldConfirmPassword.setCustomValidity("");
              }
            }
          </script>

          <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>
          <jsp:include page="/views/user/layout/js.jsp"></jsp:include>
        </body>

        </html>
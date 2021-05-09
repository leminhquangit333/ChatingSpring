<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<link href="<c:url value="/resources/css/loginstyle.css" />"
	rel="stylesheet">
</head>
<body>
	<section>
		<!--Bắt Đầu Phần Hình Ảnh-->
		<div class="img-bg">
			<img src="<c:url value="/resources/img/beach.jpg" />"
				alt="Hình Ảnh Minh Họa">
		</div>
		<!--Kết Thúc Phần Hình Ảnh-->
		<!--Bắt Đầu Phần Nội Dung-->
		<div class="noi-dung">
			<div class="form">
				<h2>Đăng Nhập</h2>
				<form:form id="loginForm" action="login" method="POST"
					modelAttribute="loginBean">
					<div class="input-form">
						<p style="color: red">${message}</p>
						<form:label path="username">Username</form:label>
						<form:input id="username" name="username" path="username"
							placeholder="Nhập địa chỉ Email" />
					</div>

					<div class="input-form">
						<form:label path="password">Password</form:label>
						<form:password id="password" name="password" path="password" />
					</div>
					<div class="nho-dang-nhap">
						<label><input type="checkbox" name=""> Nhớ Đăng
							Nhập</label>
					</div>
					<div class="input-form">
						<input type="submit" value="Đăng Nhập">
					</div>
				</form:form>
				<form action="">
					<div class="input-form">
						<p class="register">
							Bạn Chưa Có Tài Khoản? <a href="signup">Đăng Ký</a>
						</p>
					</div>
					<div class="input-form">
						<p class="forgotpassword">
							<a href="forgotpassword">Quên mật khẩu?</a>
						</p>
					</div>
				</form>
			</div>
		</div>
		<!--Kết Thúc Phần Nội Dung-->
	</section>
</body>
</html>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng kí</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/stylesignup.css" />">
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
				<h2>Đăng Kí Tài Khoản</h2>
				<form:form id="signupForm" action="signup" method="POST"
					modelAttribute="signupBean">
					<div class="input-form">
						<p style="color: red">${message}</p>
						<form:label path="nickname">Nickname</form:label>
						<form:input id="nickname" name="nickname" path="nickname" />
					</div>
					<div class="input-form">
						<p style="color: red">${message}</p>
						<label id="label1" path="username">Username</label>
						<form:input id="username" name="username" path="username" />
					</div>

					<div class="input-form">
						<label path="password">Password</label>
						<form:password id="password" name="password" path="password" />
					</div>
					<div class="input-form">
						<input type="password" name="" required=""> <label>Nhập
							Lại Mật Khẩu</label>
					</div>
					<div class="input-form">
						<input type="submit" value="Đăng Kí">
					</div>
				</form:form>
			</div>
		</div>
		<!--Kết Thúc Phần Nội Dung-->
	</section>
</body>
</html>
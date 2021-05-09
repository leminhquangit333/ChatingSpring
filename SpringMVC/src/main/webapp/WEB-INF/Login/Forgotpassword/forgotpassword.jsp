<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quên Mật Khẩu</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<link href="<c:url value="/resources/css/styleforgetpw.css" />"
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
				<h2>Quên Mật Khẩu?</h2>
				<form action="forgotpassword" method="POST">
					<div class="input-form">
						<label>Vui lòng nhập email của bạn để yêu cầu đặt lại mật
							khẩu </label>
					</div>
					<div class="input-form">
						<span>Email </span> <input type="text" name="Email" required autofocus>
					</div>
					<div class="input-form">
						<input type="submit" value="Đặt Lại Mật Khẩu">
					</div>
				</form>
			</div>
		</div>
		<!--Kết Thúc Phần Nội Dung-->
	</section>
</body>
</html>
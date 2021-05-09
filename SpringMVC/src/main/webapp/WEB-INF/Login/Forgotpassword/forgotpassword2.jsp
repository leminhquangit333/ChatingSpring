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
				<h2>Mật Khẩu mới của bạn đã được gửi qua Email</h2>
					<div class="input-form">
						<a class="btn" href="login">Quay Về Trang chủ</a>
					</div>
			</div>
		</div>
		<!--Kết Thúc Phần Nội Dung-->
	</section>
</body>
</html>
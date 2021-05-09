<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon"
	href="data:image/jpeg;base64,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">
<meta charset="UTF-8">
<title>Hello: ${loggedInUser}</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>
<!--    libs for stomp and sockjs-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<!--    end libs for stomp and sockjs-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
	<div class="container clearfix" id="main">
		<div class="hide" id="hide">
			<div id="listFriend">${listFriend}</div>
			<div id="userName">${loggedInUser}</div>
		</div>
		<div class="people-list" id="people-list">
			<div class="search">
				<input id="findfriend" onKeyUp="findFriend()" placeholder="search"
					type="text" /> <i onclick="findFriend()" class="fa fa-search"></i>
			</div>
			<ul class="list" id="listFind">
			</ul>
			<ul class="list" id="listOnline">
			</ul>
			<ul class="list" id="listOffline">
			</ul>
		</div>

		<div class="chat">
			<div class="chat-header clearfix">
				<img alt="avatar" height="55px"
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAMFBMVEXFxcX////CwsLGxsb7+/vT09PJycn19fXq6urb29ve3t7w8PDOzs7n5+f5+fnt7e30nlkBAAAFHUlEQVR4nO2dC5qqMAyFMTwUBdz/bq+VYYrKKJCkOfXmXwHna5uTpA+KwnEcx3Ecx3Ecx3Ecx3Ecx3Ecx3Ecx3Ecx3EcA2iO9cdIc5PUdO257y+BU39u66b4HplE3fk6VIcnqmNfl1+gksr6+iIucjl3WYukor7+re6Hoe1y1UhNO3zUd+fUFRmKpOa0Tt6dY5ubRCrOG/QFLk1WGmnt/JxzykcjdZ/jyxJDLlOV2l36AtcsJJb9boG3YcR3DuqODIE3ztYKPkDdmwRmpUToUaSaq++AvRgZMWbOpbQW8hdCAm8ZDugoikzREdCJ2okJPBx6azFLNOwoOgcxojJ98JkaTSJxMpklKrCAKhZGI0drTY/wU5lXoJYibannV9NYy4oozNEAkPHTjop+DTDxVGkIgYJNoyQQJtiIW+EMjGAjm649AjGIaqswcEFQKJ2QPlJbqytki6ZXAAZRJ52J2McaUowzAfs+uFzrYhnzaapphiPWdaJWShqxjqa6kTTQ205TVbsfMa6htL0iYOsXpJrQjHSmCkv1QGPtiHqlYcQ21Gj7fcDU8xOEUuNgSltPzexh+HqFlanCBHZ4OLhCV+gK/3OF6vWvucLv98MUOY2pwu/PS/+D2qJU7pYGbOvDFDW+bbON9p3o3oRxn0bfLgZTgSn6pSfrtr56qLHemtHPTK2319SzGvtjQ9qeb39WgS66Cm073nd0U1PzDdJCO3Gzn6TKpl9Zq7ujGWsQhlA3NwWIMwG9zM08Y/tBrR9VWeczv5CSQuuUNKIUTk23ZJ5RKfVhjnkXotfWIlgX2BSCDYbZR+QTcLhb3dKZDUY2M0d4KWItwhHRah/zsrOgKw4wycwjcgEVcgQDQo23CqSiWEJkFAfod2oE1uIFdA1OsCPqFXYNTjCfb8Ez+iX2x5sKLlVbhtqdDcar9ZevhnbZxoBUD35k23t0d304LYs1ELVbnfFaZ/REJJX9niP8Q19moZGo3m8XR/yBvOnjFfsXcI2c8ZuNo7WMP5HQh6yRGrlmFOJTnyTcT+zRlqPUBI2gTVWNUzUna1ERgecgF4GpNBQ38jGqxVLzQA1A31Rrhk6Yz9QEh/WND0GnuG9huhiTXJkxfAizTHLr6cbJKN6UCU6x/2DTRE1xEeEXi3O0ZUqBN4nJRzHhFB1JPlFTBZlI2kQ8zc3KJ1Le8DIRmFJiknuVS6RK4Ej/JtBfJErDSzOBiY4wJHX6Z1I4v1GUmdCPNirnLLeg3oJLcbX5PcpHNbRvOa1A956QmRPOUXVF+zkaUJynpkYR0bOMJH2nNej1pqyV/aKkz9jr5yj5vrXXz1F5SQLACiMapmierj2ikLyleKdlA/I/2oFxiglxx9B+mHwz0lf34IZQfhDRhlD6bhvgEAoPYooHkTczSIZTLC+cEExsoNKZiGBiY9cCfo/Y/SjIOBMQizWWTe73CMUasJx7jlD+DdKdWUKoY4PRYFtGpO0G1Lx4RaadgTtJhf4fiGqGIwKWCGuGIwKWqP+7IxYCzygjR9IAO5pC7Da9g70TBVpWRNgFBlgT8RV2WxHbKwJMv4BOaEaYaU2K16yZMN/qgV+G7IWIvwyZCxHeDQMsR8wg0DBDDXB5H2EV+hkEGmaoySHQsEJNFoGGFWrAq98JRhUMX1iMMMqLLEIpK5jCbd4vw9nSt/72lewXiN6jmdjfq8Hdknlk92ZwJnbIMMRM7JBhiFlUFoHd1UWaP1QKsPsHA5mkNB+Smn9JqV3wskatnQAAAABJRU5ErkJggg=="
					width="55px" />
				<div class="chat-about">
					<div class="chat-with" id="friend"></div>
					<div class="chat-num-messages"></div>
				</div>
				<span id="action_menu_btn"><i class="fa fa-ellipsis-v"></i></span>
				<div class="action_menu">
					<ul>
						<input id="findmessage" onKeyUp="findMessage()"
							placeholder="Tìm kiếm tin nhắn" type="text" />
						<i onclick="findMessage()" class="fa fa-search"></i>
						<li onclick="Unfriend()"><i class="fa fa-ban"></i> Hủy Kết
							bạn</li>
						<form action="login" method ="get">
							<input type="submit" value="Đăng Xuất">
						</form>
					</ul>
				</div>
			</div>
			<!-- end chat-header -->
			<form>
				<div class="chat-history">
					<ul id="chat-history">


					</ul>

				</div>
				<!-- end chat-history -->
			</form>
			<div class="chat-message clearfix">
				<textarea id="textMessage" rows="2" cols="50"></textarea>

				<button id="sendBtn" click="sendMessage()">Send</button>

			</div>
			<!-- end chat-message -->

		</div>
		<!-- end chat -->

	</div>
	<!-- end container -->

	<script src="<c:url value="/resources/js/custom.js" />"></script>
	<script src="<c:url value="/resources/js/socket.js" />"></script>
</body>
</html>
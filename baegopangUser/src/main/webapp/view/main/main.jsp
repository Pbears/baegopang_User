<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/user/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">

	html{
		margin: 50px;
	}

	/* image change */
	
	.img-circle{
		width: 230px;
		height: 200px;
		margin: 10px;
	}
	
	a{
		margin-bottom: 30px;
		margin-right: 30px;
	}
	
</style>
</head>
<body>
	<jsp:include page="header.jsp"/> 
		<div id="menuContainer" align="center">
			<a href="/user/storeByBrandMain.do?brandNo=100">
				<img src="/user/img/chicken.jpg" class="img-circle" onmouseover="this.src='/user/img/chickenChar.jpg'" onmouseout="this.src='/user/img/chicken.jpg'"/>
			</a> &nbsp;
			<a href="/user/storeByBrandMain.do?brandNo=200">
				<img src="/user/img/jajang.png" class="img-circle" onmouseover="this.src='/user/img/jajangChar.jpg'" onmouseout="this.src='/user/img/jajang.png'">
			</a> &nbsp;
			<a href="/user/storeByBrandMain.do?brandNo=300">
				<img src="/user/img/pizza.png" class="img-circle" onmouseover="this.src='/user/img/pizzaChar.jpg'" onmouseout="this.src='/user/img/pizza.png'"/>
			</a><br>
			<a href="/user/storeByBrandMain.do?brandNo=400">
				<img src="/user/img/bibeam.png" class="img-circle" onmouseover="this.src='/user/img/bibeamChar.jpg'" onmouseout="this.src='/user/img/bibeam.png'">
			</a>
			<a href="/user/storeByBrandMain.do?brandNo=500">
				<img src="/user/img/jock.jpg" class="img-circle" onmouseover="this.src='/user/img/jockChar.jpg'" onmouseout="this.src='/user/img/jock.jpg'">
			</a> &nbsp;&nbsp;&nbsp;
			<a href="/user/storeByBrandMain.do?brandNo=600">
				<img src="/user/img/tang.jpg" class="img-circle" onmouseover="this.src='/user/img/tangChar.jpg'" onmouseout="this.src='/user/img/tang.jpg'">
			</a><br>
			<a href="/user/storeByBrandMain.do?brandNo=700">
				<img src="/user/img/don.png" class="img-circle" onmouseover="this.src='/user/img/donChar.jpg'" onmouseout="this.src='/user/img/don.png'">
			</a >&nbsp;
			<a href="/user/storeByBrandMain.do?brandNo=800">
				<img src="/user/img/dosirak.jpg" class="img-circle" onmouseover="this.src='/user/img/dosirakChar.jpg'" onmouseout="this.src='/user/img/dosirak.jpg'">
			</a> &nbsp;
			<a href="/user/storeByBrandMain.do?brandNo=900">
				<img src="/user/img/ham.png" class="img-circle" onmouseover="this.src='/user/img/hamChar.jpg'" onmouseout="this.src='/user/img/ham.png'">
			</a>
		</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>
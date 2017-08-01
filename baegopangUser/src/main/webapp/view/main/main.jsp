<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/css/bootstrap.min.css" rel="stylesheet">
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
			<a href="storeByBrandMain.jsp?brandno=100">
				<img src='/img/chicken.jpg' class="img-circle" onmouseover="this.src='/img/chickenChar.jpg'" onmouseout="this.src='/img/chicken.jpg'"/>
			</a> &nbsp;
			<a href="storeByBrandMain.jsp?brandno=200">
				<img src="/img/jajang.png" class="img-circle" onmouseover="this.src='/img/jajangChar.jpg'" onmouseout="this.src='/img/jajang.png'">
			</a> &nbsp;
			<a href="storeByBrandMain.jsp?brandno=300">
				<img src="/img/pizza.png" class="img-circle" onmouseover="this.src='/img/pizzaChar.jpg'" onmouseout="this.src='/img/pizza.png'"/>
			</a><br>
			<a href="storeByBrandMain.jsp?brandno=400">
				<img src="/img/bibeam.png" class="img-circle" onmouseover="this.src='/img/bibeamChar.jpg'" onmouseout="this.src='/img/bibeam.png'">
			</a>
			<a href="storeByBrandMain.jsp?brandno=500">
				<img src="/img/jock.jpg" class="img-circle" onmouseover="this.src='/img/jockChar.jpg'" onmouseout="this.src='/img/jock.jpg'">
			</a> &nbsp;&nbsp;&nbsp;
			<a href="storeByBrandMain.jsp?brandno=600">
				<img src="/img/tang.jpg" class="img-circle" onmouseover="this.src='/img/tangChar.jpg'" onmouseout="this.src='/img/tang.jpg'">
			</a><br>
			<a href="storeByBrandMain.jsp?brandno=700">
				<img src="/img/don.png" class="img-circle" onmouseover="this.src='/img/donChar.jpg'" onmouseout="this.src='/img/don.png'">
			</a >&nbsp;
			<a href="storeByBrandMain.jsp?brandno=800">
				<img src="/img/dosirak.jpg" class="img-circle" onmouseover="this.src='/img/dosirakChar.jpg'" onmouseout="this.src='/img/dosirak.jpg'">
			</a> &nbsp;
			<a href="storeByBrandMain.jsp?brandno=900">
				<img src="/img/ham.png" class="img-circle" onmouseover="this.src='/img/hamChar.jpg'" onmouseout="this.src='/img/ham.png'">
			</a>
		</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>
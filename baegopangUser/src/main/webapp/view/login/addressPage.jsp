<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/user/css/bootstrap.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
<script>

</script>
<style type="text/css">
body {
	background: #ccc
}

.layer {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	display: -webkit-flex;
	-webkit-align-items: center;
	-webkit-justify-content: center;
	background: #ccc;
}

.layer .content {
	padding: 50px;
}

.layer .inputLog {
	padding: 50px;
}

.add {
	background-color: #EAEAEA;
}
</style>
<script type="text/javascript">
	function searchAd(){
		var obj = document.addFrm.searchDong;
		location.replace('/user/addressPage.do?dong='+obj.value);
	}
	function checkDong(obj){
		var ojt = document.getElementById(obj.id).childNodes[0].nodeValue;
		opener.document.getElementById("address1").value=ojt;
		window.close();
	}
</script>
</head>
<body>
	<div class="layer">
		<div class="form-group add">
			<label>우편번호찾기</label>
			<div class="form-inline">
				<form action="" method="post" name="addFrm">
					<input type="text" id="searchDong" name="searchDong" class="form-contro" placeholder="우편번호">
					<button type="button" id="searchAdd" name="searchAdd"
						class="btn btn-default" onclick="searchAd()">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</button>
				</form>
			</div>
			<table class="table" name="addT">
				<c:forEach var="i" items="${zipCodeList}">
					<tr>
						<td onclick="checkDong(this)" id="add${i}">${i.sido} ${i.gugun} ${i.dong} ${i.bunji}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/Baegopang/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
	function onCheck(obj) {
		obj.style.border='1.5px solid #ff8c00'
	}
	function outCheck(obj) {
		obj.style.border='1px solid #ddd'
	}
</script>
<style type="text/css">

	#storeContiner{
		margin: auto;
	}
	.row{
		display: inline-block;
		margin: auto;
	}
	.thumbnail{
		width: 320px;
		height : 240px;
		padding : 5px;
		margin-left: 40px;
		margin-right : 10px;
		margin-top: 50px;
	}

</style>
</head>
<body>
		
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="menuNavi.jsp"></jsp:include>

	<div id="storeContiner" align="center">
		<c:forEach var="i" items="${brand}">
			<span>
			 <div class="row">
			  <div class="col-xm-6 col-sm-4 col-md-3 col-lg-3" >
			    <a href="/MenuByStore.do?brandno=${i.brandNo}&storeName=${i.storename}" style="text-decoration: none;"> 
			    <div class="thumbnail" onmouseover="onCheck(this)" onmouseout="outCheck(this)">
		 	      <img src="${i.picture}" width="150px" height="100px"> 
			      <div class="caption">
			        <h3><strong>${i.storename}</strong></h3>
			        <p>
						<c:forEach begin="0" end="${i.gpa}" step="1" >
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<c:if test="j==${i.gpa}-1 && j <5">
								<c:forEach begin="0" end="4-${j}" step="1">
									<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
								</c:forEach>					
							</c:if>
						</c:forEach>
			        	<br>${i.location}<br>
			        	리뷰 : <strong>(50)</strong>   댓글 : <strong>(50)</strong>
			        
			        </p>
			      </div>
			    </div>
			 </a> 
			  </div>
			</div> 
			</span>
		</c:forEach>
	</div> 
	
	<div id="moreView" align="center">
		<a href="#">더보기▼</a>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>
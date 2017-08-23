<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
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

	ul {
	    list-style-type: none;
	    margin: auto;
	    padding: 0;
	    overflow: hidden;
	    background-color: #ff8c00;
	    width: 1600px;
	    border-radius: 10px;
	}
	
	li {
	    float: left;    
	}
	
	li a {
	    display: block;
	    color: white;
	    text-align: center;
	    padding: 14px 16px;
	    text-decoration: none;
	    border-radius: 10px;
	    font-weight: bold;
	}
	
	li a:hover:not(.active) {
	    background-color: gray;
	}
	
	.active {
	    background-color: #ff5722;
	}
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
	<jsp:include page="header.jsp" flush="false"></jsp:include>
	
	<ul>
	 <li><a href="/user/storeByBrandMain.do?brandNo=100">치킨</a></li>
	 <li><a href="/user/storeByBrandMain.do?brandNo=200">중식</a></li>
	 <li><a href="/user/storeByBrandMain.do?brandNo=300">피자</a></li>
	 <li><a href="/user/storeByBrandMain.do?brandNo=400">한식</a></li>
	 <li><a href="/user/storeByBrandMain.do?brandNo=500">족발, 보쌈</a></li>
	 <li><a href="/user/storeByBrandMain.do?brandNo=600">찜/탕</a></li>
	 <li><a href="/user/storeByBrandMain.do?brandNo=700">일식</a></li>
	 <li><a href="/user/storeByBrandMain.do?brandNo=800">도시락</a></li>
	 <li><a href="/user/storeByBrandMain.do?brandNo=900">패스트푸드</a></li>
	</ul>

	<div id="storeContiner" align="center">
	<c:forEach var="i" items="${searchStoreList }">
		<span>
		 <div class="row">
		  <div class="col-xm-6 col-sm-4 col-md-3 col-lg-3" >
		   <a href="" style="text-decoration: none;">
		    <div class="thumbnail" onmouseover="onCheck(this)" onmouseout="outCheck(this)">
	 	      <img src="/user${i.picture }" alt="..." width="150px" height="100px"> 
		      <div class="caption">
		        <h3><strong>${i.storename }</strong></h3>
		        <p>
		        	<c:forEach var="j" begin="0" end="${i.gpa}" step="1">
			            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
			      		<c:if test="j==${i.gpa}-1 && j<5">
			      			<c:forEach var="k" begin="0" end="4-${j }" step="1">
			              		<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>               
			      			</c:forEach>
			      		</c:if>
			      </c:forEach> 
		        	<br>
		        	${i.location }<br>
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
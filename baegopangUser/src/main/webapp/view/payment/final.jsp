<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		
	});
</script>
<style type="text/css">
	#mainPanel{
		margin : auto;
		width: 1450px;
		text-align: center;
		
	}
	
	#mainImage{
		width: 350px;
		height: 350px;
	}
</style>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>
	<div class="panel panel-default" id="mainPanel">
	  <div class="panel-body">
	  	<img id="mainImage" src="/user/img//Baegopang.jpg">
	    <br><h3><strong>주문이 완료 되었습니다</strong></h3><br>
	    <div class="panel panel-default" style="margin: auto; width: 650px;">
		  <div class="panel-heading">주문 내역</div>
		  	<div class="panel-body">
		  		<c:forEach items="${cartList }" var="i">
		  			<h5>${i.menuName } x  ${i.cnt } - ${i.price }원</h5><br>
			    </c:forEach>
	    	<br><h4><<총 결제 금액 <strong>${totalPrice }원</strong> 입니다.>></h4><br><br>
	    	
	    		<h4><고객 요청 사항></h4><br>
	    	<h5><strong>${comment}</strong></h5>
	    	
		  </div> 
		</div>
	  </div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
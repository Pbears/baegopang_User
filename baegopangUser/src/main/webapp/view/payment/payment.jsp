<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/Baegopang/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>
	$(document).ready(function() {
		$('#checkPang').click(function() {
			var pangText = eval($('#pangText').val());
			var pang = eval($('#myPang').val());

			if(pangText>pang || pangText<1000 || pangText%100!=0){
				alert('팡은 1000팡 이상 ,100팡 단위로 내 팡범위 안에서 사용가능합니다!');
				$("#pangText").val('');
			}else{
				var price = eval($('label#orderPrice').text()) - pangText;
				var calPang = pang-pangText;
				
				$('#pangPrice').text("-"+pangText);
				$('#realTotalPrice').text(price);
				$('#pangAble').text(calPang);
				$('#finalPrice').val(price);
			}			
		});
	});
	
</script>
<style>

hr{
	border: solid 1px gray;
}
label{
	vertical-align: middle;
	padding-top: 7px;
}
textarea{
	resize: none;
}
.mainDiv {
	width: 84%;
	margin: 0 auto;
}
.rowmainDiv{
	width: 1580px;	
	margin: 0 auto;
}
.sendInfoDiv{
	padding: 10px;
}
.orderPrice{
	text-align: right;
}
.centerDiv{
	margin: 0 auto;
	width: 80%;
}
.redText{
	color: red;
}
.rightText{
	width:80%;
	text-align: right;
}
.dashedHr{
	border: dashed 1px gray;
	width: 100%;
}
.finalDiv{
	width: 80%;
	margin: 0 auto;
}
.finalButton{
	width: 100%;
}
.majorDiv{
	margin: 20px;
}
.leftDivs, .rightDivs{
	margin: 10px;
	padding: 10px;
}
.rightDivs{
	margin: 0 auto;
	width: 80%;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
  	<jsp:include page="../main/menuNavi.jsp"/>
  	${member }
	<!-- 중앙 div 태그 -->
	<div class="rowmainDiv">

		<!-- 머릿말 -->
		<h3>배달 / 결제정보</h3>

		<!-- 수평선 -->
		<hr>
		<!-- 왼쪽 div 태그 -->
		<div class="col-md-8">

			<!-- 01. 배달정보 div -->
			<div class="panel panel-default majorDiv">
			
				<!-- panel head -->
				<div class="panel-heading">
					<h4>01. 배달정보</h4>
				</div>
				
				<!-- panel body -->
				<div class="panel-body">
				
					<!-- 휴대전화 form -->
					<div class="form-group sendInfoDiv leftDivs">
						<label for="inputEmail3" class="col-sm-2 control-label">휴대전화</label>
						<div class="col-sm-10">
							<input type="tel" class="form-control" placeholder="전화번호" name="tel" value="${member.tel }">
						</div>
						<br>
					</div>
					
					<!-- 주소 form -->
					<div class="form-group sendInfoDiv leftDivs">
						<label for="inputPassword3" class="col-sm-2 control-label">주소</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="주소" name="address" value="${member.address }">
						</div>
						<br>
					</div>
					
					<!-- 요청사항 form -->
					<div class="form-group sendInfoDiv leftDivs">
						<label for="inputPassword3" class="col-sm-2 control-label">요청사항</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="comment" rows="5"  placeholder="요청사항"></textarea>
						</div>
						<br>
					</div>
				</div>
			</div>

			<br>

			<!-- 02. 할인적용 div -->
			<div class="panel panel-default majorDiv">
			
				<!-- panel head -->
				<div class="panel-heading">
					<h4>02. 할인적용</h4>
				</div>
				
				<!-- panel body -->
				<div class="panel-body">
				
					<!-- 주문금액 form -->
					<div class="form-group sendInfoDiv leftDivs">
						<label for="inputPassword3" class="col-sm-2 control-label">주문금액</label>
						<div class="col-sm-10 orderPrice">
							<label id="orderPrice"></label><label>원</label>
						</div>
					</div>
					
					<br>
					<hr>
					
					<!-- 팡 결제 form -->
					<div class="jumbotron leftDivs">
						<div class="row">
							<div class="form-group">
								<div class="col-md-6">
									<div class="col-md-6">
										<label>내 팡</label>
									</div>
									<div class="col-md-6">
										<label id="pangAble"></label><label>${member.pang }팡</label>
										<input type="hidden" id="myPang" value="${member.pang }">
									</div>
									<div class="centerDiv"><label><h6>1000팡 이상 , 100팡 단위로 사용가능</h6></label></div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-8">
											<input type="text" name="pangText" id="pangText" class="form-control" placeholder="0">
										</div>
										<div class="col-md-4">
											<button type="button" class="btn btn-success" id="checkPang" >사용하기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="centerDiv">
							<label><h5>'팡'이란?<br></h5><h6>누적 결제 금액에 대한 포인트로써, 결제시 금액으로 환전하여 사용할 수 있는 포인트</h6></label>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 오른쪽 div 태그 -->
		<div class="col-md-4">

			<!-- 03. 결제 방법 선택 div -->
			<div class="panel panel-default majorDiv">
				<div class="panel-heading">
					<h4>03. 결제 방법 선택</h4>
				</div>
				<div class="panel-body">
				
					<!-- 메뉴 추가 header div -->
					<div class="form-group centerDiv rightDivs">
						<h4><label class="col-xs-4 col-md-4">메뉴이름</label></h4>
						<h4><label class="col-xs-4 col-md-4" style="margin-left: 60px; width: 70px;">금액</label></h4>
						<h4><label class="col-xs-4 col-md-4" style="width: 70px; margin-left: 10px;">수량</label></h4>
						<br>
						<hr>
					</div>
					
					<!-- 메뉴 추가 body div -->
					<div class="form-group centerDiv rightDivs">
					   <c:forEach items="${cartList }" var="i">
						<div class="row">
							<label class="col-xs-4 col-md-4" style="width: 180px;">${i.menuName }</label>
							<div class="col-xs-4 col-md-4" style="width: 95px;">
								<label id="eachPrice">${i.price }원</label>
							</div>
							<div class="col-xs-4 col-md-4" style="width: 60px;">
								<label id="eachAmount">${i.cnt }개</label>
							</div>
						</div>
					  </c:forEach>
						<div>
							<br><br>
							<hr class="dashedHr">
						</div>
					</div>
					
					
					
					<!-- 최종결제정보 -->
					<div class="form-group centerDiv rightDivs">
						<hr>
						<label class="col-sm-4">수량</label>
						<div class="col-sm-6 orderPrice">
							<label id="totalAmount"></label><label>개</label>
						</div>
						<label class="col-sm-4">상품금액</label>
						<div class="col-sm-6 orderPrice">
							<label id="totalPrice"></label><label>원</label>
						</div>
						<label class="col-sm-4">팡 결제</label>
						<div class="col-sm-6 orderPrice redText">
							<label></label><label id="pangPrice" name="pangPrice">0</label><label>팡</label>
						</div>
						<br><br><br><br><br>
						<hr>
						
						<div class="rightText">
								<h6><label>최종결제금액</label></h6>
								<div>
									<h1><label id="realTotalPrice"></label><label>원</label></h1>
									<input type="hidden" id="finalPrice" name="realTotalPrice" value="">
								</div>
						</div>
					</div>
					<div class="finalDiv rightDivs">
						<hr>
						<button type="submit" class="btn btn-success" id = "finalButton" >결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
		
	<!-- footer -->
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
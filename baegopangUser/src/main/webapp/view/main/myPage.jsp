<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="/user/css/bootstrap.css" />
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>내정보수정</title>
<style>
ul {
    list-style-type: none;
    margin: 0 auto;
    padding: 0;
    overflow: hidden;
    background-color: #ff8d00;
    width: 350px;
    margin-left: 150px;
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
    
}

li a:hover:not(.active) {
    background-color: #4CAF50;
}

.active {
    background-color: #4CAF50;
}
</style>
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
	background: white;
	/* background: #ccc; */
}
.mainDiv{
	background-color: #ff8d00;
	margin: 0 auto;
	width:600px;
}

.layer .content {
	padding: 50px;
}

.layer .inputLog {
	padding: 50px;
    margin: 0 auto;
}

.overflowDiv{
    width: 600px;
    height: 623px;
    overflow: auto;
}

.inputLog, .orderLog, .pointLog, .reviewLog {
	background-color: #ff8d00;
	width: 30%;
	height: 60%;
}
.orderLog, .pointLog, .reviewLog{
	width: 500px;
    height: 623px; 
}
.inner{
	width: 80%;
	text-align: center;
	vertical-align: middle;
	margin: 0 auto;
	color: white;
}
input{
	color: black;
}
#datepicker{
	margin: 0 auto;
}
</style>
<style>
table {
    border-collapse: collapse;
    padding: 100px;
    margin-left: 50px;
    margin-top: 30px;
    width: 500px;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}
</style>
<script type="text/javascript">
	$.datepicker.setDefaults({
		showOn : "both",
		buttonImageOnly : true,
		dateFormat: "yy-mm-dd",
		buttonImage : "/Baegopang/img/calendar.png",
		buttonText : "Calendar"
	});
	
	function checkGender() {
		var genderCheck = document.getElementById('genderCheck').value;
		var gender = document.getElementById('gender');
		var gendermale = document.getElementById('gendermale');
		var genderfemale = document.getElementById('genderfemale');
		if(genderCheck=='남'){
			gendermale.checked=true;
		}else{
			genderfemale.checked=true;	
		}
	}
	
	function ajaxProcess(url,ty,dataType,data){

		  $.ajax({
				 url:url,
				 type:ty,
				 dataType:dataType,
				 data:data,
				 cache:false,
				 success:function(vv){
					 if(data=='inputLog'){
						 $('a#info').attr('class','active');
						 $('#inputLog').css("display", "block");
						 $('#orderLog, #pointLog, #reviewLog').css("display", "none");
						 $('a#order, a#point, a#review').attr('class','');
					 }else if(data=='orderLog'){
						 $('a#order').attr('class','active');
						 $('#orderLog').css("display", "block");
						 $('a#info, a#point, a#review').attr('class','');
						 $('#inputLog, #pointLog, #reviewLog').css("display", "none");
					 }
					 else if(data=='pointLog'){
						 $('a#point').attr('class','active');
						 $('#pointLog').css("display", "block");
						 $('a#info, a#order, a#review').attr('class','');
						 $('#inputLog, #orderLog, #reviewLog').css("display", "none");
					 }else if(data=='reviewLog'){
						 $('a#review').attr('class','active');
						 $('#reviewLog').css("display", "block");
						 $('a#info, a#order, a#point').attr('class','');
						 $('#inputLog, #orderLog, #pointLog').css("display", "none");
					 }
				 },
				 error:function(){
					 alert('error');
				 }
			  });
	}
	$(function(){
	  $("a#info").click(function(){
		  ajaxProcess('myPagePro.do','POST','html','inputLog');
	  });
	  $("a#order").click(function(){
		  ajaxProcess('myPagePro.do','POST','html','orderLog');
	  });
	  $("a#point").click(function(){
		  ajaxProcess('myPagePro.do','POST','html','pointLog');
	  });
	  $("a#review").click(function(){
		  ajaxProcess('myPagePro.do','POST','html','reviewLog');
	  }); 
	});
	
</script>
</head>
<body onload="checkGender()">
	<input type="hidden" id="stateM" />
	<div class="layer">
	<div class="mainDiv">
		<a href="main.do"><img src="/user/img/beagopangTitle.png" style=" margin-left: 50px; width: 500px;"></a>
		<ul>
		  <li><a href="#" id="info" class="active">내정보</a></li>
		  <li><a href="#" id="order">주문내역</a></li>
		  <li><a href="#" id="point">포인트</a></li>
		  <li><a href="#" id="review">리뷰관리</a></li>
		</ul>
		<!--내정보  -->
		 <div class="inputLog" id="inputLog" style="width: 500px;">
			<div class="inner">
				<form class="form-horizontal" method="post" action="/user/myPageModPro.do" name="modifyFrm">
					<div class="form-group">
						<label for="inputId" class="col-sm-2 control-label">ID</label>
						<div class="col-sm-10" id="divId">
							<input type="text" class="form-control" id="id" name="id" placeholder="ID" value="${member.id }" readonly="readonly">
							<label id="labelId"></label>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPw" class="col-sm-2 control-label">PW</label>
						<div class="col-sm-10" id="divPw">
							<input type="password" class="form-control" id="pw" name="pw" placeholder="Password">
							<label id="labelPw"></label>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPw" class="col-sm-2 control-label">Confirm</label>
						<div class="col-sm-10" id="divPwConfirm">
							<input type="password" class="form-control" id="pwConfirm" name="pwConfirm" placeholder="Password Confirm">
							<label id="labelPwConfirm"></label>
						</div>
					</div>
					<div class="form-group">
						<label for="inputName" class="col-sm-2 control-label">Name</label>
						<div class="col-sm-10" id="divName">
							<input type="text" class="form-control" id="name" name="name" placeholder="Name" value="${member.name }" readonly="readonly">
							<label id="labelName"></label>
						</div>
					</div>
					<div class="form-group">
						<label for="inputAddress" class="col-sm-2 control-label">Address</label>
						<div class="col-sm-10" id="divAddress">
							<button type="button" class="btn btn-default" style="width: 100%" id="addressBtn" name="addressBtn">
								<span class="glyphicon glyphicon-search" aria-hidden="true" ></span>
							</button>
							<input type="text" class="form-control" id="address1" name="address1" value="${member.address }" >
							<input type="text" class="form-control" id="address2" name="address2" placeholder="Detail Address">
							<input type="hidden" id="address" name="address">
							<label id="labelAddress"></label>
						</div>
					</div>
					<div class="form-group">
						<label for="inputTel" class="col-sm-2 control-label">Tel</label>
						<div class="col-sm-10">
							<div class="controls controls-row" id="divTel">
								<input style="width: 30%;" type="text" id="tel1" name="tel1" value="010" readonly>
								- <input style="width: 30%;" type="text" id="tel2" name="tel2" value="${telArr[1]}">
								- <input style="width: 30%;" type="text" id="tel3" name="tel3" value="${telArr[2]}">
								<label id="labelTel"></label>
								<input type="hidden" id="tel" name="tel">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="inputGender" class="col-sm-2 control-label">Gender</label>
						<div class="col-sm-10" id="divGender">
							<label class="radio-inline"> 
								<input type="radio"id="gendermale" value="남" checked="" disabled="disabled"> 남
							</label> 
							<label class="radio-inline"> 
								<input type="radio" id="genderfemale" value="여" checked="" disabled="disabled" > 여
								<input type="hidden" name="gender" id="gender" value="${member.gender }">
								<input type="hidden" name="genderCheck" id="genderCheck" value="${member.gender }">
							</label>
						</div>
					</div>
					<div class="form-group">
						<label for="inputBirth" class="col-sm-2 control-label">Birth</label>
						<div class="col-sm-10" id="divBirth">
								<input id="datepicker" class="form-control" name="birth" value="${member.birth }" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-success" id="submitBtn" value="Modify">
						</div>
					</div>
				</form>
			</div>
		</div> 
		
		
		<!--주문내역  -->
			 <div class="orderLog" id="orderLog" style="width: 500px; height:653px; display: none;" >
			<div class="overflowDiv">
			 	<table>
				
					  <tr>
					    <th>주문일자</th>
					    <th>주문번호</th>
					    <th>음식점명</th>
					    <th>주문금액</th>
					    <th>진행상태</th>
					  </tr>
					<c:forEach var="i" items="${foodOrderList}" >
					   <tr>
					    <td>${i.ordertime }</td>
					    <td>${i.ordernumber }</td>
					    <td>${i.storename}</td>
					    <td>${i.price }</td>
					    <td>${i.state }</td>
					  </tr> 
					</c:forEach>
				</table>
				</div>
			</div>
			
			
		<!--포인트  -->
			 <div class="pointLog" id="pointLog" style="width: 500px; height:653px; display: none;" >
				<div class="overflowDiv">
				<table>
					  <tr>
					    <th>포인트적립일자</th>
					    <th>음식점명</th>
					    <th>적립포인트</th>
					    <th>누적포인트</th>
					  </tr>
					  
					  <c:forEach var="i" items="${pangList }">
						  <tr>
						    <td>${i.ordertime }</td>
						    <td>${i.storename }</td>
						    <td><fmt:parseNumber var="j" value="${i.price*0.1}" integerOnly="true"/>${j }</td>
						 	<td>${pangList.size() }</td>
						  </tr>
					</c:forEach>
				</table>
				</div> 
			</div> 			
			<!--리뷰관리  -->
			 <div class="reviewLog" id="reviewLog" style="width: 500px;  height: 653px; display: none;" >
				<div class="overflowDiv">
					<table>
						  <tr>
						    <th>리뷰작성일자</th>
						    <th>음식점명</th>
						    <th>리뷰내용</th>
						  </tr>
						  <c:forEach var="i" items="${replyList}">
						  <tr>
						    <td>${i.regDate }</td>
						    <td>${i.storeName }</td>
						    <td>${i.contents }</td>
						  </tr>
						  </c:forEach>
					</table>
				</div>
			</div> 
		</div>
	</div> 
</body>
<script>
	$("#datepicker").datepicker();
	
	$( "input[type='radio']" ).checkboxradio();
	
	$("button[name='addressBtn']").click(function(){
		window.open("/user/addressPage.do","address input" ,"width=500, height=500");
	});
	
	$("input#pw").blur(function(){
		if($("input#pw").val().trim().length==0 || !$("input#pw").val()){
			$("div#divPw").attr('class','col-sm-10 has-error');
			$("input#pw").val('');
			$("input#pw").focus();
			$("label#labelPw").text('비밀번호를 정확히 입력하세요.');
		}else{
			$("div#divPw").attr('class','col-sm-10 has-success');
			$("label#labelPw").text('');
		}
	});
	$("input#pwConfirm").blur(function(){
		if($("input#pw").val()==$(this).val()){
			$("div#divPwConfirm").attr('class','col-sm-10 has-success');
			$("label#labelPwConfirm").text('');
		}else if($("input#pw").val()!=$(this).val()){
			$("div#divPwConfirm").attr('class','col-sm-10 has-error');
			$("input#pwConfirm").focus();
			$("input#pwConfirm").val('');
			$("label#labelPwConfirm").text('비밀번호와 일치하지않습니다.');
		}
	});
	$("input#address2").blur(function(){
		if($("input#address2").val().trim().length==0 || !$("input#address2").val()){
			$("div#divAddress").attr('class','col-sm-10 has-error');
			$("input#address2").focus();
			$("input#address2").val('');
			$("label#labelAddress").text('상세주소를 기입하세요.');
		}else{
			$("div#divAddress").attr('class','col-sm-10 has-success');
			$("input#address").val($("input#address1").val()+$("input#address2").val());
			$("label#labelAddress").text('');
		}
	});
	$("input#tel3").blur(function(){
		if($("input#tel2").val().trim().length==0 || !$("input#tel2").val()||
				$("input#tel3").val().trim().length==0 || !$("input#tel3").val()){
			$("input#tel2").focus();
			$("input#tel2").val('');
			$("input#tel3").val('');
			$("label#labelTel").text('전화번호를 제대로 기입하세요.');
		}else{
			$("input#tel").val($("input#tel1").val()+"-"+$("input#tel2").val()+"-"+$("input#tel3").val());
			$("label#labelTel").text('');
		}
	});
	
	$("input#submitBtn").click(function(){
		if($("input#id").val().length==0||$("input#pw").val().length==0||$("input#pwConfirm").val().length==0||
				$("input#name").val().length==0||$("input#address1").val().length==0||$("input#address2").val().length==0||
				$("input#tel1").val().length==0||$("input#tel2").val().length==0||$("input#tel3").val().length==0||
				$("input#birth").val().length==0){
			$("form[name='modifyFrm']").attr('action','');
			alert('빈칸없이 모두 입력해주세요!');
		}
	});
	
</script>
</html>
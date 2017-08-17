<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
  
  div.container{
  	 width: 980px;
  	 margin-left: 150px;
  	 margin-right: 500px;
  }
  
  button.btn.btn-default {
	height: 74px;
	width: 76px;
  }
  .fld_cmt{
  	text-align: right;
  }
  
  #replyContainer{
  	overflow: auto;
  	height: 450px;
  	width: 1100px;
  }
  
  ul.media-list{
  	width: 610px;
  }
  
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$("button").click(function(){
		
		var contents = $('#contents').val();
		var currentTime = new Date();
		var day = currentTime.getDate();
		var month = currentTime.getMonth() + 1;
		var year = currentTime.getFullYear();
		var hour =  currentTime.getHours();
		var ampm = hour >= 12 ? '오후' : '오전';
		hour = hour % 12;
		hour = hour ? hour : 12;
		
		var minute = currentTime.getMinutes();
		var second = currentTime.getSeconds()
		
		  if (day < 10){
		  day = "0" + day;
		  }

		  if (month < 10){
		  month = "0" + month;
		  }

		  var today_date = year + "년" + month + "월" + day +'일    '+ ampm+'  '+hour+":"+minute+":"+second;
		
		
		var reply = "<ul class='media-list' style='padding: 5px; width: 800px; height: 85px; margin-left: 180px; background-color: #f5f5f5;'>"+
		  "<li class='media'>"+
		    "<div class='media-left'>"+
		      "<a href='#'>"+
		        "<img class='media-object' src='/Baegopang/img/comment/img_avatar3.png' width='50px;' height='50px;'>"+
		      "</a>"+
		    "</div>"+
		    "<div class='media-body'>"+
		      "<h5 class='media-heading'><strong>ID : comet</strong> <small>님</small> | "+today_date+"</h5>"+
		      contents+
		    "</div>"+
		  "</li>"+
		 "</ul>";
		 
		 $(reply).appendTo('#replyContainer');
		 $('#contents').val('');
		 $("span#sw").html(0);

	});
	$("textarea").click(function(){
		$(this).html('');
		$(this).keyup(function(e){
			$("span#sw").css("color","blue");
			if($(this).val().length>100){
				$("span#sw").css("color","red");
				$("span#sw").html(100-($(this).val().length));
			}else{
			$("span#sw").html( ($(this).val().length));
			}
		});
	});

});
</script>
</head>
<body>

	<br><br><br><br>
	<div class="container">
		<br>
		  <form id="frmnew" action="" class="navbar-form navbar-left" role="search" method="post">
	        <div class="form-group">
			  <label for="comment">Comment:</label><br>
	          <textarea id="contents" name="contents" class="form-control" rows="3" style="width: 836px;"></textarea>
	          <input id="brandno" name="brandno" type="hidden" value="${param.brandNo }">
	          <input id="storeName" name="storeName" type="hidden" value="${param.storeName }">
	          <input id="reply" name="reply" type="hidden" value="new">
	        <button id="new" name="new" type="button" class="btn btn-default">등록</button>
	        </div>
	        
			<fieldset class="fld_cmt">		
				<p class="info_append">
					<span class="screen_out">입력된 바이트 수 : </span>
					<span class="txt_byte" id="sw"><strong>0</strong></span><strong> / 100자 </strong><span class="txt_bar">|</span>
					<a href="#none">댓글 운영원칙</a>
				</p>
			</fieldset>
	      </form>			
		<br>
	</div>
	
	<div id="replyContainer" >
	<c:forEach items="${replyList }" var="i">
	&nbsp;&nbsp;&nbsp;
		<ul class="media-list" style="padding: 5px; width: 800px; height: 85px; margin-left: 180px; background-color: #f5f5f5;">
		  <li class="media" style="background-color: ">
		    <div class="media-left">
		      <a href="#">
		        <img class="media-object" src="/Baegopang/img/comment/img_avatar3.png" alt="..." width="50px;" height="50px;">
		      </a>
		    </div>
		    <div class="media-body">
		      <h5 class="media-heading"><strong>ID : ${replyList.regDate }</strong> <small>님</small> | ${replyList.id }</h5>
				${replyList.contents }
		    </div>
		  </li>
		 </ul>
		<%--  <c:choose test="${replyList.reply eq '1'}">
		 <%
		 	if(bean.getReply() ==1){
		 		replyCheckList = replyDao.selectReplyCheck(bean.getPnum());
		 %>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <ul class="media-list" style="padding: 5px; width: 800px; height: 85px; margin-left: 220px; background-color: #f9b39c">
		  <li class="media">
		    <div class="media-left">
		      <a href="#">
		        <img class="media-object" src="/Baegopang/img/comment/img_avatar4.png" alt="..." width="50px;" height="50px;">
		      </a>
		    </div>
		    <div class="media-body">
		      <h5 class="media-heading">사장님 | <%=replyCheckList.get(0).getRegDate() %></h5>
		       <%=replyCheckList.get(0).getContents() %>
		    </div>
		  </li>
		</ul> 
		</c:choose> --%>
	 </c:forEach>
	 </div> 
</body>
</html>
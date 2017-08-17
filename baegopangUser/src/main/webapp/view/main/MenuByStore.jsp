<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/user/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
   function onCheck(obj) {
      obj.style.border='1.5px solid #ff8c00'
   }
   
   function outCheck(obj) {
      obj.style.border='1px solid #ddd'
   }
</script>
<script>
   $(function(){
      var totalPrice=0;
      var count=1;
      $("a#innerA").click(function(e){
          e.preventDefault();
         var menu = $(this).find("input#menuName").val();
         var price = $(this).find("input#menuPrice").val();

         var tag = "<div class='order-div'>" + 
                     "<label class='menu' style='width:205px;'>"+
                        menu+
                     "</label>"+
                     "<input type='hidden' id='menuName' name='menuName' value='"+menu+"'>"+
                     "<input type='number' id='cnt' name='cnt' value='1' step='1' min='1' max='10' style='width:35px; margin-left:0px; margin-right:0px;'>"+
                     "<input type='hidden' id='count' name='count' value='1'>"+
                     "<label class='price'>"+price+"원</label>"+
                      "<input type='hidden' class='totalPrice' id='price' name='price' value='"+price+"'>"+
                      "<input type='hidden' class='originPrice' value='"+price+"'>"+
                      "<button class='cancelBtn'>취소</button>"+
                 "</div>";
         
 
         if($('label.menu').text().indexOf(menu) == -1){
            totalPrice+=eval($(this).find("#menuPrice").val());
            $(tag).appendTo("label#menuLabel");            
             $("label.ordertotalPrice").text(totalPrice);
         }else{
            
            alert('이미 추가된 메뉴 입니다');
            
            /* 추후 진행 사항 */
               /*   count+=1; 
                alert($(this).find("input#cnt").val());
                 $(this).parent().siblings("input#cnt").val(count); 
                var calPrice = eval($(this).val())*eval($(this).siblings("input.originPrice").val());
                $(this).siblings("label.price").text(calPrice);
                totalprice+=eval($("input.totalPrice").val());
                 $("label.ordertotalPrice").text(totalprice);    */
         }  
         
      });
      
     $(document).on("click","#cnt", function () {
         
         count=eval($(this).val());
         $(this).siblings("input#count").val(count); //hidden에 값 설정
         
         var calPrice = eval($(this).val())*eval($(this).siblings('input.originPrice').val());
          
          $(this).siblings("label.price").text(calPrice+"원");
          $(this).siblings("input.totalPrice").val(calPrice);
          totalPrice=0;
          $("label.price").each(function(){
             totalPrice+=eval($(this).siblings("input.totalPrice").val());
          });
          
          $("label.ordertotalPrice").text(totalPrice);
      });
      
       
      //취소
      $(document).on("click","button.cancelBtn", function () {
          $(this).parent().remove();
          totalPrice=0;
          $("label.price").each(function(){
               totalPrice+=eval($(this).siblings('.totalPrice').val());
            });
         $("label.ordertotalPrice").text(totalPrice);
       });
       
       
       
       $("a[href='#none']").click(function(){
            $("form#"+this.id).toggle();
            
         });
         
         $("button").click(function(){

            $("form[id='frm"+$(this).attr("id")+"']").submit();

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
         
          $("#myButton").click(function () {
        	  if(totalPrice < $('#minPrice').val()){
        		  alert('최소 주문 금액보다 적습니다.');
        	  }else{
	            $('#paymentInfomation').submit();        		  
        	  }
       
          });   
      });

   
</script>
<style>
  
   a#innerA{
      pointer-events: none;
      text-decoration: none;
   }
   
   a#innerA img{
      width : 150px;
      height: 100px;
      text-decoration: none;
   }
   
   #storeInfoContainer {
      width: 1600px;
      margin: auto;
      margin-top: 50px;
   }
   
   #menuContiner{
      margin: auto;
      margin-left: 0px;
      width: 1250px;
      height : auto;
      display: inline-block;
   }
   
   .row{
      display: inline-block;
      margin: auto;
   }
   
   .thumbnail{
      width: 270px;
      height : 270px;
      padding : 5px;
      margin-left: 40px;
      margin-right : 10px;
      margin-top: 50px;
   }
   
   #selectMenuContainer{
      top : 545px;
      left : 1340px;
      bottom : 870px;
       width: 400px;
       height : 800px;
       display : inline-block;
       position: absolute;
   }
   #cnt{
      width: 40px;
      text-align: right;
      margin-left: 5px;
      margin-right: 20px;
   }
   label{
      padding: 5px;
   }
   
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
  
  button#myButton{
     text-align: center;
     width: 400px;
     height: 50px;
  }
  
  .menuInfo{
    width:242px;
    height:60px;
    overflow: hidden;
    text-overflow: ellipsis; 
  }  
  
  .thumbnail {
    position: relative;
    display: inline-block;
}

 .thumbnail .tooltiptext {
    visibility: hidden;
    width: 200px;
    background-color: #ff8c00;
    color: #fff;
    text-align: center;
    border-radius: 10px;
    padding: 10px;

    /* Position the tooltip */
    position: absolute;
    z-index: 1;
    top: 95%;
    right: 10%;
}
.thumbnail:hover .tooltiptext {
    visibility: visible;
}
  
</style>
</head>
<body>
   
   <jsp:include page="../main/header.jsp"></jsp:include>
   <jsp:include page="../main/menuNavi.jsp"></jsp:include>
   
   <div id="storeInfoContainer">
   <div class="panel panel-default">
     <div class="panel-body">
        
      <strong>매장명 : ${storeList[0].storeName }</strong>  &nbsp;|&nbsp;
      <strong>매장 주소 : ${storeList[0].location }</strong>  &nbsp;|&nbsp;
      별점 : 
      	<c:forEach var="j" begin="0" end="${storeList[0].gpa}" step="1">
            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
      		<c:if test="j==${storeList[0].gpa}-1 && j<5">
      			<c:forEach var="k" begin="0" end="4-${j }" step="1">
              		<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>               
      			</c:forEach>
      		</c:if>
      </c:forEach> &nbsp;|&nbsp;
      좋아요
      <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
      <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
      <strong>(50)</strong></span>
     </div>
   </div>
   </div>
   
   <span>
	   <div id="menuContiner" align="center" >
	   <span>
	      <c:forEach var="i" items="${menuList}">
			   <div class="row" >
			     <div class="col-xm-6 col-sm-4 col-md-3 col-lg-3">
			       <div class="thumbnail" onmouseover="onCheck(this)" onmouseout="outCheck(this)">
			         <a href="#" id="innerA">
			             <img src="/user${i.picture }"/> 
			            <div class="caption">
			              <h4><strong>${i.menuName }</strong></h4>
			              <input id="menuName" type="hidden" value="${i.menuName }">
			              <p class="menuInfo">
			                 ${i.info }
			              </p>
			              
			              <!--마우스오버할 때 메뉴info tooltip -->
							<span class="tooltiptext">${i.info }</span>
						  
			              <h5 style="margin-top: 20px;"><strong>${i.price }원</strong></h5>
			              <input id="menuPrice" type="hidden" value="${i.price }">
			            </div>
			         </a>
			       </div>
			     </div>
			   </div>
	  		</c:forEach>
	   </span>
	   </div> 
   </span>
   
   <span>
      <div id="selectMenuContainer">
      <div class="panel panel-default">
        <div class="panel-heading">매장 정보</div>
        <div class="panel-body">
       		${storeList[0].info}
        </div>
      </div>
      
      <div class="panel panel-default">
        <div class="panel-heading">최소 주문 금액</div>
        <div class="panel-body">
          <strong>${storeList[0].minprice }원</strong>
          <input type="hidden" id="minPrice" value="${storeList[0].minprice }">
        </div>
      </div>
      
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">주문 목록</h3>
        </div>
        <div class="panel-body" id="panel-body-order">
        
        <form id="paymentInfomation" action="payment.do" method="get">
           <label for="addMenu" id="menuLabel" name="menuLabel"></label> 
           <input type="hidden" name="brandNo" value="${brandNo }">
         </form>
           
        </div>
      </div>
      
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">주문 금액 합계</h3>
        </div>
        <div class="panel-body" id="panel-body-ordertotalPrice" style="text-align: right; margin-right: 20px;">
          <label class="ordertotalPrice" style="font-size: 30px; text-align: right;"></label>원
        </div>
      </div>
      <button type="submit" id="myButton" data-loading-text="결제 페이지로 이동합니다.." class="btn btn-success" autocomplete="off">
        주문하기
      </button>
      </div>
    </span>
    
    
   <!-- 댓글 미완성  -->
   <jsp:include page="/view/replyForm/replyForm.jsp">
       <jsp:param value="${ brandNo}" name="brandNo"/>
       <jsp:param value="${storeList[0].storeName }" name="storeName"/>
       <jsp:param value="orderNumber" name="orderNumber"/>
       <jsp:param value="${member.id }" name="id"/>
    </jsp:include>   
    
</body>
</html>
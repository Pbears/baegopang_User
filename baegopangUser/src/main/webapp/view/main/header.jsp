
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<style>
	html{
		margin: 50px;
	}
	header{
	    padding: 1em;
	    border : 1px;
	    border-color : black;
	    color: black;
	    background-color: #FF8C00;
	    clear: left;
	    text-align: center;
	  	margin: auto;
	    margin-bottom : 50px;
	    width: 1600px;
	}
	
	#mainTitle{
		margin-bottom: 50px;
	}
	
	#mainTitle img{
		width: 350px;
		height: 95px;
	}
	
	#loginBtn{
		width: 50px;
		height: 50px;
		margin-left: 0px;
	}
	
	#headerContainer{
		margin: auto;
	}
	
	#locationBtn{
		margin-left: 0px;	
	}
	
	.searchContainer{
		margin: o auto;
	}
	#searchWindow{
		width: 300px;
		
	}
	#addressWindow{
		margin-left: 200px;
		width: 150px;
	}
	.buttonDiv{
		padding-left: 100px;
	}
	button#loginBtn.btn btn-default btn-lg{
		width: 35px;
		height: 35px;
	}
	
</style>
<script>
 function myPage() {
	
	document.location.href='/Baegopang/jsp/main/myPageProcess.jsp';
}
 
 function searchMenu(){
	 var obj = document.searchFrm;
	 if(!obj.data.value){
		 alert('검색어를 입력하세요!');
	 }else{
		obj.submit();
	 }
	 
 }
</script>
<header>
		<div id="headerContainer">
			<div id="mainTitle" align="center">
				<a href="/Baegopang/jsp/main/index.jsp">
					<img alt="" src="/img/beagopangTitle.png">
				</a>
			</div>
			<form action="searchMain.jsp" name="searchFrm" method="post">
				<div id="searchContainer">
					<table align="center">
						<tr>
							<td>
								<input type="text" name="searchAddress" id="addressWindow" class="form-control" readonly="readonly" placeholder="">
							</td>
							<td>
								<input type="button" id="locationBtn" value="location" class="btn btn-default">
							</td> 
							<td>
								<input type="text" name="data" id="searchWindow" class="form-control" placeholder="Search">
							</td>
							<td>
								<input type="button" id="searchBtn" value="Search" class="btn btn-default" onclick="searchMenu()">
							</td>
							<td>
								<div class="buttonDiv">
								<label>님 반갑습니다.</label>
								<button type="button" class="btn btn-default btn-lg" id="loginBtn" onclick="myPage()">
								 <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
								</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</header>
	
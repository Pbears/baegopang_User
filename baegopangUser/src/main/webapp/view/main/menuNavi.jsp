<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
   	int brandNo = Integer.parseInt(request.getParameter("brandno"));
%> 
<style>
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
	    background-color: orange;
	    text-decoration: none;
	}
	
	li a.active{
		text-decoration: none;
	}
	
	.active {
	    background-color: #ff5722;
	}
</style>
<ul>
   	<%
   		switch(brandNo/100){
   			case 1:
   	%>
     			<li><a class="active" href="/user/storeByBrandMain.do?brandno=100">ġŲ</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=200">�߽�</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=300">����</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=400">�ѽ�</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=500">����, ����</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=600">��/��</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=700">�Ͻ�</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=800">���ö�</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=900">�н�ƮǪ��</a></li>
    <%
    		break;
   			case 2:
   	%>
   			    <li><a href="/user/storeByBrandMain.do?brandno=100">ġŲ</a></li>
   	 		    <li><a class="active" href="/user/storeByBrandMain.do?brandno=200">�߽�</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=300">����</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=400">�ѽ�</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=500">����, ����</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=600">��/��</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=700">�Ͻ�</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=800">���ö�</a></li>
			    <li><a href="/user/storeByBrandMain.do?brandno=900">�н�ƮǪ��</a></li>
   	<%
   			break;
   			case 3:
   	%> 		
	   			 <li><a href="/user/storeByBrandMain.do?brandno=100">ġŲ</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=200">�߽�</a></li>
			     <li><a class="active" href="/user/storeByBrandMain.do?brandno=300">����</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=400">�ѽ�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=500">����, ����</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=600">��/��</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=700">�Ͻ�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=800">���ö�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=900">�н�ƮǪ��</a></li>
	   	<%
  		 	break;
   			case 4:
   	%> 		
	   			 <li><a href="/user/storeByBrandMain.do?brandno=100">ġŲ</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=200">�߽�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=300">����</a></li>
			     <li><a class="active" href="/user/storeByBrandMain.do?brandno=400">�ѽ�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=500">����, ����</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=600">��/��</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=700">�Ͻ�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=800">���ö�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=900">�н�ƮǪ��</a></li>
   	<%
   			break;
   			case 5:
   	%> 		
	   			 <li><a href="/user/storeByBrandMain.do?brandno=100">ġŲ</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=200">�߽�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=300">����</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=400">�ѽ�</a></li>
			     <li><a class="active" href="/user/storeByBrandMain.do?brandno=500">����, ����</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=600">��/��</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=700">�Ͻ�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=800">���ö�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=900">�н�ƮǪ��</a></li>
   	<%
   			break;
   			case 6:
   	%> 		
	   			 <li><a href="/user/storeByBrandMain.do?brandno=100">ġŲ</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=200">�߽�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=300">����</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=400">�ѽ�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=500">����, ����</a></li>
			     <li><a class="active" href="/user/storeByBrandMain.do?brandno=600">��/��</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=700">�Ͻ�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=800">���ö�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=900">�н�ƮǪ��</a></li>
   	<%
  		 	break;
   			case 7:
   	%>
	   			 <li><a href="/user/storeByBrandMain.do?brandno=100">ġŲ</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=200">�߽�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=300">����</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=400">�ѽ�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=500">����, ����</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=600">��/��</a></li>
			     <li><a class="active" href="/user/storeByBrandMain.do?brandno=700">�Ͻ�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=800">���ö�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=900">�н�ƮǪ��</a></li>
   	<%
   			break;
   			case 8:
   	%> 		
	   	 		 <li><a href="/user/storeByBrandMain.do?brandno=100">ġŲ</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=200">�߽�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=300">����</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=400">�ѽ�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=500">����, ����</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=600">��/��</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=700">�Ͻ�</a></li>
			     <li><a class="active" href="/user/storeByBrandMain.do?brandno=800">���ö�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=900">�н�ƮǪ��</a></li>
   	 		
   	<%
   			break;
   			default: 
   	%>			
			     <li><a href="/user/storeByBrandMain.do?brandno=100">ġŲ</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=200">�߽�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=300">����</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=400">�ѽ�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=500">����, ����</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=600">��/��</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=700">�Ͻ�</a></li>
			     <li><a href="/user/storeByBrandMain.do?brandno=800">���ö�</a></li>
			     <li><a class="active" href="/user/storeByBrandMain.do?brandno=900">�н�ƮǪ��</a></li>
   	<% 
   		}
    %>
   </ul>

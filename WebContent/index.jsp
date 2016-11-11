<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		var XHR = false;
		function CreateXHR(){
			try{
				/**检查能否使用activeobject*/
				XHR= new ActiveXObject("msxm12.XMLHTTP");
				}catch(e1){
					try{
						//检查能否用activeobject
						XHR = new ActiveXObject("mircrosoft.XMLHTTP");
						}catch(e2){
							try{//检查能否使用贝蒂javascript对象
							XHR = new XMLHttpRequest();
							}catch(e3){
								XHR = false;//创建失败
								}
							}
					}
			}
		function sendRequest(){
			CreateXHR();
			if(XHR){
				var name = document.getElementById("name").value;//如果创建成功则取到name的值
				var password = document.getElementById("password").value;
				//要访问的uri
				var uri = "http://localhost:8080/BookJavaWeb9Ajax/login?name="+name+"password"+password;
				XHR.open("GET",uri,true);//访问open？
				XHR.onreadystatechange = resultHander;//设置事件触发器
				XHR.send(null);
				}
			}
		function resultHander(){
			if (XHR.readyState == 4&& XHR.status==200){
				var userObj = JSON.parse(XHR.responseText);//得到json对象值
				var userStr = "<table border=0>";
				userStr += ('<tr><td><b>姓名</b></td><td>'+userObj.USER.name+'</td></tr>');

				userStr += ('<tr><td><b>年龄</b></td><td>'+userObj.USER.age+'</td></tr>');
				userStr += "</table>"
				document.getElementById('jsonDiv').innerHTML = userStr;
				}
			}
	</script>
</head>
<body>
	<center>
		<div id="jsonDiv"></div>
		
		<!-- 单击触发ajax -->
		<input type="button" value="ok" onclick="sendRequest();" />
	</center>
</body>
</html>
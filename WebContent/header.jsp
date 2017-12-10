<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="styles/global.css" rel="stylesheet" type="text/css" />
<link href="styles/header.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function checkForm(){
	// 获取元素
	if(document.getElementById("username").value == ""){
		alert("请填写用户登录帐号！");  // 弹出对话框
		document.getElementById("username").focus();  // 让组件获取焦点
		return false;   // 返回假值，阻止表单提交
	}
	if(document.getElementById("password").value == ""){
		alert("请填写用户登录密码！");  // 弹出对话框
		document.getElementById("password").focus();
		return false;   // 返回假值，阻止表单提交
	}
}
// 跳到注册页面的函数
function goRegister(){
	window.parent.location.href = "register.jsp";
}
// 跳到个人页面的函数
function goPersonal(){
	var val = '<%=session.getAttribute("user")%>';
	if(val == "null"){
		alert("请登录！");  // 弹出对话框
		document.getElementById("username").focus();  // 让组件获取焦点
		return false;   // 返回假值，阻止表单提交e
	}
	window.parent.location.href = "personal.jsp";
}
</script>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="header">
  <tr>
    <td width="200" height="80" class="logo">&nbsp;</td>
    <td width="830">&nbsp;</td>
    <td width="228">
    <s:if test="#session.user==null">
	    <form id="loginForm" name="loginForm" method="post" action="userlogin" onsubmit="return checkForm()">
	      <table width="100%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td width="21%" height="25" align="right">帐号：</td>
	          <td width="50%"><input name="username" type="text" class="input01" id="username" /></td>
	          <td width="29%"><input name="button" type="button" class="button01" id="button" value="注册" onclick="goRegister()" /></td>
	        </tr>
	        <tr>
	          <td height="25" align="right">密码：</td>
	          <td><input name="password" type="password" class="input01" id="password" /></td>
	          <td><input name="button2" type="submit" class="button01" id="button2" value="登录" /></td>
	        </tr>
	      </table>
	    </form>
    </s:if>
    <s:else>
      <form id="userlogout" name="userlogout" method="post" action="userlogin">
    	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td width="17%" height="25" align="center"><img src="images/photo/${session.user.getPhoto()}"/></td>
	          <td height="25" align="center"><s:property value="#session.user.getNickname()+'('+(#session.user.getMoneys())+')'" />,你好！</td>
	          <td height="25" align="center"><input name="button3" type="submit" class="button01" id="button03" value="注销" /></td>
	        </tr>
	      </table>
      </form>
    </s:else>
    </td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="menubar">
  <tr>
    <td width="80" height="45" class="text01">系统公告：</td>
    <td width="1086">欢迎进入驴友之家，我们会给您最好的服务！</td>
    <td width="92"><input name="button3" type="button" class="button02" id="button3" value="个人中心" onclick="goPersonal()" /></td>
  </tr>
</table>
</body>
</html>

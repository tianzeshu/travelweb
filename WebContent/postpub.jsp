<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>驴友之家</title>
<link href="styles/global.css" rel="stylesheet" type="text/css" />
<link href="styles/postpub.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function checkForm(){
	var val = '<%=session.getAttribute("user")%>';
	if(val == "null"){
		alert("请登录！");  // 弹出对话框
		return false;   // 返回假值，阻止表单提交e
	}
	return true;
}
</script>
</head>

<body>
<!-- 页面首部 -->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="125"><iframe src="header.jsp" width="100%" height="125" scrolling="no" frameborder="0"></iframe></td>
  </tr>
</table>

<!-- 位置条 -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="location">
  <tr>
    <td width="1%" height="32">&nbsp;</td>
    <td width="2%"><img src="images/item06.gif" width="18" height="18" /></td>
    <td width="92%"><strong>发表新帖</strong></td>
    <td width="5%"><a href="index.jsp">返回首页</a></td>
  </tr>
</table>

<!-- 表单部分 -->
<jsp:useBean id="time" class="java.util.Date"/>  
<s:form name="form1" method="post" action="postpostadd" onsubmit="return checkForm()">
<table width="880" border="0" align="center" cellpadding="2" cellspacing="0" id="postpub">
  <tr>
    <td width="91" height="25" align="center" style="padding-top:10px">帖子标题：</td>
    <td align="left" style="padding-top:10px">
      <input name="username" type="hidden" value="${session.user.getUsername()}" />
      <input name="title" type="text" class="input" id="title"  />
	</td>
  </tr>
  <tr>
    <td height="25" align="center">类　　别：</td>
    <td align="left">
      <select name="classnum" id="classnum">
        <option value="1">旅游攻略</option>
        <option value="2">组队信息</option>   
      </select>
    </td>
  </tr>
  <tr>
    <td align="center" valign="top">内　　容：</td>
    <td align="left">
      <textarea name="text" id="text" cols="106" rows="21" class="input"></textarea>
    </td>
  </tr>
  <tr>
    <td height="45" colspan="2" align="center" valign="middle">
      <input name="zan" type="hidden" value="0" />
      <input name="dzan" type="hidden" value="0" />
      <input name="time" type="hidden" value="<%=time%>" />
      <input type="submit" name="btnPub" id="btnPub" class="button" value="发布帖子" />     　　　　　
      <input type="reset" name="btnReset" id="btnReset" class="button" value="重新填写" />
    </td>
  </tr>
</table>
</s:form>

<!-- 页面脚部 -->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="122"><iframe src="footer.jsp" width="100%" height="122" scrolling="no" frameborder="0"></iframe></td>
  </tr>
</table>

</body>
</html>

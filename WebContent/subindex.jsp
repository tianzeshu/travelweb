<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>驴友之家</title>
<link href="styles/global.css" rel="stylesheet" type="text/css" />
<link href="styles/subindex.css" rel="stylesheet" type="text/css" />
<link href="styles/teamindex.css" rel="stylesheet" type="text/css" />
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
    <td width="3%" height="32" align="center"><img src="images/item04.gif" width="15" height="14" /></td>
    <td width="1%" align="center"><img src="images/seprator.gif" width="9" height="32" /></td>
    <td width="4%" align="center"><a href="index.jsp">论坛</a></td>
    <td width="1%"><img src="images/seprator.gif" width="9" height="32" /></td>
    <td width="5%" align="center">分类名称</td>
    <td width="43%" align="right">&nbsp;</td>
    <td width="43%" align="right"><form id="form1" name="form1" method="post" action="">
      搜索内容：
      <input name="textfield" type="text" class="searchword" id="textfield" />
      <input type="submit" name="button" id="button" value=" 搜 索 " />
  &nbsp;
    </form></td>
  </tr>
</table>

<!-- 信息条 -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="message">
  <tr>
    <td width="94%" height="36" align="left"><img src="images/item05.gif" width="15" height="20" align="absmiddle" />&nbsp;&nbsp;今日报道：<font color="#A10000">xx</font>&nbsp;&nbsp; &nbsp;&nbsp; <img src="images/item06.gif" width="18" height="18" align="absmiddle" />&nbsp;&nbsp;总共主题：<font color="#A10000">xx</font></td>
    <td width="6%" align="center"><a href="postpub.jsp"><img src="images/btnpub.gif" width="60" height="25" border="0" /></a></td>
  </tr>
</table>

<!--  分页上 -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="postlist">
  <tr>
    <td width="4%" height="35">&nbsp;</td>
    <td width="70%"><strong>贴子主题</strong></td>
    <td width="16%" align="center"><strong>作者/发布时间</strong></td>
    <td width="10%" align="center"><strong>浏览/回复</strong></td>
  </tr>
  
   <c:forEach var="one" items="${session.list}">
  <s:form id="teamform" method="post" action="postshowOne">
  <tr bgcolor="#F5F5F5">
    <td height="40" align="center" class="xian"><img src="images/topic.gif" width="17" height="17" /></td>
    <td class="xian"><input type="hidden" name="titlename" value="${one.getTitle()}"/><input type="submit" class="teamsubmit" value="${one.getTitle()}" class=""/>&nbsp;&nbsp;<img src="images/new.gif" width="26" height="9" align="absmiddle" /></td>
    <td align="center" class="xian">${one.getUsername()}</td>
    <td align="center" class="xian">123 / 25</td>
  </tr>
  </s:form>
  </c:forEach>
</table>

<!--  分页 -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56%" height="30">共 <font color="#FF6600">15</font> 页&nbsp;&nbsp;第 <font color="#FF6600">1</font> 页</td>
    <td width="36%" align="right">第&nbsp;&nbsp;1&nbsp;&nbsp;2&nbsp;&nbsp;3&nbsp;&nbsp;4&nbsp;&nbsp;5&nbsp;&nbsp;6&nbsp;&nbsp;7&nbsp;&nbsp;8&nbsp;&nbsp;9&nbsp;&nbsp;&nbsp;页</td>
    <td width="8%" align="right"><form id="form2" name="form2" method="post" action="">
      <input name="page" type="text" class="page" id="page" /><input name="button2" type="submit" class="pagebtn" id="button2" value="GO" />
    </form></td>
  </tr>  
</table>

<!-- 页面脚部 -->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="122"><iframe src="footer.jsp" width="100%" height="122" scrolling="no" frameborder="0"></iframe></td>
  </tr>
</table>

</body>
</html>

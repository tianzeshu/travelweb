<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="org.icer.ztssh.po.Team"%>
<%@page import="org.icer.ztssh.po.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>驴友之家</title>
<link href="styles/global.css" rel="stylesheet" type="text/css" />
<link href="styles/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
// 前往发表帖子页
function goPubPost(){
	location.href = "postpub.jsp";
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

<!-- 搜索条 -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="searchbar">
  <tr>
    <td width="2%" height="36" align="right"><img src="images/search.gif" width="13" height="13" /></td>
    <td width="90%"><form id="form1" name="form1" method="post" action="">
      <input name="searchword" type="text" class="searchword" id="searchword" />
      <input name="searchtype" type="radio" id="radio" value="title" checked="checked" /><label>标题</label>
      <input type="radio" name="searchtype" id="radio2" value="nickname" /><label>用户</label>
      <input type="submit" name="button" id="button" value=" 搜 索 " />
    </form></td>
    <td width="8%"><strong><img src="images/start.gif" width="15" height="15" align="absmiddle" /> <a href="#">收藏本站</a></strong></td>
  </tr>
</table>

 <%
  int num1=0;
  int num3=0;
  int person=0;
  try{
	   Class.forName("com.mysql.jdbc.Driver");
	   String url="jdbc:mysql://localhost:3306/ztssh";
	   Connection con=DriverManager.getConnection(url,"root","123456");
	   Statement stmt=con.createStatement();
	   String sql="select * from user";
	   ResultSet rs=stmt.executeQuery(sql);
	   while(rs.next()){
		 person++;  
	   }
	rs.close();
	stmt.close();
	con.close();
	}catch(Exception e){
	 e.printStackTrace();
	}
  try{
	   Class.forName("com.mysql.jdbc.Driver");
	   String url="jdbc:mysql://localhost:3306/ztssh";
	   Connection con=DriverManager.getConnection(url,"root","123456");
	   Statement stmt=con.createStatement();
	   String sql="select * from post";
	   ResultSet rs=stmt.executeQuery(sql);
	   while(rs.next()){
		 num1++;  
	   }
	rs.close();
	stmt.close();
	con.close();
	}catch(Exception e){
	 e.printStackTrace();
	}
  try{
   Class.forName("com.mysql.jdbc.Driver");
   String url="jdbc:mysql://localhost:3306/ztssh";
   Connection con=DriverManager.getConnection(url,"root","123456");
   Statement stmt=con.createStatement();
   String sql="select * from team";
   ResultSet rs=stmt.executeQuery(sql);
   while(rs.next()){
	 num3++;  
   }
rs.close();
stmt.close();
con.close();
}catch(Exception e){
 e.printStackTrace();
}
  %>

<!-- 信息条 -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="76%" height="36"><img src="images/item03.gif" width="16" height="15" align="absmiddle" /> 今日：xxxxxx个&nbsp; |&nbsp; 帖子：<%=num1+num3 %>个&nbsp; |&nbsp; 会员：<%=person %>人</td>
    <td width="24%" align="right"><input name="button2" type="button" class="pubbutton" id="button2" value="发表帖子" onclick="goPubPost()" /></td>
  </tr>
</table>

<!-- -----------------------板块开始---------------------- -->
<jsp:useBean id="time" class="java.util.Date"/> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="subtype">
  <tr>
    <td height="25" class="subtypetitle"><strong>※ 驴友之家首页 ※</strong></td>
  </tr>
  <tr>
    <td bgcolor="#F5F5F5">
     <!-- 分类项目开始 -->
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="typeitem">
      <tr>
        <td width="5%" height="60" align="center"><img src="images/ball.gif" width="31" height="29" /></td>
        <td width="69%">
        	<strong><font color="#333333"><a href="postshowAll">旅游攻略</a></font></strong> <font color="#AA0000">(<%=num1 %>)</font><br />
		  发表你的旅游攻略吧</td>
        <td width="15%" align="right"><img src="images/photo/1.gif" width="30" height="30" />&nbsp;</td>
        <td width="11%">版主：田泽庶<br />
          <%=time%></td>
      </tr>
    </table>

      <!-- 分类项目开始 -->
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="typeitem">
      <tr>
        <td width="5%" height="60" align="center"><img src="images/ball.gif" width="31" height="29" /></td>
        <td width="69%">
        	<strong><font color="#333333"><a href="teamshowAll">驴友小队</a></font></strong> <font color="#AA0000">(<%=num3 %>)</font><br />
		  创建你的驴友小队，开始一段新的旅程</td>
        <td width="15%" align="right"><img src="images/photo/1.gif" width="30" height="30" />&nbsp;</td>
        <td width="11%">版主：田泽庶<br />
          <%=time%></td>
      </tr>
    </table>
<!-- -------------------------板块结束----------------------------- -->


<!-- 页面脚部 -->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="122"><iframe src="footer.jsp" width="100%" height="122" scrolling="no" frameborder="0"></iframe></td>
  </tr>
</table>
</body>
</html>

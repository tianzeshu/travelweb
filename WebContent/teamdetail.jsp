<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="org.icer.ztssh.po.Team"%>
<%@page import="org.icer.ztssh.po.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>驴友之家</title>
<link href="styles/global.css" rel="stylesheet" type="text/css" />
<link href="styles/postdetail.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

function checkform(){
	var val = '<%=session.getAttribute("usertruename")%>';
	var val2 = '<%=session.getAttribute("teamtruename")%>';
	if(val2.indexOf(val) >= 0) {
		alert("你已经在队伍里了！");
		return false;
	}
	else {	
		return true;
	}
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
    <td width="3%" height="32" align="center"><img src="images/item04.gif" width="15" height="14" /></td>
    <td width="1%" align="center"><img src="images/seprator.gif" width="9" height="32" /></td>
    <td width="4%" align="center"><a href="index.jsp">论坛</a></td>
    <td width="1%"><img src="images/seprator.gif" width="9" height="32" /></td>
    <td width="5%" align="center"><a href="teamshowAll">小队信息</a></td>
    <td width="43%" align="right">&nbsp;</td>
    <td width="43%" align="right"><form id="form1" name="form1" method="post" action="">
      搜索内容：
      <input name="textfield" type="text" class="searchword" id="textfield" />
      <input type="submit" name="button" id="button" value=" 搜 索 " />
  &nbsp;
    </form></td>
  </tr>
</table>


<!--  发帖回复条 -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="72%" height="40"><a href="teampostpub.jsp"><img src="images/btnpub.gif" width="60" height="25" border="0" /></a>&nbsp;&nbsp;<a href="#reply"><img src="images/btnreply.gif" width="60" height="25" border="0" /></a></td>
    <td width="28%" align="right">&nbsp;</td>
  </tr>
</table>

<!-- 帖子明细 -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="postdetail">
  <tr>
<% int num=0;
  try{
   Class.forName("com.mysql.jdbc.Driver");
   String url="jdbc:mysql://localhost:3306/ztssh";
   Connection con=DriverManager.getConnection(url,"root","123456");
   Statement stmt=con.createStatement();
   String sql="select * from reply where title = '";
   Team team = (Team)session.getAttribute("teamname");
   sql+=team.getTeamname()+"'";
   System.out.println(sql);
   ResultSet rs=stmt.executeQuery(sql);
   while(rs.next()){
	 num++;  
   }
rs.close();
stmt.close();
con.close();
}catch(Exception e){
 e.printStackTrace();
}
  %>
    <td width="17%" height="35" align="center" class="xian">浏览：xxx&nbsp; |&nbsp; 回复：<%=num %></td>
    <td width="77%" align="center" bgcolor="#F5F5F5" class="xian"><H3>${session.teamname.getTeamname()}</H3></td>
    <td width="6%" align="center" bgcolor="#F5F5F5" class="xian"><img src="images/fresh.gif" width="19" height="19" onclick="javascript:location.href='teamdetail.jsp'"/></td>
  </tr>
  <tr>
  
  <% 
  Team newteam = (Team)session.getAttribute("teamname");
  for(User k:(ArrayList<User>)session.getAttribute("alluser")) {
	if(k.getUsername().equals(newteam.getTeamleader())) {
		String photo2 = "images/photo/";
		photo2 += k.getPhoto();
	%>
     <td align="center" valign="top"><br />
    <img src=<%=photo2 %> width="44" height="44" /><br />
    <%=k.getNickname() %><br />    
    <img src="images/money.gif" width="24" height="24" align="absmiddle" /><font color="#A10000"><%=k.getMoneys() %></font><br /><br /></td>
<% } }%>
    <td colspan="2" valign="top" bgcolor="#F5F5F5"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td class="postcontent" style="border-top:none;">队员：${session.teamname.getMember()}</td>     
      </tr>
      <tr>
        <td class="postcontent" style="border-top:none;">目的地：${session.teamname.getDestination()}</td>
      </tr>
      <tr>
        <td class="postcontent" style="border-top:none;">时间：${session.teamname.getTime()}</td>
      </tr>
      <tr>
        <td class="postcontent" style="border-top:none;">预算：${session.teamname.getMoney()}</td>
      </tr>
      <tr>
        <td class="postcontent" style="border-top:none;">创建者：${session.teamname.getTeamcreate()}</td>
      </tr>
      <tr>
        <td height="60" align="left"><table width="5" border="0" cellspacing="0" cellpadding="0">
        <s:form action="teammemberAdd" method="post" onsubmit = "return checkform()">
          <input type="hidden" name="fteamname" value="${session.teamname.getTeamname()}"/>
          <input type="hidden" name="fmember" value="${session.user.getUsername()}"/>
          <tr>
            <td  width="10%" height="30"><input type="submit" id="input" class="team" value="加入该队" /></td>
          </tr>
        </s:form>
        </table></td>
      </tr>
    </table></td>
  </tr>
  
   <%
  try{
   Class.forName("com.mysql.jdbc.Driver");
   String url="jdbc:mysql://localhost:3306/ztssh";
   Connection con=DriverManager.getConnection(url,"root","123456");
   Statement stmt=con.createStatement();
   String sql="select * from reply where title = '";
   Team team = (Team)session.getAttribute("teamname");
   sql+=team.getTeamname()+"'";
   System.out.println(sql);
   ResultSet rs=stmt.executeQuery(sql);
   while(rs.next()){
  %>
<tr>
    <td align="center" class="xian_top"><br />
    <% for(User k:(ArrayList<User>)session.getAttribute("alluser")) {
	if(k.getUsername().equals(rs.getObject(2))) {
		String photo = "images/photo/";
		photo += k.getPhoto();
	%>
      <img src=<%=photo%> width="44" height="44" /><br /><%=k.getNickname() %><br />
<img src="images/money.gif" width="26" height="25" align="absmiddle" />



<font color="#A10000"><%=k.getMoneys()%></font><br /><br />
<% } }%>
</td>
    <td colspan="2" valign="top" bgcolor="#F5F5F5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="28" class="xian_top">&nbsp;&nbsp; <img src="images/item07.gif" width="16" height="16" align="absmiddle" />&nbsp;&nbsp;发表于<%=rs.getObject(6) %></td>
        <td align="right" class="xian_top"><%=rs.getObject(4) %>楼&nbsp; &nbsp; </td>
      </tr>
      <tr>
        <td colspan="2" class="postcontent"><%=rs.getObject(5) %></p></td>
        </tr>
    </table></td>
  </tr>   
  <%
  }
   rs.close();
   stmt.close();
   con.close();
   }catch(Exception e){
    e.printStackTrace();
   }
   %>    
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
<jsp:useBean id="time" class="java.util.Date"/>  
<form id="form2" name="form2" method="post" action="replyReplyadd">
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="reply" id="reply">
    <tr>
      <input type="hidden" name="username" value="${session.user.getUsername()}"/>
      <input type="hidden" name="title" value="${session.teamname.getTeamname()}"/>
      <input type="hidden" name="time" value="<%=time%>"/>
      <input type="hidden" name="number" value="<%=num+1%>"/>
      <td width="17%" height="35" align="center">&nbsp;</td>
      <td align="left" bgcolor="#F5F5F5"><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a name="reply">回复：${session.teamname.getTeamname()}</a></h4></td>
    </tr>
    <tr>
      <td align="center" valign="top"><br /></td>
      <td align="center" valign="top" bgcolor="#F5F5F5"><textarea name="text" id="textarea" cols="80" rows="8" style="width:96%"></textarea></td>
    </tr>
    <tr>
      <td height="35" align="center"><font color="#A10000"><br />
      </font></td>
      <td align="right" bgcolor="#F5F5F5"><input type="submit" name="button2" id="button2" value="发表回复" />
        &nbsp; &nbsp;&nbsp; </td>
    </tr>
  </table>
</form>
<!-- 页面脚部 -->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="122"><iframe src="footer.jsp" width="100%" height="122" scrolling="no" frameborder="0"></iframe></td>
  </tr>
</table>

</body>
</html>

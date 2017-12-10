<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="styles/upphoto.css" rel="stylesheet" type="text/css" />
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
    <td width="5%" align="center">个人中心</td>
    <td width="1%" align="right"><img src="images/seprator.gif" width="9" height="32" /></td>
    <td width="5%" align="center">头像上传</td>
    <td width="43%" align="left">&nbsp;</td>
    <td width="37%" align="left">&nbsp;</td>
  </tr>
</table>

 
		   


<!-- 信息条 -->
<!--  分页上 -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="userarea">
  <tr>
    <td height="450" align="center" bgcolor="#FFFFFF"><table width="700" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="31%" align="center" valign="top"><table width="150" border="0" cellpadding="0" cellspacing="0" id="userphoto">
          <tr>
          <%
  String photo = "images/photo/";
  try{
	   Class.forName("com.mysql.jdbc.Driver");
	   String url="jdbc:mysql://localhost:3306/ztssh";
	   Connection con=DriverManager.getConnection(url,"root","123456");
	   Statement stmt=con.createStatement();
	   User user = (User)session.getAttribute("user");
	   String sql="select * from user where username='";
	   sql+=user.getUsername()+"'";
	   ResultSet rs=stmt.executeQuery(sql);
	   if(rs.next()){
		   if(rs.getObject(13)==null) {
		   photo+=rs.getObject(8);%>
            <td height="150" align="center" valign="middle"><img id="photo" class="photo" src=<%=photo %> /></td>
   <% 	   }else { %>
	   <td height="150" align="center" valign="middle"><img id="photo" class="photo" src=<%=rs.getObject(13) %> /></td>
   <% }
	}
	rs.close();
	stmt.close();
	con.close();
	}catch(Exception e){
	 e.printStackTrace();
	}
  %>
          </tr>
          <tr>
            <td height="25" align="center" bgcolor="#EFEFEF">用户当前头像</td>
          </tr>
        </table></td>
        <td width="69%" align="left"><form action="userphoto" method="post" enctype="multipart/form-data" name="form2" id="form2">
          <table width="90%" border="0" cellpadding="0" cellspacing="0" id="uploadarea">
            <tr>
              <input type="hidden" name="username" value="${session.user.getUsername() }" />
              <td width="21%" align="left" valign="bottom"><font size="2"><strong>会员头像上传</strong></font></td>
            </tr>
            <tr>
              <td><hr /></td>
            </tr>
            <tr>
              <td align="left"><font color="#999999">请选择符合要求的头像照片并进行上传！</font></td>
            </tr>
            <tr>
              <td height="80" align="left"><input type="file" name="photo2" id="fileField" size="40" />
                <input type="submit" name="button" id="button" value="上传头像" /></td>
            </tr>
            <tr>
              <td align="left"><font color="#CC3300">注意：头像照片只能为.jpg、.gif或.png格式，并且不能超过100K。</font></td>
            </tr>
            </table>
        </form></td>
      </tr>
    </table></td>
  </tr>
</table>
<!--  分页 -->
<!-- 页面脚部 -->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="122"><iframe src="footer.jsp" width="100%" height="122" scrolling="no" frameborder="0"></iframe></td>
  </tr>
</table>

</body>
</html>

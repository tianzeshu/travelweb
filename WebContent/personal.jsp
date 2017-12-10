<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>驴友之家</title>
<link href="styles/global.css" rel="stylesheet" type="text/css" />
<link href="styles/personal.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function showUpdate(){
	document.getElementById("span_password").style.display = "none";
	document.getElementById("span_nickname").style.display = "none";
	document.getElementById("span_gender").style.display = "none";
	document.getElementById("span_city").style.display = "none";
	document.getElementById("span_hobby").style.display = "none";
	document.getElementById("span_sign").style.display = "none";
	document.getElementById("btnupdate").style.display = "none";
	
	document.getElementById("password").style.display = "block";
	document.getElementById("nickname").style.display = "block";
	document.getElementById("gender").style.display = "block";
	document.getElementById("city").style.display = "block";
	document.getElementById("hobby").style.display = "block";
	document.getElementById("sign").style.display = "block";
	document.getElementById("btnsubmit").style.display = "inline";
	document.getElementById("btnreset").style.display = "inline";
	document.getElementById("btncancel").style.display = "inline";
	document.getElementById("nickname").focus();
}
function hiddenUpdate(){
	document.getElementById("span_password").style.display = "block";
	document.getElementById("span_nickname").style.display = "block";
	document.getElementById("span_gender").style.display = "block";
	document.getElementById("span_city").style.display = "block";
	document.getElementById("span_hobby").style.display = "block";
	document.getElementById("span_sign").style.display = "block";
	document.getElementById("btnupdate").style.display = "block";
	
	document.getElementById("password").style.display = "none";
	document.getElementById("nickname").style.display = "none";
	document.getElementById("gender").style.display = "none";
	document.getElementById("city").style.display = "none";
	document.getElementById("hobby").style.display = "none";
	document.getElementById("sign").style.display = "none";
	document.getElementById("btnsubmit").style.display = "none";
	document.getElementById("btnreset").style.display = "none";
	document.getElementById("btncancel").style.display = "none";
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
    <td width="5%" align="center">个人中心</td>
    <td width="43%" align="right">&nbsp;</td>
    <td width="43%" align="right">&nbsp;</td>
  </tr>
</table>

<!-- 信息条 -->
<!--  分页上 -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="userarea">
  <tr>
    <td height="35">&nbsp;&nbsp;在这里你可以浏览的你的帐号信息，并对部分信息进行修改</td>
  </tr>
  <tr>
    <td height="450" align="center" bgcolor="#FFFFFF"><table width="800" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="28%" align="center" valign="top"><table width="150" border="0" cellpadding="0" cellspacing="0" id="userphoto">
          <tr>
            <td height="150" align="center" valign="middle"><img class="photo" src="images/photo/1.gif" /></td>
          </tr>
          <tr>
            <td height="25" align="center" bgcolor="#EFEFEF"><a href="upphoto.jsp">上传用户头像</a></td>
          </tr>
        </table></td>
        <td width="72%" align="center" style="border:solid 1px #CCC">
        <form id="form2" name="form2" method="post" action="userchange">
          <table width="90%" border="0" cellpadding="0" cellspacing="0" id="userinfo">
            <tr>
              <td height="40" colspan="2" align="center" valign="bottom"><h3><u>用户信息显示及修改</u></h3></td>
              </tr>
            <tr>             
              <input type="hidden" name="username" value="${session.user.getUsername() }" />
              <td width="21%" height="30" align="right" valign="bottom" bgcolor="#EFEFEF">用户名：</td>
              <td width="79%" align="left" valign="bottom" bgcolor="#EFEFEF" class="text01">${session.user.getUsername()}</td>
            </tr>
            <tr>
              <td height="30" align="right" valign="bottom">密码：</td>
              <td align="left" valign="bottom" class="text01"><span id="span_password">${session.user.getPassword()}</span>
               <input name="password" type="text" id="password" class="input01" value="${session.user.getPassword()}" /></td>
            </tr>
            <tr>
              <td height="30" align="right" valign="bottom" bgcolor="#EFEFEF">昵称：</td>
              <td align="left" valign="bottom" bgcolor="#EFEFEF" class="text01"><span id="span_nickname">${session.user.getNickname()}</span>
                <input name="nickname" type="text" id="nickname" class="input01" value="${session.user.getNickname()}" /></td>
            </tr>
            <tr>
              <td height="30" align="right" valign="bottom">性别：</td>
              <td align="left" valign="bottom" class="text01"><span id="span_gender">${session.user.getGender()}</span>
                <input name="gender" type="text" id="gender" class="input01" value="${session.user.getGender()}" /></td>
            </tr>
            <tr>
              <td height="30" align="right" valign="bottom" bgcolor="#EFEFEF">所在城市：</td>
              <td align="left" valign="bottom" bgcolor="#EFEFEF" class="text01"><span id="span_city">${session.user.getCity()}</span>
                <input name="city" type="text" id="city" class="input01" value="${session.user.getCity()}" /></td>
            </tr>
            <tr>
              <td height="30" align="right" valign="bottom">爱好：</td>
              <td align="left" valign="bottom" class="text01"><span id="span_hobby">${session.user.getHobby()}</span>
                <input name="hobby" type="text" id="hobby" class="input01" value="${session.user.getHobby()}" /></td>
            </tr>
            <tr>
              <td height="30" align="right" valign="bottom" bgcolor="#EFEFEF">签名：</td>
              <td align="left" valign="bottom" bgcolor="#EFEFEF" class="text01"><span id="span_sign">${session.user.getSign()}</span>
                <input name="sign" type="text" id="sign" class="input01" value="${session.user.getSign()}" /></td>
            </tr>
            <tr>
              <td height="30" align="right" valign="bottom">金币：</td>
              <td align="left" valign="bottom" class="text01">${session.user.getMoneys()}</td>
            </tr>
            <tr>
              <td height="30" align="right" valign="bottom" bgcolor="#EFEFEF">注册日期：</td>
              <td align="left" valign="bottom" bgcolor="#EFEFEF" class="text01">${session.user.getRegdate()}</td>
            </tr>
            <tr>
              <td height="60" align="right">&nbsp;</td>
              <td align="left"><input type="button" name="btnupdate" id="btnupdate" value="修改注册信息" onclick="showUpdate()" />
                <input type="submit" name="btnsubmit" id="btnsubmit" value="修改" style="display:none" />
                <input type="reset" name="btnreset" id="btnreset" value="还原" style="display:none" />
                <input type="submit" name="btncancel" id="btncancel" value="取消" style="display:none" onclick="hiddenUpdate()" /></td>
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

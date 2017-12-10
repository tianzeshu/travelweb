<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>驴友之家</title>
<link href="styles/global.css" rel="stylesheet" type="text/css" />
<link href="styles/register.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function checkForm(){
	// 验证用户名长度
	if(document.getElementById("username").value.length<5){
		alert("用户名不能少于5位！");
		return false;
	}
	// 密码长度
	if(document.getElementById("password").value.length<6){
		alert("密码不能少于6位！");
		return false;
	}
	// 两次密码一致
	if(document.getElementById("password").value != document.getElementById("password2").value){
		alert("两次输入密码不一致！");
		return false;
	}
	// 判断同意条款
	if(document.getElementById("isagree").checked == false){
		alert("你必须阅读并且同一条款才能进行注册！");
		return false;
	}
	// 判断验证码是否填写
	if(document.getElementById("valcode").value == ""){
		alert("请填写验证码！");
		return false;
	}
}
// 控制注册按钮是否可用
function isRegister(){
	var isagree = document.getElementById("isagree");
	var regButton = document.getElementById("regButton");
	/*if(isagree.checked == true)
		regButton.disabled = false;
	else
		regButton.disabled = true;*/
	regButton.disabled = ! isagree.checked;
}
// 验证用户名的函数
function checkUsername(){
	var username = document.getElementById("username");
	var usernamemsg = document.getElementById("usernamemsg");
	if(username.value.length<5){
		usernamemsg.innerHTML = "<font color='red'>用户名不能少于5位！</font>";
		username.className = "input02";
	}else{
		usernamemsg.innerHTML = "<font color='green'>用户填写正确！</font>";
		username.className = "input01";
	}
}
// 验证密码的函数
function checkPassword(){
	var password = document.getElementById("password");
	var passwordmsg = document.getElementById("passwordmsg");
	if(password.value.length<6){
		passwordmsg.innerHTML = "<font color='red'>密码不能少于6位！</font>";
		password.className = "input02";
	}else{
		passwordmsg.innerHTML = "<font color='green'>密码填写正确！</font>";
		password.className = "input01";
	}
}
// 验证重复密码的函数
function checkPassword2(){
	var password = document.getElementById("password");
	var password2 = document.getElementById("password2");
	var password2msg = document.getElementById("password2msg");
	if(password.value != password2.value){
		password2msg.innerHTML = "<font color='red'>两次输入密码不一致！</font>";
		password2.className = "input02";
	}else{
		password2msg.innerHTML = "<font color='green'>两次密码输入一致！</font>";
		password2.className = "input01";
	}
}

function checkValcode(){
	var valcode = document.getElementById("valcode");
	if(valcode.value == "做活之师"){
		return true;
	}else{
		alert("验证码错误！");
		return false;
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
    <td width="1%" height="32">&nbsp;</td>
    <td width="2%"><img src="images/ren.gif" width="19" height="18" /></td>
    <td width="92%"><strong>新用户注册</strong></td>
    <td width="5%"><a href="index.jsp">返回首页</a></td>
  </tr>
</table>

<!-- 表单部分 -->
<jsp:useBean id="time" class="java.util.Date"/>  
<s:form name="regForm" id="regForm" action="userlogin" method="post" onsubmit="return checkForm()">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
    <fieldset class="fs">
    	<legend><img src="images/item01.gif" align="absmiddle" /><strong>登录信息资料</strong></legend>
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="12%" height="30">登录名称：</td>
    <td width="33%" align="left"><input name="username" type="text" class="input01" id="username" onblur="checkUsername()" /></td>
    <td width="55%" align="left" class="text01" id="usernamemsg">注意：请填写登录用户名不得少于5位，一旦注册不能修改。</td>
  </tr>
  <tr>
    <td height="30">登录密码：</td>
    <td align="left"><input name="password" type="password" class="input01" id="password" onblur="checkPassword()" /></td>
    <td align="left" class="text01" id="passwordmsg">注意：请填写密码作为登录凭证，不得少于6位。</td>
  </tr>
  <tr>
    <td height="30">确认密码：</td>
    <td align="left"><input name="password2" type="password" class="input01" id="password2" onblur="checkPassword2()" /></td>
    <td align="left" class="text01" id="password2msg">注意：请填写确认密码，两次密码输入要一致。</td>
  </tr>
</table>

    </fieldset>
    </td>
  </tr>
  <tr>
    <td align="center"><fieldset class="fs">
    	<legend><img src="images/item02.gif" align="absmiddle" /><strong>个人信息资料</strong></legend>
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="12%" height="30">用户昵称：</td>
    <td width="33%" align="left"><input name="nickname" type="text" class="input01" id="nikename" /></td>
    <td width="55%" align="left" class="text01">注意：请填写你的昵称，注册后可以在个人中心更改。</td>
  </tr>
  <tr>
    <td height="30">用户性别：</td>
    <td align="left"><input type="radio" name="gender" id="radio" value="男" />
      男
      &nbsp; &nbsp;  <input type="radio" name="gender" id="radio2" value="女" />
      女
      &nbsp; &nbsp;  <input name="gender" type="radio" id="radio3" value="保密" checked="checked" />保密</td>
    <td align="left" class="text01">注意：请填写密码作为登录凭证，不得少于6位。</td>
  </tr>
  <tr>
    <td height="30">所在城市：</td>
    <td align="left"><select name="city" class="input01" id="city">
      <option value="请选择">----- 请选择城市 ------</option>
      <optgroup label="直辖市">
      <option value="北京市">北京市</option>
      <option value="天津市">天津市</option>
      <option value="上海市">上海市</option>
      <option value="重庆市">重庆市</option>
      </optgroup>
      <optgroup label="安徽省">
      <option value="合肥市">合肥市</option>
      <option value="安庆市">安庆市</option>
      <option value="蚌埠市">蚌埠市</option>
      <option value="巢湖地区">巢湖地区</option>
      <option value="池州地区">池州地区</option>
      <option value="滁州市">滁州市</option>
      <option value="阜阳地区">阜阳地区</option>
      <option value="淮北市">淮北市</option>
      <option value="淮南市">淮南市</option>
      <option value="黄山市">黄山市</option>
      <option value="六安地区">六安地区</option>
      <option value="马鞍山市">马鞍山市</option>
      <option value="宿县地区">宿县地区</option>
      <option value="铜陵市">铜陵市</option>
      <option value="芜湖市">芜湖市</option>
      <option value="宣城地区">宣城地区</option>
      </optgroup>   
      <optgroup label="福建省">
      <option value="福州市">福州市</option>
      <option value="龙岩地区">龙岩地区</option>
      <option value="南平地区">南平地区</option>
      <option value="宁德地区">宁德地区</option>
      <option value="莆田市">莆田市</option>
      <option value="泉州市">泉州市</option>
      <option value="三明市">三明市</option>
      <option value="厦门市">厦门市</option>
      <option value="漳州市">漳州市</option>
      </optgroup>
      <optgroup label="河北省">
      <option value="石家庄市">石家庄市</option>
      <option value="沧州市">沧州市</option>
      <option value="邯郸市">邯郸市</option>
      <option value="邢台市">邢台市</option>
      <option value="廊坊市">廊坊市</option>
      </optgroup>
      <option value="其他">其他…</option>
    </select></td>
    <td align="left" class="text01">注意：请填写确认密码，两次密码输入要一致。</td>
  </tr>
  <tr>
    <td height="30">你的爱好：</td>
    <td colspan="2" align="left"><input name="hobby" type="checkbox" id="hobby" value="上网购物" />
      上网购物
        &nbsp; <input name="hobby" type="checkbox" id="hobby" value="网络游戏" />
        网络游戏
        &nbsp; <input name="hobby" type="checkbox" id="hobby" value="品尝美食" />
        品尝美食
        &nbsp; <input name="hobby" type="checkbox" id="hobby" value="户外运动" />
        户外运动
        &nbsp; <input name="hobby" type="checkbox" id="hobby" value="其他" />
        其他</td>
    </tr>
  <tr>
    <td height="120">个人头像：</td>
    <td colspan="2" align="left"><input type="radio" name="photo" id="radio4" value="1.gif" />
      <img src="images/photo/1.gif" width="44" height="44" align="absmiddle" />
      <input type="radio" name="photo" id="radio5" value="2.gif" />
      <img src="images/photo/2.gif" width="44" height="44" align="absmiddle" />
      <input type="radio" name="photo" id="radio6" value="3.gif" />
      <img src="images/photo/3.gif" width="44" height="44" align="absmiddle" />
      <input type="radio" name="photo" id="radio7" value="4.gif" />
      <img src="images/photo/4.gif" width="44" height="44" align="absmiddle" />
      <input type="radio" name="photo" id="radio8" value="5.gif" />
      <img src="images/photo/5.gif" width="44" height="44" align="absmiddle" />
      <input type="radio" name="photo" id="radio9" value="6.gif" />
      <img src="images/photo/6.gif" width="44" height="44" align="absmiddle" />
      <input type="radio" name="photo" id="radio10" value="7.gif" />
      <img src="images/photo/7.gif" width="44" height="44" align="absmiddle" /><br />
      <br />
      <input type="radio" name="photo" id="radio11" value="8.gif" />
      <img src="images/photo/8.gif" width="44" height="44" align="absmiddle" />
      <input type="radio" name="photo" id="radio12" value="9.gif" />
      <img src="images/photo/9.gif" width="44" height="44" align="absmiddle" />
      <input type="radio" name="photo" id="radio13" value="10.gif" />
      <img src="images/photo/10.gif" width="44" height="44" align="absmiddle" />
      <input type="radio" name="photo" id="radio14" value="11.gif" />
      <img src="images/photo/11.gif" width="44" height="44" align="absmiddle" />
      <input type="radio" name="photo" id="radio15" value="12.gif" />
      <img src="images/photo/12.gif" width="44" height="44" align="absmiddle" />
      <input type="radio" name="photo" id="radio16" value="13.gif" />
      <img src="images/photo/13.gif" width="44" height="44" align="absmiddle" />
      <input type="radio" name="photo" id="radio17" value="14.gif" />
      <img src="images/photo/14.gif" width="44" height="43" align="absmiddle" /></td>
    </tr>
  <tr>
    <td height="70">个性签名：</td>
    <td colspan="2" align="left"><textarea name="sign" id="sign" cols="55" rows="5"></textarea></td>
  </tr>
  <input id="money" name="money" type="hidden" value=0 />
  <input id="time" name="regdate" type="hidden" value="<%=time%>" />
  <tr>
    <td height="50">验 证 码：</td>
    <td colspan="2" align="left"><input name="valcode" type="text" class="input03" id="valcode" />      <img src="images/valcode.png" width="82" height="22" align="absmiddle" />
      <input type="button" name="button" id="button" value="看不清，点击换一张" /></td>
  </tr>
        </table>

    </fieldset></td>
  </tr>
  <tr>
    <td align="center"><fieldset class="fs">
    	<legend><img src="images/item01.gif" align="absmiddle" /><strong>注册条款</strong></legend>
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><textarea name="textarea2" id="textarea2" cols="65" rows="5">欢迎注册成为会员，注册表示您必须接受以下条款：

注册前请仔细阅读，您只有无条件接受以下所有服务条款，才能继续申请：
如果用户提供的资料不准确，不真实，不合法有效，本站保留结束用户使用本站各项服务的权利。

用户在享用本站各项服务的同时，同意接受提供的各类信息服务。

3、服务条款的修改 

本站会在必要时修改服务条款，本站服务条款一旦发生变动，公司将会在用户进入下一步使用前的页面提示修改内容。如果您同意改动，则再一次激活“我同意”按钮。如果您不接受，则及时取消您的用户使用服务资格。

用户要继续使用本站各项服务需要两方面的确认：

（1）首先确认本站服务条款及其变动。

（2）同意接受所有的服务条款限制。

4、服务修订

本站保留随时修改或中断服务而不需通知用户的权利。用户接受本站行使修改或中断服务的权利，本站不需对用户或第三方负责。

5、用户隐私制度 

尊重用户个人隐私是本站的一项基本政策。所以，作为对以上第二点个人注册资料分析的补充，本站一定不会公开、编辑或透露用户的注册资料及保存在本站各项服务中的非公开内容，除非本站在诚信的基础上认为透露这些信息在以下几种情况是必要的：
1、服务条款的确认和接纳

本站服务的所有权和运作权归本站所有。所提供的服务必须按照其发布的公司章程，服务条款和操作规则严格执行。用户通过完成注册程序并点击一下“我同意”的按钮，这表示用户与本站达成协议并接受所有的服务条款。

2、服务简介

本站运用自己的操作系统通过国际互联网络为用户提供各项服务，而这种服务是免费的。用户必须：

（1）提供设备，包括个人电脑一台、调制解调器一个及配备上网装置。

（2）个人上网和支付与此服务有关的电话费用。

考虑到本站产品服务的重要性，用户同意：

（1）提供及时、详尽及准确的个人资料。

（2）不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。

另外，用户可授权本站向第三方透露其注册资料，否则本站不能公开用户的姓名、住址、出件地址、电子邮箱、帐号。除非：（1）用户要求本站或授权某人通过电子邮件服务透露这些信息。

（2）相应的法律、法规要求及程序服务需要本站提供用户的个人资料。
（1）遵守有关法律规定，包括在国家有关机关查询时，提供用户在本站的网页上发布的信息内容及其发布时间、互联网地址或者域名。

（2）遵从本站产品服务程序。

（3）保持维护本站的商标所有权。

（4）在紧急情况下竭力维护用户个人和社会大众的隐私安全。

（5）根据第11条的规定或者本站认为必要的其他情况下。用户在此授权本站可以向其电子邮箱发送商业信息。

6、用户的帐号、密码和安全性

您一旦注册成功成为用户，您将得到一个密码和帐号。如果您未保管好自己的帐号和密码而对您、本站或第三方造成的损害，您将负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时改变您的密码和图标，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通告本站。

7、拒绝提供担保

用户明确同意服务的使用由用户个人承担风险。服务提供是建立在免费的基础上。本站明确表示不提供任何类型的担保，不论是明确的或隐含的，但是对商业性的隐含担保，特定目的和不违反规定的适当担保除外。本站不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性、安全性、出错发生都不作担保。本站拒绝提供任何担保，包括信息能否准确、及时、顺利地传送。用户理解并接受下载或通过本站产品服务取得的任何信息资料取决于用户自己，并由其承担系统受损或资料丢失的所有风险和责任。本站对在服务网上得到的任何商品购物服务或交易进程，都不作担保。用户不会从本站收到口头或书面的意见或信息，本站也不会在这里作明确担保。

8、有限责任

本站对直接、间接、偶然、特殊及继起的损害不负责任，这些损害来自：不正当使用产品服务，在网上购买商品或类似服务，在网上进行交易，非法使用服务或用户传送的信息有所变动。这些损害会导致本站形象受损，所以本站早已提出这种损害的可能性。

9、不提供零售和商业性服务

用户使用本站各项服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体的商业性组织。用户承诺不经本站同意，不能利用本站各项服务进行销售或其他商业用途。</textarea></td>
    </tr>
  <tr>
    <td height="30"><input name="isagree" type="checkbox" id="isagree" value="yes" onclick="isRegister()" />
      已经详细阅读并同意服务条框</td>
    </tr>
  </table>

    </fieldset></td>
  </tr>
  <tr>
    <td height="36" align="center"><input type="submit" name="regButton" id="regButton" value=" 立即注册 " disabled="disabled" onclick="checkValcode()"/>
      &nbsp; &nbsp; &nbsp; <input type="reset" name="button2" id="button2" value=" 重新填写 " /></td>
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

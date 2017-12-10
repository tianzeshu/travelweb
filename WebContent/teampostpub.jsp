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
<link href="styles/teampostpub.css" rel="stylesheet" type="text/css" />
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
<script type="text/javascript">
function HS_DateAdd(interval,number,date){
 number = parseInt(number);
 if (typeof(date)=="string"){var date = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2])}
 if (typeof(date)=="object"){var date = date}
 switch(interval){
 case "y":return new Date(date.getFullYear()+number,date.getMonth(),date.getDate()); break;
 case "m":return new Date(date.getFullYear(),date.getMonth()+number,checkDate(date.getFullYear(),date.getMonth()+number,date.getDate())); break;
 case "d":return new Date(date.getFullYear(),date.getMonth(),date.getDate()+number); break;
 case "w":return new Date(date.getFullYear(),date.getMonth(),7*number+date.getDate()); break;
 }
}
function checkDate(year,month,date){
 var enddate = ["31","28","31","30","31","30","31","31","30","31","30","31"];
 var returnDate = "";
 if (year%4==0){enddate[1]="29"}
 if (date>enddate[month]){returnDate = enddate[month]}else{returnDate = date}
 return returnDate;
}
function WeekDay(date){
 var theDate;
 if (typeof(date)=="string"){theDate = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2]);}
 if (typeof(date)=="object"){theDate = date}
 return theDate.getDay();
}
function HS_calender(){
 var lis = "";
 var style = "";
 style +="<style type='text/css'>";
 style +=".calender { width:170px; height:auto; font-size:12px; margin-right:14px; background:url(calenderbg.gif) no-repeat right center #fff; border:1px solid #397EAE; padding:1px}";
 style +=".calender ul {list-style-type:none; margin:0; padding:0;}";
 style +=".calender .day { background-color:#EDF5FF; height:20px;}";
 style +=".calender .day li,.calender .date li{ float:left; width:14%; height:20px; line-height:20px; text-align:center}";
 style +=".calender li a { text-decoration:none; font-family:Tahoma; font-size:11px; color:#333}";
 style +=".calender li a:hover { color:#f30; text-decoration:underline}";
 style +=".calender li a.hasArticle {font-weight:bold; color:#f60 !important}";
 style +=".lastMonthDate, .nextMonthDate {color:#bbb;font-size:11px}";
 style +=".selectThisYear a, .selectThisMonth a{text-decoration:none; margin:0 2px; color:#000; font-weight:bold}";
 style +=".calender .LastMonth, .calender .NextMonth{ text-decoration:none; color:#000; font-size:18px; font-weight:bold; line-height:16px;}";
 style +=".calender .LastMonth { float:left;}";
 style +=".calender .NextMonth { float:right;}";
 style +=".calenderBody {clear:both}";
 style +=".calenderTitle {text-align:center;height:20px; line-height:20px; clear:both}";
 style +=".today { background-color:#ffffaa;border:1px solid #f60; padding:2px}";
 style +=".today a { color:#f30; }";
 style +=".calenderBottom {clear:both; border-top:1px solid #ddd; padding: 3px 0; text-align:left}";
 style +=".calenderBottom a {text-decoration:none; margin:2px !important; font-weight:bold; color:#000}";
 style +=".calenderBottom a.closeCalender{float:right}";
 style +=".closeCalenderBox {float:right; border:1px solid #000; background:#fff; font-size:9px; width:11px; height:11px; line-height:11px; text-align:center;overflow:hidden; font-weight:normal !important}";
 style +="</style>";
 var now;
 if (typeof(arguments[0])=="string"){
  selectDate = arguments[0].split("-");
  var year = selectDate[0];
  var month = parseInt(selectDate[1])-1+"";
  var date = selectDate[2];
  now = new Date(year,month,date);
 }else if (typeof(arguments[0])=="object"){
  now = arguments[0];
 }
 var lastMonthEndDate = HS_DateAdd("d","-1",now.getFullYear()+"-"+now.getMonth()+"-01").getDate();
 var lastMonthDate = WeekDay(now.getFullYear()+"-"+now.getMonth()+"-01");
 var thisMonthLastDate = HS_DateAdd("d","-1",now.getFullYear()+"-"+(parseInt(now.getMonth())+1).toString()+"-01");
 var thisMonthEndDate = thisMonthLastDate.getDate();
 var thisMonthEndDay = thisMonthLastDate.getDay();
 var todayObj = new Date();
 today = todayObj.getFullYear()+"-"+todayObj.getMonth()+"-"+todayObj.getDate();
 
 for (i=0; i<lastMonthDate; i++){  // Last Month's Date
  lis = "<li class='lastMonthDate'>"+lastMonthEndDate+"</li>" + lis;
  lastMonthEndDate--;
 }
 for (i=1; i<=thisMonthEndDate; i++){ // Current Month's Date
  if(today == now.getFullYear()+"-"+now.getMonth()+"-"+i){
   var todayString = now.getFullYear()+"-"+(parseInt(now.getMonth())+1).toString()+"-"+i;
   lis += "<li><a href=javascript:void(0) class='today' onclick='_selectThisDay(this)' title='"+now.getFullYear()+"-"+(parseInt(now.getMonth())+1)+"-"+i+"'>"+i+"</a></li>";
  }else{
   lis += "<li><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"+now.getFullYear()+"-"+(parseInt(now.getMonth())+1)+"-"+i+"'>"+i+"</a></li>";
  }
  
 }
 var j=1;
 for (i=thisMonthEndDay; i<6; i++){  // Next Month's Date
  lis += "<li class='nextMonthDate'>"+j+"</li>";
  j++;
 }
 lis += style;
 var CalenderTitle = "<a href='javascript:void(0)' class='NextMonth' onclick=HS_calender(HS_DateAdd('m',1,'"+now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+"'),this) title='Next Month'>&raquo;</a>";
 CalenderTitle += "<a href='javascript:void(0)' class='LastMonth' onclick=HS_calender(HS_DateAdd('m',-1,'"+now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+"'),this) title='Previous Month'>&laquo;</a>";
 CalenderTitle += "<span class='selectThisYear'><a href='javascript:void(0)' onclick='CalenderselectYear(this)' title='Click here to select other year' >"+now.getFullYear()+"</a></span>年<span class='selectThisMonth'><a href='javascript:void(0)' onclick='CalenderselectMonth(this)' title='Click here to select other month'>"+(parseInt(now.getMonth())+1).toString()+"</a></span>月";
 if (arguments.length>1){
  arguments[1].parentNode.parentNode.getElementsByTagName("ul")[1].innerHTML = lis;
  arguments[1].parentNode.innerHTML = CalenderTitle;
 }else{
  var CalenderBox = style+"<div class='calender'><div class='calenderTitle'>"+CalenderTitle+"</div><div class='calenderBody'><ul class='day'><li>日</li><li>一</li><li>二</li><li>三</li><li>四</li><li>五</li><li>六</li></ul><ul class='date' id='thisMonthDate'>"+lis+"</ul></div><div class='calenderBottom'><a href='javascript:void(0)' class='closeCalender' onclick='closeCalender(this)'>×</a><span><span><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"+todayString+"'>Today</a></span></span></div></div>";
  return CalenderBox;
 }
}
function _selectThisDay(d){
 var boxObj = d.parentNode.parentNode.parentNode.parentNode.parentNode;
  boxObj.targetObj.value = d.title;
  boxObj.parentNode.removeChild(boxObj);
}
function closeCalender(d){
 var boxObj = d.parentNode.parentNode.parentNode;
  boxObj.parentNode.removeChild(boxObj);
}
function CalenderselectYear(obj){
  var opt = "";
  var thisYear = obj.innerHTML;
  for (i=1970; i<=2020; i++){
   if (i==thisYear){
    opt += "<option value="+i+" selected>"+i+"</option>";
   }else{
    opt += "<option value="+i+">"+i+"</option>";
   }
  }
  opt = "<select onblur='selectThisYear(this)' onchange='selectThisYear(this)' style='font-size:11px'>"+opt+"</select>";
  obj.parentNode.innerHTML = opt;
}
function selectThisYear(obj){
 HS_calender(obj.value+"-"+obj.parentNode.parentNode.getElementsByTagName("span")[1].getElementsByTagName("a")[0].innerHTML+"-1",obj.parentNode);
}
function CalenderselectMonth(obj){
  var opt = "";
  var thisMonth = obj.innerHTML;
  for (i=1; i<=12; i++){
   if (i==thisMonth){
    opt += "<option value="+i+" selected>"+i+"</option>";
   }else{
    opt += "<option value="+i+">"+i+"</option>";
   }
  }
  opt = "<select onblur='selectThisMonth(this)' onchange='selectThisMonth(this)' style='font-size:11px'>"+opt+"</select>";
  obj.parentNode.innerHTML = opt;
}
function selectThisMonth(obj){
 HS_calender(obj.parentNode.parentNode.getElementsByTagName("span")[0].getElementsByTagName("a")[0].innerHTML+"-"+obj.value+"-1",obj.parentNode);
}
function HS_setDate(inputObj){
 var calenderObj = document.createElement("span");
 calenderObj.innerHTML = HS_calender(new Date());
 calenderObj.style.position = "absolute";
 calenderObj.targetObj = inputObj;
 inputObj.parentNode.insertBefore(calenderObj,inputObj.nextSibling);
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
    <td width="92%"><strong>发表组队信息</strong></td>
    <td width="5%"><a href="index.jsp">返回首页</a></td>
  </tr>
</table>

<!-- 表单部分 -->
<jsp:useBean id="time" class="java.util.Date"/>  
<s:form name="regForm" id="regForm" action="teamteamadd" method="post" onsubmit="return checkForm()">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
    <fieldset class="fs">
    	<legend><img src="images/item01.gif" align="absmiddle" /><strong>小队信息</strong></legend>
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="40%" height="30" align="right">小队名称：</td>
    <td align="left" ><input name="teamname" type="text" class="input1" id="teamname" /></td>
    <td>
    <input name="teamleader" type="hidden" value="${session.user.getUsername()}" />
    <input name="member" type="hidden" value="${session.user.getUsername()}" />
  	<input name="teamcreate" type="hidden" value="${session.user.getUsername()}" />
  	</td>
  </tr>
  
  <tr>
    <td width="40%" height="30" align="right">预计资金：</td>
    <td align="left"><input name="money" type="text" class="input1" id="money"" /></td>
  </tr>
  <tr>
    <td width="40%" height="30" align="right">启程时间：</td>
    <td align="left"><input name="time" type="text" onfocus="HS_setDate(this)" class="input1"/></td>
  </tr>


  <tr>
    <td width="40%" height="30" align="right">目的地：</td>
    <td align="left"><select name="destination" class="input1" id="destination">
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
  </tr>

  <tr>
    <td height="36" align="center"><input type="submit" class="team" name="input" id="input" value=" 立即创建 " />
      &nbsp; &nbsp;  <input type="reset" class="team" name="button2" id="button2" value=" 重新填写 " /></td>
  </tr>
  
</table>
</fieldset>
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

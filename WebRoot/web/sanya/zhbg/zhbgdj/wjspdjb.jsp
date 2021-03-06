<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String returnPath = request.getParameter("returnPath");
String type = request.getParameter("type");
String flag1 = request.getParameter("flag");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>文件审批登记表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="/base/include/newformbase.jspf"%>
	<link rel="stylesheet" href="/base/form/css/commonForm.css" type="text/css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  <style type="text/css">
  		table{
			border-left-color:#000000;
			border-left-style:solid;
			border-left-width:1px;
			border-top-color:#000000;
			border-top-style:solid;
			border-top-width:1px;
			background-color:#FFFFFF;
			font-family:"宋体";
			font-size:14px;
			}
		td{
			border-bottom-color:#000000;
			border-bottom-style:solid;
			border-bottom-width:1px;
			border-right-color:#000000;
			border-right-style:solid;
			border-right-width:1px;
			margin-bottom:5px;
			margin-top:5px;
			height:25px;
			}
		select{
			background:#FFFFFF;
			border:none;
			font-family:"宋体";
			font-size:14px;
			}
		input{
			background:#FFFFFF;
			border:none;
			font-family:"宋体";
			font-size:14px;
			}
		.class{
			font-family:"宋体";
			font-size:14px;
		}
  </style>
  <script type="text/javascript">
  	function save(){
		//添加登记时间
		var writedate = document.getElementById("createdate");
		if("" == writedate.value || null == writedate.value){
			var date = new Date();
			var datestring = date.getFullYear() + "-" + (parseInt(date.getMonth()) + 1 ) + "-" + date.getDay();
			writedate.value = datestring;
		}
		document.getElementById("zhblr").value="<%=fullName%>";
		var blsx = document.getElementById("blsx");
		if("" == blsx.value || null == blsx.value){
		Ext.MessageBox.alert("警告", "办理时限不能为空！！！");  
			//alert("办理时限不能为空！！！");  
  			return false; 
		}
		
		document.forms[0].submit();
	}
	
	//页面加载初始化
	function onInit(){
		
		init();
		View();
		Check();
	}
	
	//添加选项
	function Addopt(selectname, value, name){
		var selectname = document.getElementById(selectname);
		var opt = document.createElement('option');
		opt.text = name;
		opt.value = name;
		selectname.options.add(opt);
	}

	
	
  </script>
  <body onLoad="onInit(); return false;">
  	<div id="fixed" class="Noprn" style="position: fixed; top: 5px; left: 0px"></div>
  	<div align="center" style="margin-bottom:20px"><h1 style="font-size: 25">文件登记表</h1></div>
  	<form method="post">
	  	
  	    <table align="center" cellpadding="0" cellspacing="0" width="600px">
			<tr>
				<td align="center">
					来文编号
				</td>
				<td colspan="3">
					<textarea id="wjspsx" name="wjspsx" style="width:99%; overflow:hidden" rows="5" ></textarea>
				</td>
			</tr>
			<tr>
				<td align="center">
					<label>来文单位</label>
				</td>
				<td>
					<select onchange=Check() style="font-family:'宋体'; font-size:14px;" id="wjlx" name="wjlx" >
						<option value="省国土环境资源厅">省国土环境资源厅</option>
						<option value="省国土环境监察总队">省国土环境监察总队</option>
						<option value="市委市政府">市委市政府</option>
						<option value="三亚环境资源局">三亚国土资源局</option>
						<option   value="其它" >其它</option>
					</select>
					<div id=checkText  style="margin-left: 180px;margin-top: -20px;display:none ">
					 <input type="text" id="qtdw" name="qtdw" style="border:1px solid #7364E0;width: 150; height: 20px "></div>
				</td>
				<td align="center">
					<label>截止日期</label>
				</td>
				<td>
					<input type="text" class="noborder" id="blsx" name="blsx" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" style="width:98%" />
					<input type="text" id="createdate" name="createdate" style="display:none" />
					</td>
			</tr>
			<tr>
				<td align="center">
					<label>文件类型</label>
				</td>
				<td>
					<select onchange=View() ; style="font-family:'宋体'; font-size:14px;" id="wjsq" name="wjsq">
						<option value="阅">阅</option>
						<option value="督办">督办</option>
						<option id="qt" style="display:block;" value="其它" >其它</option>
					</select>
					<div id=viewText  style="margin-left: 180px;margin-top: -20px;display:none ">
					 <input type="text" id="qtlx" name="qtlx" style="border:1px solid #7364E0;width: 150; height: 20px "></div>
				</td>
				<td align="center">
					<label>办理情况</label>
				</td>
				<td>
					<select  style="font-family:'宋体'; font-size:14px;" id="blqk" name="blqk">
						<option value="未处理" selected="selected" >未处理</option>
						<option value="已处理">处理中</option>
						<option value="已处理">已处理</option>
					</select>
				</td>
			</tr>
			<tr>
			     <td align="center">
					<label>办理人员</label>
				</td>
				<td colspan=3>
					<input type="text"  name="zhblr" id="zhblr" value="<%=fullName%>" />
				</td>
			</tr>
        </table>
  	</form>
  </body>
  <script type="text/javascript">
  	<%
		String msg = (String)request.getParameter("msg");
	%>

	if("<%=msg%>" == "success"){
		alert( "表单保存成功"); 
	}
	function Check(){
	var index=document.getElementById("wjlx").selectedIndex;
	var value=document.getElementById("wjlx").options[index].value;
	if(value=="其它"){
	document.getElementById("checkText").style.display="";
	var range = document.getElementById("qtdw").createTextRange(); 
        range.moveStart('character', 0); 
        range.collapse(true); 
         range.select(); 
	}else{
	document.getElementById("checkText").style.display="none";
	}
	}
	
	function View(){
	var index=document.getElementById("wjsq").selectedIndex;
	var value=document.getElementById("wjsq").options[index].value;
	if(value=="其它"){
	document.getElementById("viewText").style.display="";
	var range = document.getElementById("qtlx").createTextRange(); 
        range.moveStart('character', 0); 
        range.collapse(true); 
         range.select(); 
	}else{
	document.getElementById("viewText").style.display="none";
	}
	}
  </script>
</html>

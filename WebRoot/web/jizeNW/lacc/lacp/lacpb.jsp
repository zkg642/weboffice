<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.klspta.console.ManagerFactory"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
    String permission = request.getParameter("permission");
    String yw_guid = request.getParameter("yw_guid");
    String fixed=request.getParameter("fixed");//显示打印按钮的标识符
    if(permission==null){
        permission = "no";
    }
    Object userprincipal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    String userid = ((User)userprincipal).getUserID();
    String edit = request.getParameter("edit");
    //String name = UtilFactory.getXzqhUtil().getBeanById(ManagerFactory.getRoleManager().getRoleWithUserID(userid).get(0).getXzqh()).getCatonname();
    //String xzqh = ManagerFactory.getUserManager().getUserWithId(userid).getXzqh();
   	//String name = UtilFactory.getXzqhUtil().getBeanById(xzqh).getCatonname();
   	//String wfInsId1 = request.getParameter("wfInsId");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>"/>

		<TITLE>立案呈批表</TITLE>
		<%if(permission.equals("yes")){ %>
		<link rel="stylesheet" href="<%=basePath %>base/form/css/permissionForm.css"  type="text/css" />
		<%@ include file="/base/include/restRequest.jspf" %>
		<%@ include file="/base/form/PermissionControl.jspf"%>
		
		<%}else{ %>
		<link rel="stylesheet"
			href="<%=basePath%>base/form/css/commonForm.css" type="text/css" />
		<%@ include file="/base/include/formbase.jspf"%>
		<%} %>
		<script type="text/javascript" src="<%=basePath%>/web/jizeNW/lacc/js/sign.js"></script>
		<script>
		var userId = "<%=userid%>";
			var basePath = "<%=basePath%>";
		
			function initEdit(){
					init();
					var singnames = "ddcbr01#ddcbr02#cbdwqm#scqm#scdwzgldqm#cbdwzgldqm#zyldqm";
					signLoad(singnames);
					var sfzd1 = document.getElementById('sfzd1');
					if(sfzd1.checked){
						showZyld();
					}
			}
			function save(){
				var bh = document.getElementById("bh");  
				var ay = document.getElementById("ay"); 
				var sjfgjzrq 
				if(document.getElementById("zyldqmrq").value!=''){
					sjfgjzrq = document.getElementById("zyldqmrq").value;
				}else{
					sjfgjzrq = document.getElementById("cbdwzgldqmrq").value; 
				}								
				var yw_guid='<%=yw_guid%>';  
	            putClientCommond("lacc","saveBhAy");
	 			putRestParameter("yw_guid",yw_guid);
	 			putRestParameter("sjfgjzrq",sjfgjzrq);
	 			putRestParameter("ay",escape(escape(ay.value)));
				putRestParameter("bh",escape(escape(bh.value)));
				var res=restRequest();
			
				document.forms[0].submit();
			}
			function refresh(){
				document.location.refresh();
			}

			function showZyld(){
			   document.getElementById('zyld').style.display="block";			
			}	
			function hideZyld(){
			   document.getElementById('zyld').style.display="none";				
			}	
		</script>
		
	</head>
	
<body bgcolor="#FFFFFF">
<% 
if(fixed!=null && fixed.equals("fixedPrint")){%>
<div id="fixed class="Noprn" style="position: fixed; top: 5px; left: 0px"></div>
<%	
}else if(!"false".equals(edit)){%>
<div id="fixed" class="Noprn" style="position: fixed; top: 5px; left: 0px"></div>
<% } %>
<div style="margin:20px" class="tablestyle1" align="center" >
<div align="center"><h1 style="font-size:20px;">立 案 呈 批 表</h1></div>
<form method="post">
<div style="width:600px;text-align:right;"><span style="font-size:14px;">编号：
 <%if(permission.equals("yes")){ %>					
    						<input class="noborder" name="bh" id="bh" style="width: 97%"/>
   				        <%}else{ %>
<input type="text" name="bh" id="bh" style="width:180px;background-color:transparent;border:0px;"></span>
<%} %> 
</div>
<table class="lefttopborder1"  cellspacing="0" cellpadding="0" border="1"  bgcolor="#FFFFFF" bordercolor="#000000" width="600">
  <tr>
    <td colspan="2"><div align="center">案由</div></td>
    <td colspan="6"><textarea class="noborder" rows="5" style="width: 99%;font-size:14px;" name="ay"  id="ay"></textarea></td>
  </tr>
  <tr>
    <td width="30" rowspan="5"><div align="center">当<br/>
      事<br/>
    人</div></td>
    <td width="50" rowspan="2"><div align="center">单位</div></td>
    <td width="34"><div align="center">名称</div></td>
    <td colspan="3"><input type="text" class="noborder" name="dwmc" id="dwmc" style="width: 98%"/></td>
    <td width="80"><div align="center">法定代表人</div></td>
    <td width="120"><input type="text" class="noborder" name="fddbr" id="fddbr" style="width: 97%"/></td>
  </tr>
  <tr>
    <td><div align="center">地址</div></td>
    <td colspan="3"><input type="text" class="noborder" name="dwdz" id="dwdz" style="width: 98%"/></td>
    <td><div align="center">电话</div></td>
    <td><input type="text" class="noborder" name="dwdh" id="dwdh" style="width: 97%" <%if(!permission.equals("yes")){ %>onblur="registerDh()"<%} %>/></td>
  </tr>
  <tr>
    <td rowspan="3"><div align="center">个人</div></td>
    <td><div align="center">姓名</div></td>
    <td width="140"><input type="text" class="noborder" name="grxm" id="grxm" style="width: 98%"/></td>
    <td width="40"><div align="center">性别</div></td>
    <td width="50">
    <%if(permission.equals("yes")){ %>					
    						<input class="noborder" name="grxb" id="grxb" style="width: 97%"/>
   				        <%}else{ %>
							<select style="width: 90%" id="grxb"    name="grxb">
								<option  value="男"  selected="selected">
									男								</option>
								<option  value="女" >
									女								</option>
							</select>
							<%} %>    </td>
    <td><div align="center">年龄</div></td>
    <td><input type="text" class="noborder" name="grnl" id="grnl" style="width: 97%" <%if(!permission.equals("yes")){ %> onblur="registerNl()" <%} %>/></td>
  </tr>
  <tr>
    <td><div align="center">单位</div></td>
    <td colspan="3"><input type="text" class="noborder" name="grdw" id="grdw" style="width: 98%"/></td>
    <td><div align="center">职务</div></td>
    <td><input type="text" class="noborder" name="grzw" id="grzw" style="width: 97%"/></td>
  </tr>
  <tr>
    <td><div align="center">地址</div></td>
    <td colspan="3"><input type="text" class="noborder" name="grdz" id="grdz" style="width: 98%"/></td>
    <td><div align="center">电话</div></td>
    <td><input type="text" class="noborder" name="grdh" id="grdh" style="width: 97%" <%if(!permission.equals("yes")){ %>onblur="registerDh()"<%} %>/></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">案件来源</div></td>
    <td colspan="2" align="left">
     <%if(permission.equals("yes")){ %>					
    						<input class="noborder" name="ajly" id="ajly" style="width: 98%"/>
   				        <%}else{ %>
							<select style="width: 80%" id="ajly"    name="ajly">
								<option  value="上级督办"  selected="selected">
									上级督办
								</option>
								<option  value="领导交办" >
									领导交办
								</option>
								<option  value="巡查发现" >
									巡查发现
								</option>
								<option  value="分局报告" >
									分局报告
								</option>
								<option  value="信访反映" >
									信访反映
								</option>
								<option  value="卫星执法" >
									卫片执法
								</option>
								<option  value="媒体披露" >
									媒体披露
								</option>
								<option  value="电话举报" >
									电话举报
								</option>
							<%} %>    
    </td>
    <td colspan="2"><div align="center">是否重大案件</div></td>
    <td colspan="2">
    	<%if(!permission.equals("yes")){ %>
    		<input type="radio" name="sfzd" id="sfzd1" onclick="showZyld()" value="是"> <label for="sfzd1">是</label> <input type="radio" name="sfzd" id="sfzd2" onclick="hideZyld()" value="否"> <label for="sfzd2">否</label>
    	<%}else{ %>
    		<input type="text" name="sfzd" id="sfzd" style="width: 99%"/>
    	<%} %>
    </td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">受理日期</div></td>
    <td colspan="6"><input type="text" class="noborder" id="slrq" name="slrq"
								onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"    readonly style="width: 98%" /></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">主要违法<br/>
    事&nbsp;&nbsp;&nbsp;&nbsp;实</div></td>
    <td colspan="6"><textarea rows="5" name="zywfss" id="zywfss" style="width: 99%"></textarea></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      承&nbsp;办&nbsp;人<br/>
    建&nbsp;&nbsp;&nbsp;&nbsp;议</div></td>
    <td colspan="6" >
	<textarea rows="5"  cols="70" name="ddcbrjy" id="ddcbrjy" style="width: 99%"></textarea>
    	 <div class="div80">
		  	<div  class="divLeftFloat">签名：<input class="underline" type="text" name="ddcbr01" id="ddcbr01"  onClick="sign(this);"    style="width:50px" />
									<img width="50px" id="ddcbr01Sign" style="display:none;" onclick="delSign(this)"/></div>
		    <div>日期：<input type="text" class="underline" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="ddcbrrq01" id="ddcbrrq01" readonly  style="width: 80px"/></div>
			<br/><br/><div class="divLeftFloat">签名：<input class="underline" type="text" name="ddcbr02" id="ddcbr02"  onClick="sign(this);"    style="width:50px" />
									<img  width="50px" height="20" id="ddcbr02Sign" style="display:none" onclick="delSign(this)"/></div>
		    <div>日期：<input type="text" class="underline" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="ddcbrrq02" id="ddcbrrq02" readonly  style="width: 80px"/></div>
		 </div>	</td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
    承办单位<br/>意&nbsp;&nbsp;&nbsp;&nbsp;见</div></td>
    <td colspan="6">
		<textarea rows="5" cols="70" name="cbdwyj" id="cbdwyj" style="width: 99%"></textarea>
    	 <div class="div80">
		  	<div class="divLeftFloat">签名：<input class="underline" type="text" name="cbdwqm" id="cbdwqm" onfocus="underwrite(this)" onClick="sign(this);"    style="width:50px" />
			<img  width="60" height="25" id="cbdwqmSign" style="display:none" onclick="delSign(this)"/></div>
		    <div>日期：<input type="text" class="underline" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="cbdwqmrq" id="cbdwqmrq" readonly  style="width: 80px"/></div>
		 </div>	</td>
  </tr>  
  <tr>
    <td colspan="2"><div align="center">
    审&nbsp;&nbsp;&nbsp;&nbsp;查<br/>意&nbsp;&nbsp;&nbsp;&nbsp;见</div></td>
    <td colspan="6">
		<textarea rows="5" cols="70" name="scyj" id="scyj" style="width: 99%"></textarea>
    	 <div class="div80">
		  	<div class="divLeftFloat">签名：<input class="underline" type="text" name="scqm" id="scqm" onfocus="underwrite(this)" onClick="sign(this);"    style="width:50px" />
			<img  width="60" height="25" id="scqmSign" style="display:none" onclick="delSign(this)"/></div>
		    <div>日期：<input type="text" class="underline" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="scqmrq" id="scqmrq" readonly  style="width: 80px"/></div>
		 </div>	</td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">审查单位<br/>
    主管领导<br/>意&nbsp;&nbsp;&nbsp;&nbsp;见</div></td>
    <td colspan="6">
		<textarea rows="5" cols="70" name="scdwzgldyj" id="scdwzgldyj" style="width: 99%"></textarea>
    	 <div class="div80">
		  	<div class="divLeftFloat">签名：<input class="underline" type="text" name="scdwzgldqm" id="scdwzgldqm" onfocus="underwrite(this)" onClick="sign(this);"    style="width:50px" />
			<img  width="60" height="25" id="scdwzgldqmSign" style="display:none" onclick="delSign(this)"/></div>
		    <div>日期：<input type="text" class="underline" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="scdwzgldqmrq" id="scdwzgldqmrq" readonly  style="width: 80px"/></div>
		 </div>	</td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">承办单位<br/>
    主管领导<br/>意&nbsp;&nbsp;&nbsp;&nbsp;见</div></td>
    <td colspan="6">
		<textarea rows="5" cols="70" name="cbdwzgldyj" id="cbdwzgldyj" style="width: 99%"></textarea>
    	 <div class="div80">
		  	<div class="divLeftFloat">签名：<input class="underline" type="text" name="cbdwzgldqm" id="cbdwzgldqm" onfocus="underwrite(this)" onClick="sign(this);"    style="width:50px" />
			<img  width="60" height="25" id="cbdwzgldqmSign" style="display:none" onclick="delSign(this)"/></div>
		    <div>日期：<input type="text" class="underline" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="cbdwzgldqmrq" id="cbdwzgldqmrq" readonly  style="width: 80px"/></div>
		 </div>	</td>
  </tr>  
  <tr id="zyld" style="display:none;">
    <td colspan="2"><div align="center">
    主要领导<br/>意&nbsp;&nbsp;&nbsp;&nbsp;见</div></td>
    <td colspan="6">
		<textarea rows="5" cols="70" name="zyldyj" id="zyldyj" style="width: 99%"></textarea>
    	 <div class="div80">
		  	<div class="divLeftFloat">签名：<input class="underline" type="text" name="zyldqm" id="zyldqm" onfocus="underwrite(this)" onClick="sign(this);"    style="width:50px" />
			<img  width="60" height="25" id="zyldqmSign" style="display:none" onclick="delSign(this)"/></div>
		    <div>日期：<input type="text" class="underline" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="zyldqmrq" id="zyldqmrq" readonly  style="width: 80px"/></div>
		 </div>	</td>
  </tr> 
  <tr>
    <td colspan="2"><div align="center">备注</div></td>
    
    <td colspan="6">
    	<textarea rows="5" name="bz" id="bz" style="width: 99%;font-size:14px;" ></textarea>
    </td>
  </tr>
</table>
	<input type="text"   class="noborder"  style="width: 70%;display:none;"  value="" name="qy" id="qy" />
</form>
</div>
</body>
<script>
<%
if(!permission.equals("yes")){%>
	document.body.onload = initEdit;
<%}else if(permission.equals("yes")){%>
	addBorders();
	document.getElementById('zyld').style.display='block';
<%}%>
<%
	String msg = (String)request.getParameter("msg");
%>
if("<%=msg%>" == "success"&&"<%=permission%>"=="yes"){
	alert("表单权限保存成功");
}else if("<%=msg%>" == "success"){
	alert("表单保存成功");  
}
</script>
</html>

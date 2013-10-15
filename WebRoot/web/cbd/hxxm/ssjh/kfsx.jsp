<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.klspta.web.cbd.hxxm.jdjh.JhHandler" %>
<%@page import="com.klspta.web.cbd.hxxm.jdjh.DataManager"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	Map planYear = DataManager.getInstance().getPlanYear();
	int width = Integer.parseInt(String.valueOf(planYear.get("maxyear"))) - Integer.parseInt(String.valueOf(planYear.get("minyear")));
	width = width * 1200 + 490;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>plan表</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<%@ include file="/base/include/restRequest.jspf"%>
		<script type="text/javascript" src="web/cbd/hxxm/ssjh/kfsx.js"></script>
		<style>
input,img {
	vertical-align: middle;
}

html,body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font: normal 13px verdana;
}

table {
	border-collapse: collapse;
	border: none;
}

td {
	border: solid #000 1px;
}

#leftright,#topdown {
	position: absolute;
	left: 0;
	top: 0;
	width: 1px;
	height: 1px;
	layer-background-color: #FF6905;
	background-color: #FF6905;
	z-index: 0;
	font-size: 0px;
}
</style>
	</head>
	<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0" ">
		<p>
			显示内容：
			<input type="checkbox" name="content" id="table1" checked='checked'
				onclick="showTable()">
			开发体量
			<input type="checkbox" name="content" id="table2" checked='checked'
				onClick="showTable()">
			安置房建设
			<input type="checkbox" name="content" id="table3" checked='checked'
				onclick="showTable()">
			供地体量
			<input type="checkbox" name="content" id="table4" checked='checked'
				onClick="showTable()">
			投融资情况
			<input type="checkbox" name="content" id="table5" onClick="showCross()" >
			十字标尺
		</p>
		<table id='planTable' border=1
			style="text-align: center; font: normal 13px verdana;" width=200% >
			<tr
				style='background: #C0C0C0; text-align: center; font: normal 18px verdana;' width="<%=width%>">
				<td colspan='2' width="140" >
					序号				</td>
				<td width="250">
					时序（年）				</td>
				<%for(int i = Integer.parseInt(String.valueOf(planYear.get("minyear"))); i <= Integer.parseInt(String.valueOf(planYear.get("maxyear"))); i++){ %>
					<td colspan=8 width='1000'>
						<%=i%>
					</td>
				<%} %>
				<td width="100">
					合计				</td>
			</tr>
			<tbody id='kftl'>
				<!-- 开发体量综合数据 -->
				<%=JhHandler.getTable(JhHandler.JD_KFTL)%>
				<!-- 开发体量项目数据 -->
				<%=JhHandler.getTable(JhHandler.JD_KFTL_XX)%>
			</tbody>
			<tbody id='azfjs'>
				<!-- 安置房建设综合数据 -->
				<%=JhHandler.getTable(JhHandler.JD_AZFJC) %>
				<!-- 安置房建设详细数据 -->
				<%=JhHandler.getTable(JhHandler.JD_AZFJC_XX) %>
			</tbody>
			<tbody id='gdtl'>
				<!-- 供地体量综合数据 -->
				<%=JhHandler.getTable(JhHandler.JD_GDTL)%>
				<!-- 供地体量项目具体数据 -->
				<%=JhHandler.getTable(JhHandler.JD_GDTL_XX) %>
			</tbody>
			<tbody id='trzqk'>
				<!-- 投融资情况综合数据 -->
				<%=JhHandler.getTable(JhHandler.JD_TRZQK)%>
			</tbody>
		</table>
		<div id="leftright"
			style="width: expression(document.body.clientWidth);display:none;"></div>
		<div id="topdown"
			style="height: expression(document.body.clientHeight);display:none;"></div>
	</body>
</html>
<script>

if (document.all&&!window.print){
	
	leftright.style.width=document.body.clientWidth-6
	topdown.style.height=document.body.clientHeight-1
	}
	else if (document.layers){
	document.leftright.clip.width=window.innerWidth
	document.leftright.clip.height=5
	document.topdown.clip.width=5
	document.topdown.clip.height=window.innerHeight
	}
	function followmouse1(){
	//move cross engine for IE 4+
	leftright.style.pixelTop=document.body.scrollTop+event.clientY+1
	topdown.style.pixelTop=document.body.scrollTop
	if (event.clientX<document.body.clientWidth-2)
	topdown.style.pixelLeft=document.body.scrollLeft+event.clientX+1
	else
	topdown.style.pixelLeft=document.body.clientWidth-2
	}
	function followmouse2(e){
	//move cross engine for NS 4+
	document.leftright.top=e.y+6
	document.topdown.top=pageYOffset
	document.topdown.left=e.x+6
	}
	if (document.all)
	document.onmousemove=followmouse1
	else if (document.layers){
	window.captureEvents(Event.MOUSEMOVE)
	window.onmousemove=followmouse2
	}
	function regenerate(){
	window.location.reload()
	}
	function regenerate2(){
	setTimeout("window.onresize=regenerate",400)
	}
	if ((document.all&&!window.print)||document.layers)
	//if the user is using IE 4 or NS 4, both NOT IE 5+
	window.onload=regenerate2

</script>
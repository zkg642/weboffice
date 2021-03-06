<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String type = request.getParameter("type");
System.out.println(type);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta http-equiv="X-UA-Compatible" content="IE=5" >
<META HTTP-EQUIV="expires" CONTENT="0">
    <base href="<%=basePath%>">
    
    <title>My JSP 'JbbViewFrameTest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="/base/include/ext.jspf"%>
	<%@ include file="/base/include/restRequest.jspf"%>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript">
  		var type = "<%=type%>";
  		var gisurl ;
  		var url = "<%=basePath%>/web/cbd/yzt/jbb/ghcbzy/jbbEditor.jsp?type=<%=type%>";
  		if(type=="1"){
  			gisurl = "<%=basePath%>/base/fxgis/framework/gisViewFrame.jsp?filter=cbd,4,gnfq||1";
  		}else if(type=="2"){
  			gisurl = "<%=basePath%>/base/fxgis/framework/gisViewFrame.jsp?filter=cbd,4,gnfq||2";
  		}else if(type=="3"){
  			gisurl = "<%=basePath%>/base/fxgis/framework/gisViewFrame.jsp?filter=cbd,4,gnfq||3";
  		}else if(type=="4"){
  			gisurl = "<%=basePath%>/base/fxgis/framework/gisViewFrame.jsp?filter=cbd,4,gnfq||4";
  		}else {
  			gisurl = "<%=basePath%>/base/fxgis/framework/gisViewFrame.jsp";
  		}
  		Ext.onReady(function(){
  			putClientCommond("mapconfig","updateMapService");
			putRestParameter("serverid","cbd,cbdyx");
			putRestParameter("layerid","cbd:4,cbdyx:1,kgt:0");
			var myData = restRequest();
  			Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
  			var	width = document.body.clientWidth;
			var	height = document.body.clientHeight;
          new Ext.Viewport({
              layout: "border",
              items:[{
                 region:"center",
                 width:width * 0.8,
                 split:true,
                 layout:'fit',
                 layoutConfig:{
                    animate:true
                	},
                 html:"<iframe id='reportmap' width=100% height=100% src=" + gisurl
							+ "></iframe>"
            },{
                 title:'基本地块列表',
                 region:'east',
                 width:width * 0.6,
                 split:true,
                 layout:'fit',
                 collapsible: true,
                 layoutConfig:{
                    animate:true
                	},
                 html:"<iframe id='reportlist' width=100% height=100% src=" + url
							+ "></iframe>"
            }]
           });
        });
  </script>
  <body>
  </body>
</html>

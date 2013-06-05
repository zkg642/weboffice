<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.klspta.console.user.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//获取当前登录用户
Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//String fullName = ((User) principal).getFullName();
String userId = ((User)principal).getUserID();
String buttonHidden = "la,return,back";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>案件立案</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="<%=basePath%>/base/include/ajax.js"></script>
	<%@include file="/base/include/restRequest.jspf" %>
	<script type="text/javascript">
	//初始化
	function firstInit()
	{
	  putClientCommond("xfWFManager","buildWorkflow");
      putRestParameter("zfjcType","91");
      putRestParameter("buttonHidden","<%=buttonHidden%>");
      putRestParameter("formname", "wfxsfkxx");
      putRestParameter("returnurl", "/web/xuzhouNW/lacc/laccWorkflow/wf.jsp");
      putRestParameter("userId", "<%=userId%>");
      var path=restRequest();
      document.location.href="<%=basePath%>"+path+"&edit=true&returnPath=<%=basePath%>web/xuzhouNW/lacc/lb/dbaj.jsp";
	}  
	</script>
  </head>
  
  <body onload="firstInit();">
    
  </body>
</html>

<%@page language="java" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>执法监察统计分析</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<%@ include file="/base/include/ext.jspf"%>
		<%@ include file="/base/include/restRequest.jspf"%>
		<script type="text/javascript">
  var left;
  var treeTextList="";
  var node;
  var mydata;
  Ext.onReady(function(){
  	putClientCommond("scjcManager", "getesfTree");
    mydata = restRequest();
    
  	node= new Ext.tree.AsyncTreeNode({
	    expanded: true,
	   children:  mydata                  
	});
  
  	left = new Ext.tree.TreePanel({
		region:"west",
		id:'west',
		title:"基本信息列表",
		collapsible: true,
	    useArrows: true,
	    autoScroll: true,
	    animate: true,
	    //enableDD: true,
	    autoHeight: false,
	    width: 600,
	    border: false,
	    margins: '2 2 0 2',
	    containerScroll: true,
	    rootVisible: false,
	    listeners:{'checkchange':function(node,checked){
			var nodes=left.getChecked();
      		var n=0;
      		for(i=0;i<nodes.length;i++){
      			if(nodes[i].text=="基本信息列表"){//如果是父节点，则不加入treeTextList
               	}else{
	   				if(n>0){
	   					treeTextList+=",";
	   				}
	   				treeTextList+=nodes[i].text;
	   				n++;
	   			}
      		}
      		var url = "<%=basePath%>web/cbd/tjbb/chart.jsp";
      		treeTextList=encodeURI(treeTextList);
      		//treeTextList=encodeURI(treeTextList);
      		//document.getElementById("xxtj").src=url;
      		post(url,{xml:'esfzj.xml',lbxx:treeTextList});
		 	treeTextList="";
        }},
		root:node	
	});
    
	var center = new Ext.Panel({
		region:"center",
		items: [{
                    contentEl: 'center1',
                    title: '示意图',
                   	height: 800
                }]
	});
		
	var vp = new Ext.Viewport({
		layout:"border",
		items:[left,center]
	})
	
	 left.render();
     left.getRootNode().expand(true);
});

  
  function post(URL, PARAMS) {      
	    var temp = document.createElement("form");      
	    temp.action = URL;      
	    temp.method = "post";      
	    temp.style.display = "none";      
	    for (var x in PARAMS) {      
	        var opt = document.createElement("textarea");      
	        opt.name = x;      
	        opt.value = PARAMS[x];      
	        // alert(opt.name)      
	        temp.appendChild(opt);      
	    }      
	    document.body.appendChild(temp);      
	    temp.submit();      
	    return temp;      
	}      
	     

</script>
	</head>
	<body>
		<div id="west" class="x-hide-display"></div>
		<div id="center1"></div>
		
	</body>
</html>
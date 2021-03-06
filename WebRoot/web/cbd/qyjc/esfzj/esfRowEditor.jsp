<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.klspta.model.CBDReport.CBDReportManager"%>
<%@page import="com.klspta.model.CBDReport.tablestyle.ITableStyle"%>
<%@page import="com.klspta.web.cbd.yzt.jc.report.TableStyleEditRow"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String type=request.getParameter("type");
String reportID = "oldTable";
String keyIndex = "1";
ITableStyle its = new TableStyleEditRow();
String year = Calendar.getInstance().get(Calendar.YEAR)+"";		
String month = Calendar.getInstance().get(Calendar.MONTH)+1+"";
String view = request.getParameter("view");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="base/include/jquery-1.10.2.js"></script>
	<%@ include file="/web/cbd/qyjc/esfzj/js/reportEdit.jspf"%>
	<%@ include file="/base/include/restRequest.jspf"%>
	<script src="web/cbd/qyjc/esfzj/js/table.js"></script>
	<script src="web/cbd/qyjc/esfzj/js/panel.js"></script>
	<script src="web/cbd/qyjc/esfzj/js/esfRowEditor.js"></script>
	<%@ include file="/base/include/ext.jspf" %>
	<style type="text/css">
  		table{
		    font-size: 14px;
		    background-color: #A8CEFF;
		    border-color:#000000;
		    /**
		    border-left:1dp #000000 solid;
		    border-top:1dp #000000 solid;
		    **/
		    color:#000000;
		    border-collapse: collapse;
  		}
  		tr{
    		border-width: 0px;
    		text-align:center;
  		}
  		td{
    		text-align:center;
    		border-color:#000000;
		    /**
		    border-bottom:1dp #000000 solid;
		    border-right:1dp #000000 solid;
		    **/
		  }
		.title{
		    font-weight:bold;
		    font-size: 15px;
		    text-align:center;
		    line-height: 50px;
			margin-top: 3px;
		  }
	  	.trtotal{
		  	text-align:center;
		    font-weight:bold;
		    line-height: 30px;
		   }
	  	.trsingle{
		    background-color: #D1E5FB;
		    line-height: 20px;
		    text-align:center;
		   }
	</style>
  </head>
  <script type="text/javascript">
  	var form;
  	var view = "<%=view%>";
  	var paneloper = new Paneloper();
  	$(document).ready(function () { 
		//var width = document.body.clientWidth;
		//var height = document.body.clientHeight * 0.95;
       	//FixTable("ESFQK", 0,1, width-5, height-30);
       	buildPanel();
    });
  //	Ext.onReady(function(){
  		//Ext.QuickTips.init();
  	function buildPanel(){
  		form = new Ext.form.FormPanel({
	        autoHeight: true,
	        frame:true,
	        bodyStyle:'padding:5px 0px 0',
	        width: 500,
	  		labelWidth :115,   
	  		labelAlign : "right",
	        url:"",
	        title:"二手房详细信息",
	        defaults: {
	            anchor: '0'
	        },
	        layout:'form',
	        items   : [{
	        	layout : 'column',
	        	items : [{
	        		columnWidth:.5,
	        		layout:'form',
	        		items:[{
			            xtype : 'combo',   
					    fieldLabel : '所属区域',   
					    id : 'ssqy',   
					    store :[[1,'CBD北控区老旧房'],[2,'CBD东扩区老旧房'],[3,'CBD东扩区新居房'],[4,'CBD原区新居房'],
					            [5,'CBD原区老旧房']],   
					    width:100,   
					    value:'',   
					    triggerAction: "all",   
					    mode: "local",   
					    allowBlank:false
					 }]
				},{
					columnWidth:.5,
	        		layout:'form',
	        		items:[{
						xtype : 'combo',   
					    fieldLabel : '住房性质',   
					    id : 'xz',   
					    store :[[1,'老旧'],[2,'新居']],   
					    width:100,   
					    value:'',   
					    triggerAction: "all",   
					    mode: "local",   
					    allowBlank:false
					}]
				}]
            },{
                	layout : 'column',
    	        	items : [{
    	        		columnWidth:.5,
    	        		layout:'form',
    	        		items:[{
    		                xtype: 'textfield',
    		                id      : 'xqmc',
    		                value:'',
    		                fieldLabel: '小区名称',
    		                width :100
    	                }]	                
                	},{
		            columnWidth:.5,
	        		layout:'form',
	        		items:[{
		                xtype: 'textfield',
		                id      : 'jsnd',
		                value:'年',
		                fieldLabel: '建设年代',
		                width :100
	                }]
            	}]
            },{
            	layout : 'column',
	        	items : [{
	        		columnWidth:.5,
	        		layout:'form',
	        		items:[{
		                xtype: 'textfield',
		                id      : 'jzlx',
		                value:'',

		                fieldLabel: '房屋、建筑类型',
		                width :100
	                }]	                
            	},{
		            columnWidth:.5,
	        		layout:'form',
	        		items:[{
		                xtype: 'textfield',
		                id      : 'wyf',
		                value:'',
		                fieldLabel: '物业费',
		                width :100
	                }]
            	},{
		            columnWidth:.5,
	        		layout:'form',
	        		items:[{
		                xtype: 'textfield',
		                id      : 'qw',
		                value:'',
		                fieldLabel: '区位',
		                width :100
	                }]
            	},{
		            columnWidth:.5,
	        		layout:'form',
	        		items:[{
		                xtype: 'textfield',
		                id      : 'ldzs',
		                value:'',
		                fieldLabel: '楼栋总数',
		                width :100
	                }]
            	},{
		            columnWidth:.5,
	        		layout:'form',
	        		items:[{
		                xtype: 'textfield',
		                id      : 'fwzs',
		                value:'',
		                fieldLabel: '房屋总数',
		                width :100
	                }]
            	},{
		            columnWidth:.5,
	        		layout:'form',
	        		items:[{
		                xtype: 'textfield',
		                id      : 'lczk',
		                value:'',
		                fieldLabel: '楼层状况',
		                width :100
	                }]
            	},{
		            columnWidth:.5,
	        		layout:'form',
	        		items:[{
		                xtype: 'textfield',
		                id      : 'rjl',
		                value:'',
		                fieldLabel: '容积率',
		                width :100
	                }]
            	},{
		            columnWidth:.5,
	        		layout:'form',
	        		items:[{
		                xtype: 'textfield',
		                id      : 'lhl',
		                value:'',
		                fieldLabel: '绿化率%',
		                width :100
	                }]
            	},{
		            columnWidth:.5,
	        		layout:'form',
	        		items:[{
		                xtype: 'textfield',
		                id      : 'tcw',
		                value:'',
		                fieldLabel: '停车位',
		                width :100
	                }]
            	},{
		            columnWidth:.5,
	        		layout:'form',
	        		items:[{
		                xtype: 'textfield',
		                id      : 'kfs',
		                value:'',
		                fieldLabel: '开发商',
		                width :100
	                }]
            	},{
		            columnWidth:.5,
	        		layout:'form',
	        		items:[{
		                xtype: 'textfield',
		                id      : 'wygs',
		                value:'',
		                fieldLabel: '物业公司',
		                width :100
	                }]
            	},{
		            columnWidth:.5,
	        		layout:'form',
	        		items:[{
		                xtype: 'textfield',
		                id      : 'dz',
		                value:'',
		                fieldLabel: '地址',
		                width :100
	                }]
            	}]
            },{
	            columnWidth:.5,
        		layout:'form',
        		items:[{
	                xtype: 'hidden',
	                id      : 'yw_guid',
	                value:'',
	                width :100
                }]
        	}
        	,{
	            columnWidth:.5,
        		layout:'form',
        		items:[{
	                xtype: 'textfield',
	                id      : 'url',
	                fieldLabel: '超链接',
	                value:'',
	                width :200
                }]
        	}],
	        buttons: [
	            {
	                text   : '保存',
	                handler: function() {
	            			paneloper.setRestUrl("scjcManager/save");
							paneloper.save();
	                	}
	            	},   
	            	{
	                	text   : '取消',
	                	handler: function() {
	            			paneloper.cancel();
	                	}
	            	}
	        ]
	  });	
  		form.render("deal");
  		form.hide();
		var elements = new Array("ssqy","xqmc","jzlx","wyf","ldzs","fwzs","lczk","rjl","lhl",
									"tcw","kfs","wygs","dz","yw_guid","url");
  		paneloper.init(form,elements);
  		paneloper.hide();
  		}
	   function hideywguid(){
	 		var obj = document.getElementById("ESFQK");
	  		var rowlength = obj.rows.length;
	  		for(var i=0;i< rowlength;i++){
	  			obj.rows[i].cells[obj.rows[i].cells.length-1].style.display="none";
				obj.rows[i].cells[obj.rows[i].cells.length-2].style.display="none";
	  		}
	  		var width = document.body.clientWidth;
	    	var height = document.body.clientHeight * 0.95;
	       	FixTable("ESFQK", 3,1, width, height);
	  	}
  </script>
  <body onload="hideywguid();">
  	<div id="show" style="overflow-x:hidden;overflow-y:hidden">
  	<%=new CBDReportManager().getReport("ESFQK",new Object[] {"false"},its,"1000px")%>
  	</div>
  	<div id="deal" style="position:absolute; left:5px; top:5px; "></div>
  	<form id="attachfile" action="<%=basePath%>service/rest/zrbHandle/update" method="post">
	</form> 
  </body>
</html>

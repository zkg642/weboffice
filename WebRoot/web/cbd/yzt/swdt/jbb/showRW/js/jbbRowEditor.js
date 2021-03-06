var zrbbh = "";
var lock = false;
var table = new tableoper();
//单击地图定位
function showMap(objid){
	
	if(table.element == undefined){
		table.init(document.getElementById("JBB"));
	}
	var key = objid.cells[0].innerText;
	if(-1 == key.indexOf("计")){
		table.addAnnotation(objid.rowIndex);
	}
	
	if(table.isLock == lock){
		return ;
	}
	lock = table.isLock;
	parent.parent.document.frames['reportmap'].frames['center'].frames["lower"].swfobject.getObjectById("FxGIS").clear();
	parent.parent.document.frames['reportmap'].frames['center'].frames["lower"].swfobject.getObjectById("FxGIS").findFeature("cbd", "16", key, "地块名称");
}

//双击编辑地图
function editMap(objid){
	
	
	if(view=="R"){
		return ;
	}
	if(table.element == undefined){
		table.init(document.getElementById("JBB"));
	}
	zrbbh = objid.cells[0].innerText;
	parent.parent.document.frames[0].frames['center'].frames["lower"].swfobject.getObjectById("FxGIS").clear();
	parent.parent.document.frames[0].frames['center'].frames["lower"].swfobject.getObjectById("FxGIS").drawPolygonMultiple();
}

//上图
function setRecord(polygon){
	putClientCommond("jbbHandle","drawZrb");
    putRestParameter("tbbh",escape(escape(zrbbh))); 
    putRestParameter("polygon",polygon); 
    putRestParameter("type","3d"); 
    var result = restRequest();
	parent.parent.document.frames[0].frames['center'].frames["lower"].swfobject.getObjectById("FxGIS").clear();
	parent.parent.document.frames[0].frames['center'].frames["lower"].swfobject.getObjectById("FxGIS").findFeature("cbd", "16", key, "地块名称");
}

//导出Excel
function print(){
    var curTbl = document.getElementById("JBB"); 
    try{
    	var oXL = new ActiveXObject("Excel.Application");
    }catch(err){
    	Ext.Msg.alert('提示','Excel生成失败，请先确定系统已安装office，并在浏览器的\'工具\' - Internet选项 -安全 - 自定义级别 - ActiveX控件和插件 - 对未标记为可安全执行脚本的ActiveX控件.. 标记为\'启用\'');
    	return;
    } 
    //创建AX对象excel 
    var oWB = oXL.Workbooks.Add(); 
    //获取workbook对象 
        var oSheet = oWB.ActiveSheet; 
    //激活当前sheet 
    var sel = document.body.createTextRange(); 
    sel.moveToElementText(curTbl); 
    //把表格中的内容移到TextRange中 
    sel.select(); 
    //全选TextRange中内容 
    sel.execCommand("Copy"); 
    //复制TextRange中内容  
    oSheet.Paste(); 
    //粘贴到活动的EXCEL中       
    oXL.Visible = true; 
    //设置excel可见属性 
}

//根据用地单位和关键字作过滤
function queryJBB(keyword){
	putClientCommond("jbbHandle","getReport");
	putRestParameter("keyword",escape(escape(keyword)));
	myData = restRequest();
  	document.getElementById("show").innerHTML = myData;
  	
  	var width = document.body.clientWidth+10;
	var height = document.body.clientHeight-10;
    FixTable("JBB", 1,2, width, height);
  	
}

function update(){
	var annoations = table.getAnnotations();
	if(annoations.length > 0){
		var objid = table.element.rows[annoations[0]];
		if(table.element == undefined){
			table.init(document.getElementById("JBB"));
		}
		var key = objid.cells[0].innerText;
		zrbbh = key;
		
		var array = paneloper.getElements();
		for(var i = 0; i < objid.cells.length-1; i++){
			var value = objid.cells[i].innerText;	
			paneloper.insertValue(array[i], value);
		}
		paneloper.show();
	}
}


function end(){
	parent.parent.document.frames[0].frames['center'].frames["lower"].swfobject.getObjectById("FxGIS").drawPolygonMultipleEnd();
	
	parent.parent.document.frames[0].frames['center'].frames["lower"].swfobject.getObjectById("FxGIS").findFeature("cbd", "16", key, "地块名称");
}

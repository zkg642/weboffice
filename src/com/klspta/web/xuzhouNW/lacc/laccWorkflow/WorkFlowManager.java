package com.klspta.web.xuzhouNW.lacc.laccWorkflow;

import java.rmi.server.UID;
import java.util.List;
import java.util.Map;

import com.klspta.base.AbstractBaseBean;
import com.klspta.console.ManagerFactory;
import com.klspta.model.workflow.foundations.WorkflowOp;

public class WorkFlowManager extends AbstractBaseBean {
	public String yw_guid = "";
	
	/**
	 * 
	 * <br>Description:创建工作流实例
	 * <br>Author:黎春行
	 * <br>Date:2013-4-2
	 * @throws Exception
	 */
	public void buildWorkflow() throws Exception{
		yw_guid = buildYw_guid();
		String userId = request.getParameter("userId");
		String formName = request.getParameter("formname");
		String zfjcType = request.getParameter("zfjcType");
		String workflowName = getWorkflowName(zfjcType);
		String buttonHidden = request.getParameter("buttonHidden");
		String wfinsId = WorkflowOp.getInstance().start(workflowName, ManagerFactory.getUserManager().getUserWithId(userId).getFullName(), yw_guid);
		insertForm(formName, yw_guid);
		String urlPath = "/web/xuzhouNW/lacc/laccWorkflow/wf.jsp?yw_guid=" + yw_guid + "&zfjcType=" + zfjcType + "&wfInsId=" + wfinsId + "&buttonHidden=" + buttonHidden;
		response(urlPath);
	}
	
	private String buildYw_guid(){
		return new UID().toString().replaceAll(":", "-");
	}
	
	private void insertForm(String formname, String yw_guid){
		String[] formsName = formname.split("#");
		for(int i = 0; i < formsName.length; i++){
			String sql = "insert into ";
			sql = sql + formsName[i] + "(yw_guid) values (?)";
			update(sql, YW, new Object[] { yw_guid });
		}
	}
	
	private String getWorkflowName(String zfjcType){
		String sql1 = "select t.child_name from public_code t where t.id='WORKFLOW' and t.child_id=?";
		List<Map<String, Object>> wfIdList = query(sql1, YW, new Object[] { zfjcType });
		Map<String, Object> map1 = (Map<String, Object>) wfIdList.get(0);
		String wfId = (String) map1.get("child_name");
		return wfId;
	}
}

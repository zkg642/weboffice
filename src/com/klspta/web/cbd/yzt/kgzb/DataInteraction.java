package com.klspta.web.cbd.yzt.kgzb;

import java.util.List;
import java.util.Map;

import com.klspta.base.AbstractBaseBean;

public class DataInteraction extends AbstractBaseBean {
	
	public StringBuffer getDate( String dqyName) {
		String sql = "Select distinct qy from dcsjk_kgzb where  dqy=?";
		List<Map<String, Object>> list = query(sql, YW, new Object[] {dqyName });
		BuilTable table = new BuilTable();
		StringBuffer buffer = new StringBuffer();
		for(int i=0;i<list.size();i++){
			String qy = list.get(i).get("qy").toString();
			String sql1="select * from dcsjk_kgzb where qy=? and dqy=?";
			List<Map<String, Object>> list1 = query(sql1, YW,new Object[] { qy,dqyName });
			StringBuffer qyTr = table.getQyTr(list1);
			String sql2="select * from dcsjk_kgzb_view where qy=?";
			List<Map<String, Object>> list2 = query(sql2, YW,new Object[] { qy });
			StringBuffer qyTr_sum = table.getQyTr_sum(list2);
			buffer.append(qyTr);
			buffer.append(qyTr_sum);
		}
		
		return buffer;
	}

}
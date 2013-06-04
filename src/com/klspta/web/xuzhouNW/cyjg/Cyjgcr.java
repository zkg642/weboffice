package com.klspta.web.xuzhouNW.cyjg;

import java.io.UnsupportedEncodingException;
import java.rmi.server.UID;

import com.klspta.base.AbstractBaseBean;

public class Cyjgcr extends AbstractBaseBean{

	public void buildcr(){
		String yw_guid = buildyw_guid();
		String sql = "insert into showcr(yw_guid) values ('"+ yw_guid +"')";
		update(sql, YW);
		String basePath = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getServerPort() + request.getContextPath() + "/";
		StringBuffer url = new StringBuffer();
		url.append(basePath);
		url.append("/web/xuzhouNW/cyjg/cr/showcr.jsp?jdbcname=YWTemplate&yw_guid=");
		url.append(yw_guid);
		redirect(url.toString()); 
	}
	
	private String buildyw_guid(){
		return new UID().toString().replaceAll(":", "-");
	}
	
	public void getAllcrList() throws Exception{
		response(new CrManager().getAllcrList());
	}
	
	public void getcrList() throws Exception{
		String keyWord = new String(request.getParameter("keyword").getBytes("iso-8859-1"), "utf-8");
		response(new CrManager().getcrListByKeyword(keyWord));
	}
}

package com.klspta.web.cbd.yzt.kgzb;

import java.io.InputStream;

import com.klspta.model.CBDinsertGIS.AbstractInsertGIS;


public class KgzbInsertGIS extends AbstractInsertGIS {
	
	 private static final String form_gis = "CBD_KGZB";

	@Override
	public boolean insertGIS(InputStream inputStream, String guid) {
		boolean result = false;
		try {
			String wkt = buildWKT(inputStream);
			String srid = getSrid(form_gis);
            //判断对应zrbbh是否存在,存在用update 否则 用 insert
            boolean isExit = isExit(form_gis, "DKMC", guid, GIS);
            String sql = "";
            if(isExit){
            	sql = "update " + form_gis + " t set t.SHAPE=sde.st_geometry ('" + wkt + "', " + srid + ") where t.DKMC='" + guid + "'";
            }else{
                sql = "INSERT INTO "+ form_gis+"(OBJECTID,DKMC,SHAPE) VALUES ((select nvl(max(OBJECTID)+1,1) from "+form_gis+"),'"
                	+ guid + "',sde.st_geometry ('" + wkt + "', " + srid + "))";
            }
            update(sql, GIS);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
	


}

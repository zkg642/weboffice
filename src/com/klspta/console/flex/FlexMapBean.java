package com.klspta.console.flex;

import java.util.List;
import java.util.Map;

import org.dom4j.Element;

/**
 * 
 * <br>Title:flex地图bean
 * <br>Description:
 * <br>Author:陈强峰
 * <br>Date:2014-4-10
 */
public class FlexMapBean extends AbsFlex {

    private String wraparound180 = "";

    private String initialextent = "";

    private String fullextent = "";

    private String top = "";

    private String addarcgisbasemaps = "";

    /**
     *地图图层集合
     */
    private List<FlexLayerBean> layerList;

    public FlexMapBean(Map<String, Object> map) {
        this.wraparound180 = check(map.get("map_wraparound180"));
        this.initialextent = check(map.get("map_initialextent"));
        this.fullextent = check(map.get("map_fullextent"));
        this.top = check(map.get("map_top"));
        this.addarcgisbasemaps = check(map.get("map_addarcgisbasemaps"));
    }

    /**
     * 
     * <br>Description:添加图层元素
     * <br>Author:陈强峰
     * <br>Date:2014-4-17
     * @param root
     * @param roleLayerMap
     */
    public void addXML(Element root, Map<String, String> roleLayerMap) {
        Element element = root.addElement("map");
        element.addAttribute("wraparound180", wraparound180);
        element.addAttribute("initialextent", initialextent);
        element.addAttribute("fullextent", fullextent);
        element.addAttribute("top", top);
        element.addAttribute("addarcgisbasemaps", addarcgisbasemaps);
        Element elementLayers = element.addElement("operationallayers");
        FlexLayerBean flexLayerBean = null;
        for (int i = 0; i < layerList.size(); i++) {
            flexLayerBean = layerList.get(i);
            if (!roleLayerMap.containsKey(flexLayerBean.getLayerId())) {
                continue;
            }
            flexLayerBean.addXMl(elementLayers);
        }
    }

    public void setLayerList(List<FlexLayerBean> layerList) {
        this.layerList = layerList;
    }

    public List<FlexLayerBean> getLayerList() {
        return layerList;
    }

}

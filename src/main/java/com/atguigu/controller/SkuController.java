package com.atguigu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.OBJECT_T_MALL_SKU;
import com.atguigu.service.AttrService;
import com.atguigu.service.SkuService;

@Controller
public class SkuController {

	@Autowired
	private AttrService attrService;

	@Autowired
	private SkuService skuServie;

	@RequestMapping("save_sku")
	public ModelAndView save_sku(OBJECT_T_MALL_SKU sku_attr_val) {
		skuServie.save_sku(sku_attr_val);

		ModelAndView mv = new ModelAndView("redirect:/manager_index.do");

		mv.addObject("url", "goto_sku.do");
		mv.addObject("title", "商品sku信息发布");

		return mv;
	}

	@RequestMapping("get_attr_by_class_2")
	public String get_attr_by_class_2(Integer class_2, ModelMap map) {
		List<OBJECT_T_MALL_ATTR> attr_list = attrService.query_attr_list(class_2);
		map.put("attr_list", attr_list);
		return "manager_sku_inner_attr";
	}

	@RequestMapping("goto_sku")
	public String goto_sku() {
		return "manager_sku";
	}

}

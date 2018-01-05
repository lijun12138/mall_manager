package com.atguigu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.MODEL_T_MALL_ATTR;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.service.AttrService;

@Controller
public class AttrController {

	@Autowired
	private AttrService attrService;

	@RequestMapping("add_attr")
	public ModelAndView add_attr(MODEL_T_MALL_ATTR attr_list, Integer class_2_id, ModelMap map) {
		attrService.save_attr(attr_list, class_2_id);

		ModelAndView mv = new ModelAndView("redirect:/manager_index.do");

		mv.addObject("url", "goto_attr.do");
		mv.addObject("title", "商品属性信息发布");

		return mv;

	}

	@RequestMapping("goto_attr_add")
	public String goto_attr_add(Integer class_2_id, String class_2_name, ModelMap map) {
		map.put("class_2_id", class_2_id);
		map.put("class_2_name", class_2_name);
		return "manager_attr_add";
	}

	@RequestMapping("goto_attr")
	public String goto_attr() {
		return "manager_attr_index";
	}

	@RequestMapping("attr_list")
	public String attr_list(Integer class_2, ModelMap map) {
		List<OBJECT_T_MALL_ATTR> attr_list = attrService.query_attr_list(class_2);
		map.put("attr_list", attr_list);
		return "manager_attr_list";
	}

	@ResponseBody
	@RequestMapping("attr_list_json")
	public List<OBJECT_T_MALL_ATTR> attr_list_json(Integer class_2) {
		List<OBJECT_T_MALL_ATTR> attr_list = attrService.query_attr_list(class_2);
		return attr_list;
	}
}

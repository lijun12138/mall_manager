package com.atguigu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_PRODUCT_IMAGE;
import com.atguigu.service.SpuInfoService;
import com.atguigu.util.UploadUtil;

@Controller
public class SpuController {

	@Autowired
	private SpuInfoService spuInfoService;

	@RequestMapping("to_spu_delete")
	public String to_spu_delete(@RequestParam("id") Integer id) {
		spuInfoService.delete_spu(id);
		return "redirect:/goto_spu_list.do";
	}

	@RequestMapping("do_spu_update")
	public ModelAndView do_spu_update(T_MALL_PRODUCT spu, @RequestParam("files") MultipartFile[] files) {

		// 保存图片信息
		List<String> image_list = UploadUtil.save(files);


		spuInfoService.update_spu(spu, image_list);
		ModelAndView mv = new ModelAndView("redirect:/manager_index.do");
		
		mv.addObject("url", "goto_spu.do");
		mv.addObject("title", "商品spu信息发布");
		
		return mv;
	}

	@RequestMapping("to_spu_update")
	public String to_spu_update(@RequestParam("id") Integer id, ModelMap map) {

		T_MALL_PRODUCT product = spuInfoService.query_spu_byid(id);
		map.put("product", product);
		List<T_MALL_PRODUCT_IMAGE> image_list = spuInfoService.query_spu_image(id);
		map.put("image_list", image_list);
		return "manager_spu_update";
	}

	@RequestMapping("goto_spu_list")
	public String goto_spu_list() {
		return "manager_spu_list";
	}

	@ResponseBody
	@RequestMapping("load_spu_list")
	public Object load_spu_list(T_MALL_PRODUCT spu) {
		List<T_MALL_PRODUCT> spu_list = spuInfoService.query_spu_list(spu);
		return spu_list;
	}

	@RequestMapping("manager_spu_add")
	public ModelAndView manager_spu_add(T_MALL_PRODUCT spu, @RequestParam("files") MultipartFile[] files) {
		// 发布spu业务流程

		// 保存图片信息
		List<String> image_list = UploadUtil.save(files);

		// 保存spu信息
		spuInfoService.saveSpuInfo(spu, image_list);

		ModelAndView mv = new ModelAndView("redirect:/manager_index.do");

		mv.addObject("url", "goto_spu.do");
		mv.addObject("title", "商品spu信息发布");
		mv.addObject("url_nested", "goto_spu_add.do");
		mv.addObject("title_nested", "商品信息添加");

		return mv;
	}

	@RequestMapping("manager_index")
	public String manager_index(String url, String title, String url_nested, String title_nested, ModelMap map) {
		map.put("url", url);
		map.put("title", title);
		map.put("url_nested", url_nested);
		map.put("title_nested", title_nested);
		return "manager_index";
	}

	@RequestMapping("goto_spu")
	public String goto_spu() {
		return "manager_spu";
	}

	@RequestMapping("goto_spu_add")
	public String goto_spu_add() {
		return "manager_spu_add";
	}
}

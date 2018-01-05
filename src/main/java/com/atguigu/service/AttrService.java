package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.MODEL_T_MALL_ATTR;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;

public interface AttrService {

	List<OBJECT_T_MALL_ATTR> query_attr_list(Integer class_2);

	void save_attr(MODEL_T_MALL_ATTR attr_list, Integer class_2_id);


}

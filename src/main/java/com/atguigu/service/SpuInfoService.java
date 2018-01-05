package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_PRODUCT_IMAGE;

public interface SpuInfoService {

	void saveSpuInfo(T_MALL_PRODUCT spu, List<String> image_list);

	List<T_MALL_PRODUCT> query_spu_list(T_MALL_PRODUCT spu);

	T_MALL_PRODUCT query_spu_byid(Integer id);

	List<T_MALL_PRODUCT_IMAGE> query_spu_image(Integer id);

	void update_spu(T_MALL_PRODUCT spu, List<String> image_list);

	void delete_spu(Integer id);



}

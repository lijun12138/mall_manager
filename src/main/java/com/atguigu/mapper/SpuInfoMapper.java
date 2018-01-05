package com.atguigu.mapper;

import java.util.List;
import java.util.Map;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_PRODUCT_IMAGE;

public interface SpuInfoMapper {

	void insert_spu(T_MALL_PRODUCT spu);

	void insert_spu_image(Map<Object, Object> map);

	List<T_MALL_PRODUCT> select_spu_list(T_MALL_PRODUCT spu);

	T_MALL_PRODUCT select_spu_byid(Integer id);

	List<T_MALL_PRODUCT_IMAGE> select_spu_image(Integer id);


	void update_spu(T_MALL_PRODUCT spu);

	void delete_spu(Integer id);

	void delete_spu_image(Integer id);

}

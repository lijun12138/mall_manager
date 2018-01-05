package com.atguigu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.atguigu.bean.OBJECT_T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;

public interface SkuMapper {

	void insert_sku(OBJECT_T_MALL_SKU sku_attr_val);

	void insert_sku_attr_value(@Param("sku_val") OBJECT_T_MALL_SKU sku_attr_val, @Param("sku_attr_vals") List<T_MALL_SKU_ATTR_VALUE> list_sku_attr_value);


}

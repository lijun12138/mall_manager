package com.atguigu.bean;

import java.util.List;

public class OBJECT_T_MALL_SKU extends T_MALL_SKU{

	List<T_MALL_SKU_ATTR_VALUE> list_sku_attr_value;

	public List<T_MALL_SKU_ATTR_VALUE> getList_sku_attr_value() {
		return list_sku_attr_value;
	}

	public void setList_sku_attr_value(List<T_MALL_SKU_ATTR_VALUE> list_sku_attr_value) {
		this.list_sku_attr_value = list_sku_attr_value;
	}
}
package com.atguigu.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.OBJECT_T_MALL_SKU;
import com.atguigu.mapper.SkuMapper;
import com.atguigu.service.SkuService;

@Service
public class SkuServiceImp implements SkuService {

	@Autowired
	private SkuMapper skuMapper;
	
	@Override
	public void save_sku(OBJECT_T_MALL_SKU sku_attr_val) {
		skuMapper.insert_sku(sku_attr_val);
		
		
		skuMapper.insert_sku_attr_value(sku_attr_val,sku_attr_val.getList_sku_attr_value());
	}

}

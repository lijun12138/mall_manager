package com.atguigu.service.imp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_PRODUCT_IMAGE;
import com.atguigu.mapper.SpuInfoMapper;
import com.atguigu.service.SpuInfoService;

@Service
public class SpuInfoServiceImpl implements SpuInfoService {

	@Autowired
	private SpuInfoMapper spuInfoMapper;

	@Override
	public void saveSpuInfo(T_MALL_PRODUCT spu, List<String> image_list) {
		// 保存商品信息
		spu.setShp_tp(image_list.get(0));
		spuInfoMapper.insert_spu(spu);

		Map<Object, Object> map = new HashMap<>();
		map.put("shp_id", spu.getId());
		map.put("image_list", image_list);
		// 保存商品图片信息
		spuInfoMapper.insert_spu_image(map);
	}

	@Override
	public List<T_MALL_PRODUCT> query_spu_list(T_MALL_PRODUCT spu) {
		return spuInfoMapper.select_spu_list(spu);
	}

	@Override
	public T_MALL_PRODUCT query_spu_byid(Integer id) {
		return spuInfoMapper.select_spu_byid(id);
	}

	@Override
	public List<T_MALL_PRODUCT_IMAGE> query_spu_image(Integer id) {
		return spuInfoMapper.select_spu_image(id);
	}

	@Override
	public void update_spu(T_MALL_PRODUCT spu, List<String> image_list) {
		spuInfoMapper.update_spu(spu);
		
		Map<Object, Object> map = new HashMap<>();
		map.put("shp_id", spu.getId());
		map.put("image_list", image_list);
		// 保存商品图片信息
		spuInfoMapper.insert_spu_image(map);
	}

	@Override
	public void delete_spu(Integer id) {
		spuInfoMapper.delete_spu(id);
		spuInfoMapper.delete_spu_image(id);
		
	}

}

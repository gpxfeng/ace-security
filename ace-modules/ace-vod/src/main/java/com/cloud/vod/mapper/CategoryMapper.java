package com.cloud.vod.mapper;

import java.util.List;
import java.util.Map;
import com.cloud.vod.entity.Category;

public interface CategoryMapper {
	public List<Category> findAllCategory(int type);

	public Category findCategoryByTypeAndName(Map<String, Object> map);

	public int addCategory(Category category);

	public int findMaxSequenceByType(int type);

}

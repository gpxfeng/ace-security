package com.cloud.vod.mapper;

import java.util.List;
import java.util.Map;

import com.cloud.vod.entity.Website;

public interface WebsiteMapper {
	public List<Website> findWebsite(Map<String, Object> map);
}

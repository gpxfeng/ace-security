package com.cloud.vod.mapper;

import java.util.List;
import java.util.Map;
import com.cloud.vod.entity.Videoinfo;

public interface VideoinfoMapper {
	public int addVideoinfo(Videoinfo videoinfo);

	public int findVideoinfoCountByPageurl(Map<String, Object> map);

	public Videoinfo findVideoinfo(Map<String, Object> map);

	public List<Videoinfo> findVideoinfoByPage(Map<String, Object> map);

	public int updateVideoinfo(Videoinfo videoinfo);
}

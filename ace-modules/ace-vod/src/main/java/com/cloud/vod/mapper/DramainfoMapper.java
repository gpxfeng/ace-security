package com.cloud.vod.mapper;

import java.util.Map;
import com.cloud.vod.entity.Dramainfo;


public interface DramainfoMapper {

	public Dramainfo findDramainfoByName(Map<String, Object> map);

	public int addDramainfo(Dramainfo dramainfo);

	public Dramainfo findDramainfoPresence(Dramainfo dramainfo);

	public int findDramainfoId(Dramainfo dramainfo);

	public int updateDramainfo(int id);
}

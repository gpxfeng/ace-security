package com.cloud.vod.mapper;


import com.cloud.vod.entity.Dramaregion;
import org.springframework.stereotype.Repository;

@Repository
public interface DramaregionMapper {
    public int findRegionIdListByName(String name);
    public int addRegionByName(Dramaregion dramaregion);
}

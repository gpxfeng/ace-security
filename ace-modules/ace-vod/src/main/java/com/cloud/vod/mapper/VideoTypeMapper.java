package com.cloud.vod.mapper;


import com.cloud.vod.entity.Category;
import com.cloud.vod.entity.VideoType;
import java.util.List;

public interface VideoTypeMapper {
    public List<VideoType> findAllType();
    public List<Category> findVideoType(String id);
}

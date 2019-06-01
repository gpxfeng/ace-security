package com.cloud.tool.search.service;


import com.cloud.api.vo.search.IndexObject;
import com.cloud.common.msg.TableResultResponse;


public interface LuceneService {

    void save(IndexObject indexObject);

    void update(IndexObject indexObject);

    void delete(IndexObject indexObject);

    void deleteAll();

    TableResultResponse page(Integer pageNumber, Integer pageSize, String keyword);
}

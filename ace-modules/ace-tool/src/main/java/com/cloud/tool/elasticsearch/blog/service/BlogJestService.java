package com.cloud.tool.elasticsearch.blog.service;


import com.cloud.tool.elasticsearch.blog.domain.Blog;
import com.cloud.tool.elasticsearch.blog.param.SearchParam;
import com.cloud.tool.elasticsearch.core.base.JestDataBaseService;
import com.cloud.tool.elasticsearch.core.result.SmartSearchResult;

/**
 * @author gaowenming
 * @create 2018-01-31 11:43
 * @desc jestSearch
 **/
public interface BlogJestService extends JestDataBaseService<Blog> {

    /**
     * 通用查询
     */
    SmartSearchResult<Blog> queryBySearchParam(SearchParam searchParam);
}

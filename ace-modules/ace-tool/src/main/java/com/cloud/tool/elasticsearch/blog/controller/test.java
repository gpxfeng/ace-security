package com.cloud.tool.elasticsearch.blog.controller;




import com.alibaba.fastjson.JSONObject;
import com.cloud.tool.elasticsearch.blog.domain.Person;
import io.searchbox.client.JestClient;
import io.searchbox.core.Search;
import io.searchbox.core.SearchResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/test")
class TestController {

    @Resource
    private JestClient jestClient;

    @GetMapping("/person/query")
    public List<Person> query() {
        //组装查询参数
        JSONObject json1=new JSONObject();
        JSONObject json2=new JSONObject();
        JSONObject json3=new JSONObject();

        json3.put("desc", "是");//查询的字段和值
        json2.put("match_phrase", json3);//匹配方式：短语匹配
        json1.put("query", json2);

        List<Person> personlList=new ArrayList<Person>();
        Search search = new Search.Builder(json1.toJSONString()).addIndex("test").addType("person").build();
        try {
            SearchResult result = jestClient.execute(search);
            List<SearchResult.Hit<Person, Void>> hits = result.getHits(Person.class);
            for (SearchResult.Hit<Person, Void> hit : hits) {
                Person person = hit.source;
                personlList.add(person);
            }
            return personlList;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}

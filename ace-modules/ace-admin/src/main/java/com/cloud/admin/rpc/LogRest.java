package com.cloud.admin.rpc;

import com.alibaba.fastjson.JSONObject;
import com.cloud.admin.biz.GateLogBiz;
import com.cloud.admin.entity.GateLog;
import com.cloud.api.vo.log.LogInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@RequestMapping("api")
@RestController
public class LogRest {
    @Autowired
    private GateLogBiz gateLogBiz;

    @RequestMapping(value = "/log/save", method = RequestMethod.POST)
    public @ResponseBody
    void saveLog(@RequestBody LogInfo info) {
        GateLog log = new GateLog();
        BeanUtils.copyProperties(info, log);
        gateLogBiz.insertSelective(log);
    }
}

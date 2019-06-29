package com.cloud.auth.controller;

import com.cloud.auth.biz.ClientBiz;
import com.cloud.auth.entity.Client;
import com.cloud.auth.entity.ClientService;
import com.cloud.common.msg.ObjectRestResponse;
import com.cloud.common.rest.BaseController;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("service")
public class ServiceController extends BaseController<ClientBiz,Client>{

    /**
     * 更新服务编码
     * @param id
     * @param clients
     * @return
     */
    @RequestMapping(value = "/{id}/client", method = RequestMethod.PUT)
    @ResponseBody
    public ObjectRestResponse modifyUsers(@PathVariable int id, String clients){
        baseBiz.modifyClientServices(id, clients);
        return new ObjectRestResponse().rel(true);
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}/client", method = RequestMethod.GET)
    @ResponseBody
    public ObjectRestResponse<ClientService> getUsers(@PathVariable int id){
        return new ObjectRestResponse<ClientService>().rel(true).data(baseBiz.getClientServices(id));
    }
}

package com.cloud.admin.biz;

import com.cloud.admin.entity.ResourceAuthority;
import com.cloud.admin.mapper.ResourceAuthorityMapper;
import com.cloud.common.biz.BaseBiz;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional(rollbackFor = Exception.class)
public class ResourceAuthorityBiz extends BaseBiz<ResourceAuthorityMapper, ResourceAuthority> {
}

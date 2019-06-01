package com.cloud.admin.biz;

import org.springframework.stereotype.Service;

import com.cloud.admin.entity.GroupType;
import com.cloud.admin.mapper.GroupTypeMapper;
import com.cloud.common.biz.BaseBiz;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional(rollbackFor = Exception.class)
public class GroupTypeBiz extends BaseBiz<GroupTypeMapper, GroupType> {
}

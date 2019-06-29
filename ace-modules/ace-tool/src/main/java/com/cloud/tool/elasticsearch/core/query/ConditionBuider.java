package com.cloud.tool.elasticsearch.core.query;

public interface ConditionBuider<T> {
    ConditionChain build(T searchParam);
}

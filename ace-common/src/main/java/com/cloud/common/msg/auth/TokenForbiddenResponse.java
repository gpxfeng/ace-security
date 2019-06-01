package com.cloud.common.msg.auth;

import com.cloud.common.constant.RestCodeConstants;
import com.cloud.common.msg.BaseResponse;


public class TokenForbiddenResponse  extends BaseResponse {
    public TokenForbiddenResponse(String message) {
        super(RestCodeConstants.TOKEN_FORBIDDEN_CODE, message);
    }
}

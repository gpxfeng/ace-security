package com.cloud.common.msg.auth;

import com.cloud.common.constant.RestCodeConstants;
import com.cloud.common.msg.BaseResponse;


public class TokenErrorResponse extends BaseResponse {
    public TokenErrorResponse(String message) {
        super(RestCodeConstants.TOKEN_ERROR_CODE, message);
    }
}

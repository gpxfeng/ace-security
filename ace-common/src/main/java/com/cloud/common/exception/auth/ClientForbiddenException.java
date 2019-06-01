package com.cloud.common.exception.auth;


import com.cloud.common.constant.CommonConstants;
import com.cloud.common.exception.BaseException;


public class ClientForbiddenException extends BaseException {
    public ClientForbiddenException(String message) {
        super(message, CommonConstants.EX_CLIENT_FORBIDDEN_CODE);
    }

}

package com.cloud.common.exception.auth;


import com.cloud.common.constant.CommonConstants;
import com.cloud.common.exception.BaseException;


public class ClientTokenException extends BaseException {
    public ClientTokenException(String message) {
        super(message, CommonConstants.EX_CLIENT_INVALID_CODE);
    }
}

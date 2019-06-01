package com.cloud.common.exception.auth;


import com.cloud.common.constant.CommonConstants;
import com.cloud.common.exception.BaseException;


public class UserInvalidException extends BaseException {
    public UserInvalidException(String message) {
        super(message, CommonConstants.EX_USER_PASS_INVALID_CODE);
    }
}

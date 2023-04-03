package com.hjc.wanandroid.base

import com.google.gson.annotations.SerializedName

/**
 * @author jianchong.hu
 * @create at 2022 12.12
 * @description:
 **/
class BaseData<T> {
    @SerializedName("errorCode")
    var code = -1

    @SerializedName("errorMsg")
    var msg: String? = null
    var data: T? = null
    var state: ReqState = ReqState.Error
    override fun toString(): String {
        return "BaseData(code=$code, msg=$msg, data=$data, state=$state)"
    }
}

enum class ReqState {
    Success, Error
}
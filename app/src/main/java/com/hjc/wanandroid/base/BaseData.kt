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
}

enum class ReqState {
    Success, Error
}
package com.hjc.wanandroid.base

/**
 *
 * @author jianchong.hu
 * @create at 2022 12.12
 * @description:
 **/
open class BaseRepository {

    suspend fun <T : Any> executeRequest(block: suspend () -> BaseData<T>): BaseData<T> {
        val baseData = block.invoke()
        if (baseData.code == 0) {
            //正确
            baseData.state = ReqState.Success
        } else {
            baseData.state = ReqState.Error
        }
        return baseData
    }
}
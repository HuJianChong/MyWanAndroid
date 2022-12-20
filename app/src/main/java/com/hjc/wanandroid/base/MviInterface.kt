package com.hjc.wanandroid.base

import androidx.annotation.Keep

/**
 *
 * @author jianchong.hu
 * @create at
 * @description:
 **/

@Keep
interface IUiState

@Keep
interface IUiIntent //event

sealed class LoadUiIntent {
    data class Loading(var isShow: Boolean) : LoadUiIntent()
    object ShowMainView : LoadUiIntent()
    data class Error(val msg: String) : LoadUiIntent()
}
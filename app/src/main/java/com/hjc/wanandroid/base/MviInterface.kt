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

sealed class LoadUiState {
    data class Loading(var isShow: Boolean) : LoadUiState()
    object ShowMainView : LoadUiState()
    data class Error(val msg: String) : LoadUiState()
}
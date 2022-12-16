package com.hjc.wanandroid.ui.main

import com.hjc.wanandroid.base.IUiIntent

sealed class MainIntent : IUiIntent {
    object GetBanner : MainIntent()
    data class GetDetail(val page: Int) : MainIntent()
}
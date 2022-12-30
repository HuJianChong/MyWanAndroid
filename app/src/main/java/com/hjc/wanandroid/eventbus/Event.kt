package com.hjc.wanandroid.eventbus

sealed class Event {
    data class ShowInit(val msg: String) : Event()
}
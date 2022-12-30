package com.hjc.wanandroid.eventbus

import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.lifecycleScope
import androidx.lifecycle.whenStateAtLeast
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.MutableSharedFlow
import java.util.concurrent.ConcurrentHashMap

object FlowEventBus {

    //用HashMap存储SharedFlow
    private val flowEvents = ConcurrentHashMap<String, MutableSharedFlow<Event>>()

    //获取Flow，当相应Flow不存在时创建
    fun getFlow(key: String): MutableSharedFlow<Event> {
        return flowEvents[key] ?: MutableSharedFlow<Event>().also { flowEvents[key] = it }
    }

    // 发送事件
    fun post(event: Event, delay: Long = 0) {
        MainScope().launch {
            delay(delay)
            getFlow(event.javaClass.simpleName).emit(event)
        }
    }

    // 订阅事件
    inline fun <reified T : Event> observe(
        lifecycleOwner: LifecycleOwner,
        minState: Lifecycle.State = Lifecycle.State.CREATED,
        dispatcher: CoroutineDispatcher = Dispatchers.Main,
        crossinline onReceived: (T) -> Unit
    ) = lifecycleOwner.lifecycleScope.launch(dispatcher) {
        getFlow(T::class.java.simpleName).collect {
            lifecycleOwner.lifecycle.whenStateAtLeast(minState) {
                if (it is T) onReceived(it)
            }
        }
    }

}
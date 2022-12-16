package com.hjc.wanandroid.base

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch

/**
 *
 * @author jianchong.hu
 * @create at 2022 12.12
 * @description:
 **/
abstract class BaseViewModel<UiState : IUiState, UiIntent : IUiIntent> : ViewModel() {

    private val _uiStateFlow = MutableStateFlow(initUiState())
    val uiStateFlow: StateFlow<UiState> = _uiStateFlow

    protected abstract fun initUiState(): UiState

    protected fun sendUiState(copy: UiState.() -> UiState) {
        _uiStateFlow.update { copy(_uiStateFlow.value) }
    }

    private val _uiIntentFlow: Channel<UiIntent> = Channel()
    val uiIntentFlow: Flow<UiIntent> = _uiIntentFlow.receiveAsFlow()

    private val _loadUiStateFlow: Channel<LoadUiState> = Channel()
    val loadUiStateFlow: Flow<LoadUiState> = _loadUiStateFlow.receiveAsFlow()

    fun sendUiIntent(uiIntent: UiIntent) {
        viewModelScope.launch {
            _uiIntentFlow.send(uiIntent)
        }
    }

    init {
        viewModelScope.launch {
            uiIntentFlow.collect {
                handleIntent(it)
            }
        }
    }

    protected abstract fun handleIntent(intent: IUiIntent)

    /**
     * 发送当前加载状态：Loading、Error、Normal
     */
    private fun sendLoadUiState(loadUiState: LoadUiState) {
        viewModelScope.launch {
            _loadUiStateFlow.send(loadUiState)
        }
    }

    protected fun <T : Any> requestDataWithFlow(
        showLoading: Boolean = true,
        request: suspend () -> BaseData<T>,
        successCallback: (T) -> Unit,
        failCallback: suspend (String) -> Unit = { errMsg ->
            //默认异常处理，子类可以进行覆写
            sendLoadUiState(LoadUiState.Error(errMsg))
        },
    ) {
        viewModelScope.launch {
            //是否展示Loading
            if (showLoading) {
                sendLoadUiState(LoadUiState.Loading(true))
            }
            val baseData: BaseData<T>
            try {
                baseData = request()
                when (baseData.state) {
                    ReqState.Success -> {
                        sendLoadUiState(LoadUiState.ShowMainView)
                        baseData.data?.let { successCallback(it) }
                    }
                    ReqState.Error -> baseData.msg?.let { error(it) }
                }
            } catch (e: Exception) {
                e.message?.let { failCallback(it) }
            } finally {
                if (showLoading) {
                    sendLoadUiState(LoadUiState.Loading(false))
                }
            }
        }
    }
}
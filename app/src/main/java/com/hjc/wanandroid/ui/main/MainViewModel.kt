package com.hjc.wanandroid.ui.main

import com.hjc.wanandroid.base.BaseViewModel
import com.hjc.wanandroid.base.IUiIntent
import com.hjc.wanandroid.model.respository.HomeRepository

/**
 *
 * @author jianchong.hu
 * @create at 2022 12.12
 * @description:
 **/
class MainViewModel(private val homeRepo: HomeRepository) : BaseViewModel<MainState, MainIntent>() {

    override fun initUiState(): MainState {
        return MainState(BannerUiState.INIT, DetailUiState.INIT)
    }

    override fun handleIntent(intent: IUiIntent) {
        when (intent) {
            MainIntent.GetBanner -> {
                requestDataWithFlow(showLoading = true,
                    request = { homeRepo.requestWanData() },
                    successCallback = { data ->
                        sendUiState {
                            copy(
                                bannerUiState = BannerUiState.SUCCESS(
                                    data
                                )
                            )
                        }
                    },
                    failCallback = {})
            }
            is MainIntent.GetDetail -> {
                requestDataWithFlow(showLoading = false,
                    request = { homeRepo.requestRankData(intent.page) },
                    successCallback = { data ->
                        sendUiState {
                            copy(
                                detailUiState = DetailUiState.SUCCESS(
                                    data
                                )
                            )
                        }
                    })
            }
        }
    }
}


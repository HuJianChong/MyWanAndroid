package com.hjc.wanandroid.ui.main

import com.hjc.wanandroid.model.respository.HomeRepository
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class MainViewModelTest {

    private lateinit var mainViewModel: MainViewModel

    @Before
    fun setUp() {
        val homeRepository = HomeRepository()
        mainViewModel = MainViewModel(homeRepository)
    }

    @Test
    fun handleGetBannerIntent() {
        mainViewModel.sendUiIntent(MainIntent.GetBanner)
        Thread.sleep(1000)

        val bannerUiState = mainViewModel.uiStateFlow.value.bannerUiState
        println(bannerUiState)
        Assert.assertTrue(bannerUiState is BannerUiState.SUCCESS)
    }

    @Test
    fun handleGetGetDetailIntent() {
        mainViewModel.sendUiIntent(MainIntent.GetDetail(0))
        Thread.sleep(1000)

        val detailUiState = mainViewModel.uiStateFlow.value.detailUiState
        println(detailUiState)
        Assert.assertTrue(detailUiState is DetailUiState.SUCCESS)
        Assert.assertTrue((detailUiState as DetailUiState.SUCCESS).articles.datas.isNotEmpty())
    }
}
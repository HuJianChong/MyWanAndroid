package com.hjc.wanandroid.ui.main

import com.hjc.wanandroid.base.IUiState
import com.hjc.wanandroid.model.ArticleModel
import com.hjc.wanandroid.model.BannerModel

/**
 * @author jianchong.hu
 * @create at 2022 12.12
 * @description:
 **/
data class MainState(val bannerUiState: BannerUiState, val detailUiState: DetailUiState) : IUiState

sealed class BannerUiState {
    object INIT : BannerUiState()
    data class SUCCESS(val models: List<BannerModel>) : BannerUiState()
}

sealed class DetailUiState {
    object INIT : DetailUiState()
    data class SUCCESS(val articles: ArticleModel) : DetailUiState()
}
package com.hjc.wanandroid.ui.main

import com.hjc.wanandroid.base.BaseData
import com.hjc.wanandroid.base.BaseRepository
import com.hjc.wanandroid.http.RetrofitUtil
import com.hjc.wanandroid.http.api.WanApi
import com.hjc.wanandroid.model.ArticleModel
import com.hjc.wanandroid.model.BannerModel

/**
 *
 * @author jianchong.hu
 * @create at 2022 12.12
 * @description:
 **/
class WanRepository : BaseRepository() {

    private val service = RetrofitUtil.getService(WanApi::class.java)

    suspend fun requestWanData(): BaseData<List<BannerModel>> {
        return executeRequest { service.getBanner() }
    }

    suspend fun requestRankData(page: Int): BaseData<ArticleModel> {
        return executeRequest { service.getArticle(page) }
    }
}
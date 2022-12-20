package com.hjc.wanandroid.model.respository

import com.hjc.wanandroid.base.BaseData
import com.hjc.wanandroid.base.BaseRepository
import com.hjc.wanandroid.model.http.WanRetrofitClient
import com.hjc.wanandroid.model.http.api.WanApi
import com.hjc.wanandroid.model.bean.Article
import com.hjc.wanandroid.model.bean.Banner

/**
 * 主页Repository
 * @author jianchong.hu
 * @create at 2022 12.12
 * @description:
 **/
class HomeRepository : BaseRepository() {

    private val service = WanRetrofitClient.getService(WanApi::class.java)

    suspend fun requestWanData(): BaseData<List<Banner>> {
        return executeRequest { service.getBanner() }
    }

    suspend fun requestRankData(page: Int): BaseData<Article> {
        return executeRequest { service.getArticle(page) }
    }
}
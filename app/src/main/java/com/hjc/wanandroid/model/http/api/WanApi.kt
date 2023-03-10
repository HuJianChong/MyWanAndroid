package com.hjc.wanandroid.model.http.api

import com.hjc.wanandroid.base.BaseData
import com.hjc.wanandroid.model.bean.Article
import com.hjc.wanandroid.model.bean.Banner
import retrofit2.http.GET
import retrofit2.http.Path

/**
 *
 * @author jianchong.hu
 * @create at 2022 12.12
 * @description:
 **/
interface WanApi {
    @GET("banner/json")
    suspend fun getBanner(): BaseData<List<Banner>>

    //页码从0开始
    @GET("article/list/{page}/json")
    suspend fun getArticle(@Path("page") page: Int): BaseData<Article>
}
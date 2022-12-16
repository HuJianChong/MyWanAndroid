package com.hjc.wanandroid.model

data class ArticleModel(
    var curPage: Int,
    val datas: List<ArticleItem>
)

data class ArticleItem(
    val title: String,
    val link: String,
    val userId: Int,
    val niceDate: String
)
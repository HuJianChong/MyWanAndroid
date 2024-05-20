package com.hjc.wanandroid.model.bean

import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

data class Article(
    var curPage: Int,
    val datas: List<ArticleItem>
)

@Parcelize
data class ArticleItem(
    val title: String,
    val link: String,
    val userId: Int,
    val niceDate: String
) : Parcelable
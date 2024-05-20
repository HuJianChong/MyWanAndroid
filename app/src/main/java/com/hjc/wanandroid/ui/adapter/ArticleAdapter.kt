package com.hjc.wanandroid.ui.adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.chad.library.adapter4.BaseQuickAdapter
import com.hjc.wanandroid.databinding.ItemArticleBinding
import com.hjc.wanandroid.model.bean.ArticleItem


class ArticleAdapter : BaseQuickAdapter<ArticleItem, ArticleAdapter.VH>() {

    // 自定义ViewHolder类
    class VH(
        parent: ViewGroup,
        val binding: ItemArticleBinding = ItemArticleBinding.inflate(
            LayoutInflater.from(parent.context), parent, false
        ),
    ) : RecyclerView.ViewHolder(binding.root)

    override fun onCreateViewHolder(context: Context, parent: ViewGroup, viewType: Int): VH {
        // 返回一个 ViewHolder
        return VH(parent)
    }

    override fun onBindViewHolder(holder: VH, position: Int, item: ArticleItem?) {
        // 设置item数据
        holder.binding.title.text = item?.title
    }

}

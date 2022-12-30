package com.hjc.wanandroid.ui.adapter

import android.content.Intent
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.hjc.wanandroid.databinding.ItemArticleBinding
import com.hjc.wanandroid.model.bean.ArticleItem
import com.hjc.wanandroid.ui.article.ArticleActivity


class ArticleAdapter : RecyclerView.Adapter<ArticleAdapter.BannerViewHolder>() {
    private var mList: List<ArticleItem> = ArrayList()
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): BannerViewHolder {
        return BannerViewHolder(
            ItemArticleBinding.inflate(
                LayoutInflater.from(parent.context), parent, false
            )
        )
    }

    override fun onBindViewHolder(holder: BannerViewHolder, position: Int) {
        holder.bindData(mList[position])
        holder.binding.root.setOnClickListener {
            it.context.startActivity(Intent(it.context, ArticleActivity::class.java))
        }
    }

    fun setList(list: List<ArticleItem>) {
        mList = list
        notifyDataSetChanged()
    }

    override fun getItemCount(): Int {
        return mList.size
    }

    class BannerViewHolder(val binding: ItemArticleBinding) :
        RecyclerView.ViewHolder(binding.root) {

        fun bindData(article: ArticleItem) {
            binding.title.text = article.title
        }
    }
}

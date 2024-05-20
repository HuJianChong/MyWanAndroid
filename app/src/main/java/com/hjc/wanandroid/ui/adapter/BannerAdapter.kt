package com.hjc.wanandroid.ui.adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.chad.library.adapter4.BaseQuickAdapter
import com.hjc.wanandroid.databinding.ItemBannerBinding

class BannerAdapter : BaseQuickAdapter<String, BannerAdapter.VH>() {

    // 自定义ViewHolder类
    class VH(
        parent: ViewGroup,
        val binding: ItemBannerBinding = ItemBannerBinding.inflate(
            LayoutInflater.from(parent.context), parent, false
        ),
    ) : RecyclerView.ViewHolder(binding.root)

    override fun onCreateViewHolder(context: Context, parent: ViewGroup, viewType: Int): VH {
        // 返回一个 ViewHolder
        return VH(parent)
    }

    override fun onBindViewHolder(holder: VH, position: Int, item: String?) {
        // 设置item数据
        Glide.with(holder.binding.root.context).load(item).into(holder.binding.img)
    }

}

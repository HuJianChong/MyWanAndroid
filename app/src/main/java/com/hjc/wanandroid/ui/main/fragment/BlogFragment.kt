package com.hjc.wanandroid.ui.main.fragment

import android.view.LayoutInflater
import android.view.ViewGroup
import com.hjc.wanandroid.base.BaseFragment
import com.hjc.wanandroid.databinding.FragmentBlogBinding

class BlogFragment : BaseFragment<FragmentBlogBinding>() {
    override fun getViewBinding(
        inflater: LayoutInflater,
        container: ViewGroup?
    ): FragmentBlogBinding {
        return FragmentBlogBinding.inflate(inflater)
    }

    override fun initViews() {
    }

    override fun initDatas() {
    }
}
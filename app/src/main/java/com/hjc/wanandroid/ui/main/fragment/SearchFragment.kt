package com.hjc.wanandroid.ui.main.fragment

import android.view.LayoutInflater
import android.view.ViewGroup
import com.hjc.wanandroid.base.BaseFragment
import com.hjc.wanandroid.databinding.FragmentSearchBinding

class SearchFragment : BaseFragment<FragmentSearchBinding>() {
    override fun getViewBinding(
        inflater: LayoutInflater, container: ViewGroup?
    ): FragmentSearchBinding {
        return FragmentSearchBinding.inflate(inflater)
    }

    override fun initViews() {
    }

    override fun initDatas() {
    }
}
package com.hjc.wanandroid.ui.main.fragment

import android.view.LayoutInflater
import android.view.ViewGroup
import com.hjc.wanandroid.base.BaseFragment
import com.hjc.wanandroid.databinding.FragmentBlogBinding
import com.hjc.wanandroid.databinding.FragmentMeBinding

class MeFragment : BaseFragment<FragmentMeBinding>() {
    override fun getViewBinding(
        inflater: LayoutInflater,
        container: ViewGroup?
    ): FragmentMeBinding {
        return FragmentMeBinding.inflate(inflater)
    }

    override fun initViews() {
    }

    override fun initDatas() {
    }
}
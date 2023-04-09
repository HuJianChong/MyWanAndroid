package com.hjc.wanandroid.ui.main.fragment

import android.os.Bundle
import android.view.View
import com.hjc.wanandroid.base.BaseBindingFragment
import com.hjc.wanandroid.databinding.FragmentProjectBinding

class ProjectFragment : BaseBindingFragment<FragmentProjectBinding>({
    FragmentProjectBinding.inflate(it)
}) {

    override fun initView(view: View, savedInstanceState: Bundle?) {
    }

    override fun initData(savedInstanceState: Bundle?) {
    }
}
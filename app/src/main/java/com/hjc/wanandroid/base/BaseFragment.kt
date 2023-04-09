package com.hjc.wanandroid.base

import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment

abstract class BaseFragment : Fragment() {

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        initView(view, savedInstanceState)
        initData(savedInstanceState)
        super.onViewCreated(view, savedInstanceState)
    }

    abstract fun initView(view: View, savedInstanceState: Bundle?)
    abstract fun initData(savedInstanceState: Bundle?)

}

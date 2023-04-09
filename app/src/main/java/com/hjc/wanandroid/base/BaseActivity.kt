package com.hjc.wanandroid.base

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

abstract class BaseActivity: AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        initView(savedInstanceState)
        initData(savedInstanceState)
    }

    abstract fun initView(savedInstanceState: Bundle?)
    abstract fun initData(savedInstanceState: Bundle?)

}
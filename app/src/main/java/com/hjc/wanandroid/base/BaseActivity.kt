package com.hjc.wanandroid.base

import androidx.appcompat.app.AppCompatActivity
import androidx.annotation.LayoutRes
import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.viewbinding.ViewBinding

abstract class BaseActivity<T : ViewBinding> : AppCompatActivity() {

    private lateinit var _binding: T
    protected val binding get() = _binding;

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        _binding = getViewBinding()
        setContentView(_binding.root)

        initViews()
        initEvents()
    }

    protected abstract fun getViewBinding(): T
    open fun initViews() {}
    open fun initEvents() {}

    /**
     * @param str 弹出的文字
     */
    fun toast(str: String?) {
        Toast.makeText(this, str, Toast.LENGTH_SHORT).show()
    }
}
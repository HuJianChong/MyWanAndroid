package com.hjc.wanandroid.base

import android.os.Bundle
import android.view.LayoutInflater
import androidx.viewbinding.ViewBinding

/**
 * 支持View Binding Activity
 */
abstract class BaseBindingActivity<VB : ViewBinding>(
    val block: (LayoutInflater) -> VB
) : BaseActivity() {
    private var _binding: VB? = null
    protected val binding: VB
        get() = requireNotNull(_binding) { "The property of binding has been destroyed." }

    override fun initView(savedInstanceState: Bundle?) {
        _binding = block(layoutInflater)
        setContentView(binding.root)
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }
}
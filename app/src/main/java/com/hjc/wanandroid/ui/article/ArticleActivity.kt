package com.hjc.wanandroid.ui.article

import android.os.Bundle
import com.hjc.wanandroid.base.BaseBindingActivity
import com.hjc.wanandroid.databinding.ActivityArticleBinding
import com.hjc.wanandroid.eventbus.Event
import com.hjc.wanandroid.eventbus.FlowEventBus

class ArticleActivity : BaseBindingActivity<ActivityArticleBinding>({
    ActivityArticleBinding.inflate(it)
}) {

    override fun initView(savedInstanceState: Bundle?) {
        binding.reset.setOnClickListener {
            FlowEventBus.post(Event.ShowInit("article init"))
            finish()
        }
    }

    override fun initData(savedInstanceState: Bundle?) {
    }
}
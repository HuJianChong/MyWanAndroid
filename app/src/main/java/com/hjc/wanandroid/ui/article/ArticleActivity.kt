package com.hjc.wanandroid.ui.article

import com.hjc.wanandroid.base.BaseActivity
import com.hjc.wanandroid.databinding.ActivityArticleBinding
import com.hjc.wanandroid.eventbus.Event
import com.hjc.wanandroid.eventbus.FlowEventBus

class ArticleActivity : BaseActivity<ActivityArticleBinding>() {
    override fun getViewBinding(): ActivityArticleBinding =
        ActivityArticleBinding.inflate(layoutInflater)

    override fun initViews() {
        super.initViews()
        binding.reset.setOnClickListener {
            FlowEventBus.post(Event.ShowInit("article init"))
            finish()
        }
    }
}
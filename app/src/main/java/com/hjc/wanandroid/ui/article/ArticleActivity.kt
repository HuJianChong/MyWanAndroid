package com.hjc.wanandroid.ui.article

import android.os.Bundle
import androidx.navigation.navArgs
import com.hjc.wanandroid.base.BaseBindingActivity
import com.hjc.wanandroid.databinding.ActivityArticleBinding
import com.hjc.wanandroid.eventbus.Event
import com.hjc.wanandroid.eventbus.FlowEventBus

class ArticleActivity : BaseBindingActivity<ActivityArticleBinding>({
    ActivityArticleBinding.inflate(it)
}) {

    override fun initView(savedInstanceState: Bundle?) {
        super.initView(savedInstanceState)
        binding.reset.setOnClickListener {
            FlowEventBus.post(Event.ShowInit("article init"))
            finish()
        }
    }

    override fun initData(savedInstanceState: Bundle?) {
        val args: ArticleActivityArgs by navArgs()
        val article = args.article
        binding.titleTv.text = article.title
    }
}
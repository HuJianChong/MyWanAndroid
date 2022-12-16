package com.hjc.wanandroid.ui.main

import android.util.Log
import androidx.activity.viewModels
import androidx.core.view.isVisible
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.hjc.wanandroid.base.BaseActivity
import com.hjc.wanandroid.base.LoadUiState
import com.hjc.wanandroid.databinding.ActivityMainBinding
import com.hjc.wanandroid.ui.adapter.ArticleAdapter
import com.hjc.wanandroid.ui.adapter.BannerAdapter
import kotlinx.coroutines.flow.distinctUntilChanged
import kotlinx.coroutines.flow.map

class MainActivity : BaseActivity<ActivityMainBinding>() {

    companion object {
        private const val TAG = "MainActivity"
    }

    private val mViewModel by viewModels<MainViewModel>()
    private lateinit var bannerAdapter: BannerAdapter
    private lateinit var articleAdapter: ArticleAdapter

    override fun getViewBinding() = ActivityMainBinding.inflate(layoutInflater)

    override fun initViews() {
        bannerAdapter = BannerAdapter()
        binding.viewPager.adapter = bannerAdapter

        articleAdapter = ArticleAdapter()
        binding.recyclerView.adapter = articleAdapter
        binding.recyclerView.layoutManager = LinearLayoutManager(this)
        binding.recyclerView.addItemDecoration(
            DividerItemDecoration(
                this,
                DividerItemDecoration.VERTICAL
            )
        )
    }

    override fun initEvents() {
        binding.button.setOnClickListener {
            mViewModel.sendUiIntent(MainIntent.GetBanner)
            mViewModel.sendUiIntent(MainIntent.GetDetail(0))
        }

        lifecycleScope.launchWhenStarted {
            mViewModel.loadUiStateFlow.collect { state ->
                Log.d(TAG, "loadUiStateFlow: ${state}")
                when (state) {
                    is LoadUiState.Error -> toast(state.msg)
                    is LoadUiState.ShowMainView -> toast("show main")
                    is LoadUiState.Loading -> toast("show loading")
                }
            }
        }
        lifecycleScope.launchWhenStarted {
            mViewModel.uiStateFlow.map { it.bannerUiState }.distinctUntilChanged()
                .collect { bannerUiState ->
                    Log.d(TAG, "bannerUiState: $bannerUiState")
                    when (bannerUiState) {
                        is BannerUiState.INIT -> {}
                        is BannerUiState.SUCCESS -> {
                            binding.viewPager.isVisible = true
                            binding.button.isVisible = false
                            val imgs = mutableListOf<String>()
                            for (model in bannerUiState.models) {
                                imgs.add(model.imagePath)
                            }
                            bannerAdapter.setList(imgs)
                        }
                    }
                }
        }
        lifecycleScope.launchWhenStarted {
            mViewModel.uiStateFlow.map { it.detailUiState }.distinctUntilChanged()
                .collect { detailUiState ->
                    Log.d(TAG, "detailUiState: $detailUiState")
                    when (detailUiState) {
                        is DetailUiState.INIT -> {}
                        is DetailUiState.SUCCESS -> {
                            binding.recyclerView.isVisible = true
                            val list = detailUiState.articles.datas
                            articleAdapter.setList(list)
                        }
                    }

                }
        }
    }
}
package com.hjc.wanandroid.ui.main

import android.util.Log
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.core.view.isVisible
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.hjc.wanandroid.base.BaseFragment
import com.hjc.wanandroid.base.LoadUiIntent
import com.hjc.wanandroid.databinding.FragmentHomeBinding
import com.hjc.wanandroid.eventbus.Event
import com.hjc.wanandroid.eventbus.FlowEventBus
import com.hjc.wanandroid.ui.adapter.ArticleAdapter
import com.hjc.wanandroid.ui.adapter.BannerAdapter
import kotlinx.coroutines.flow.map
import org.koin.androidx.viewmodel.ext.android.viewModel

class HomeFragment : BaseFragment<FragmentHomeBinding>() {
    companion object {
        private const val TAG = "HomeFragment"
    }

    private lateinit var bannerAdapter: BannerAdapter
    private lateinit var articleAdapter: ArticleAdapter
    private val mViewModel by viewModel<MainViewModel>()


    override fun getViewBinding(
        inflater: LayoutInflater, container: ViewGroup?
    ): FragmentHomeBinding {
        return FragmentHomeBinding.inflate(inflater)
    }

    override fun initViews() {
        bannerAdapter = BannerAdapter()
        binding.viewPager.adapter = bannerAdapter

        articleAdapter = ArticleAdapter()
        binding.recyclerView.adapter = articleAdapter
        binding.recyclerView.layoutManager = LinearLayoutManager(context)
        binding.recyclerView.addItemDecoration(
            DividerItemDecoration(
                context, DividerItemDecoration.VERTICAL
            )
        )
    }

    override fun initDatas() {
        binding.button.setOnClickListener {
            mViewModel.sendUiIntent(MainIntent.GetBanner)
            mViewModel.sendUiIntent(MainIntent.GetDetail(0))
        }

        lifecycleScope.launchWhenStarted {
            mViewModel.loadUiIntentFlow.collect { state ->
                Log.d(TAG, "loadUiStateFlow: $state")
                when (state) {
                    is LoadUiIntent.Error -> Log.d(TAG, state.msg)
                    is LoadUiIntent.ShowMainView -> {
                        binding.viewPager.isVisible = true
                        binding.recyclerView.isVisible = true
                        binding.button.isVisible = false
                    }
                    is LoadUiIntent.Loading -> Log.d(TAG, "show loading")
                }
            }
        }
        lifecycleScope.launchWhenStarted {
            mViewModel.uiStateFlow.map { it.bannerUiState }
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
            mViewModel.uiStateFlow.map { it.detailUiState }
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

        FlowEventBus.observe<Event.ShowInit>(this, Lifecycle.State.STARTED) {
            it.msg
            binding.viewPager.isVisible = false
            binding.recyclerView.isVisible = false
            binding.button.isVisible = true
        }
    }
}
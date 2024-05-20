package com.hjc.wanandroid.ui.main

import android.os.Bundle
import android.view.View
import androidx.core.view.isVisible
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.lifecycleScope
import androidx.navigation.fragment.findNavController
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.hjc.wanandroid.base.BaseBindingFragment
import com.hjc.wanandroid.base.LoadUiIntent
import com.hjc.wanandroid.databinding.FragmentHomeBinding
import com.hjc.wanandroid.eventbus.Event
import com.hjc.wanandroid.eventbus.FlowEventBus
import com.hjc.wanandroid.ui.adapter.ArticleAdapter
import com.hjc.wanandroid.ui.adapter.BannerAdapter
import com.orhanobut.logger.Logger
import kotlinx.coroutines.flow.map
import org.koin.androidx.viewmodel.ext.android.viewModel

class HomeFragment : BaseBindingFragment<FragmentHomeBinding>({
    FragmentHomeBinding.inflate(it)
}) {

    private lateinit var bannerAdapter: BannerAdapter
    private lateinit var articleAdapter: ArticleAdapter
    private val mViewModel by viewModel<MainViewModel>()

    override fun initView(view: View, savedInstanceState: Bundle?) {
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
        articleAdapter.setOnItemClickListener { adapter, _, position ->
            adapter.getItem(position)?.let {
                val action = HomeFragmentDirections.actionHomeFragmentToArticleActivity(it)
                findNavController().navigate(action)
            }
        }
    }

    override fun initData(savedInstanceState: Bundle?) {
        binding.button.setOnClickListener {
            mViewModel.sendUiIntent(MainIntent.GetBanner)
            mViewModel.sendUiIntent(MainIntent.GetDetail(0))
        }

        lifecycleScope.launchWhenStarted {
            mViewModel.loadUiIntentFlow.collect { state ->
                Logger.d("loadUiStateFlow: $state")
                when (state) {
                    is LoadUiIntent.Error ->  Logger.d(state.msg)
                    is LoadUiIntent.ShowMainView -> {
                        binding.viewPager.isVisible = true
                        binding.recyclerView.isVisible = true
                        binding.button.isVisible = false
                    }

                    is LoadUiIntent.Loading ->  Logger.d("show loading")
                }
            }
        }
        lifecycleScope.launchWhenStarted {
            mViewModel.uiStateFlow.map { it.bannerUiState }.collect { bannerUiState ->
                 Logger.d("bannerUiState: $bannerUiState")
                when (bannerUiState) {
                    is BannerUiState.INIT -> {}
                    is BannerUiState.SUCCESS -> {
                        binding.viewPager.isVisible = true
                        binding.button.isVisible = false
                        val imgs = mutableListOf<String>()
                        for (model in bannerUiState.models) {
                            imgs.add(model.imagePath)
                        }
                        bannerAdapter.submitList(imgs)
                    }
                }
            }
        }
        lifecycleScope.launchWhenStarted {
            mViewModel.uiStateFlow.map { it.detailUiState }.collect { detailUiState ->
                 Logger.d("detailUiState: $detailUiState")
                when (detailUiState) {
                    is DetailUiState.INIT -> {}
                    is DetailUiState.SUCCESS -> {
                        binding.recyclerView.isVisible = true
                        val list = detailUiState.articles.datas
                        articleAdapter.submitList(list)
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
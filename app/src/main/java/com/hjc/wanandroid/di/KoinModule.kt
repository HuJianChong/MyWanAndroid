package com.hjc.wanandroid.di

import com.hjc.wanandroid.model.respository.HomeRepository
import com.hjc.wanandroid.ui.main.MainViewModel
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

/**
 *
 * @author jianchong.hu
 * @create at 2022 12.19
 * @description:
 **/

val repoModule = module {
    single { HomeRepository() }
}

val viewModelModule = module {
    viewModel { MainViewModel(get()) }
}

val appModule = listOf(viewModelModule, repoModule)
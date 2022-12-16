package com.hjc.wanandroid

import android.app.Application
import com.hjc.wanandroid.http.RetrofitUtil

/**
 * @author jianchong.hu
 * @create at 2022 12.13
 * @description:
 **/
class App : Application() {
    override fun onCreate() {
        super.onCreate()
        RetrofitUtil.initRetrofit()
    }
}
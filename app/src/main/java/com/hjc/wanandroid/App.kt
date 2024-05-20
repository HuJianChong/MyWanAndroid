package com.hjc.wanandroid

import android.app.Application
import com.hjc.wanandroid.di.appModule
import com.orhanobut.logger.AndroidLogAdapter
import com.orhanobut.logger.Logger
import org.koin.android.ext.koin.androidContext
import org.koin.android.ext.koin.androidLogger
import org.koin.core.context.GlobalContext.startKoin

/**
 * @author jianchong.hu
 * @create at 2022 12.13
 * @description:
 **/
class App : Application() {
    override fun onCreate() {
        super.onCreate()

        Logger.addLogAdapter(AndroidLogAdapter())
        initKoin()
    }

    private fun initKoin() {
        startKoin {
            //开始启动koin
            androidLogger()
            androidContext(this@App)//这边传Application对象,这样你注入的类中,需要app对象的时候,可以直接使用
            modules(appModule)//这里面传各种被注入的模块对象,支持多模块注入
        }
    }
}
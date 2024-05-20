package com.hjc.wanandroid.ui.main

import android.os.Bundle
import androidx.navigation.NavController
import androidx.navigation.fragment.NavHostFragment
import com.hjc.wanandroid.R
import com.hjc.wanandroid.base.BaseBindingActivity
import com.hjc.wanandroid.databinding.ActivityMainBinding
import com.orhanobut.logger.Logger

class MainActivity : BaseBindingActivity<ActivityMainBinding>({
    ActivityMainBinding.inflate(it)
}) {

    private lateinit var navController: NavController

    override fun initView(savedInstanceState: Bundle?) {
        super.initView(savedInstanceState)
        binding.navView.setOnItemSelectedListener {
            Logger.d("initViews: $it")
            when (it.itemId) {
                R.id.navigation_home -> switchFragment(0)
                R.id.navigation_blog -> switchFragment(1)
                R.id.navigation_search -> switchFragment(2)
                R.id.navigation_project_type -> switchFragment(3)
                R.id.navigation_me -> switchFragment(4)
            }
            true
        }

        val navHostFragment = supportFragmentManager.findFragmentById(R.id.fragment_container) as NavHostFragment
        navController = navHostFragment.navController
    }

    private fun switchFragment(position: Int) {
        val targetFragment = when (position) {
            0 -> R.id.home_fragment
            1 -> R.id.block_fragment
            2 -> R.id.search_fragment
            3 -> R.id.project_fragment
            4 -> R.id.me_fragment
            else -> R.id.home_fragment
        }
        navController.navigate(targetFragment)
    }

    override fun initData(savedInstanceState: Bundle?) {
    }
}
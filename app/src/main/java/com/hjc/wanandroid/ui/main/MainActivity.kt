package com.hjc.wanandroid.ui.main

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import androidx.viewpager2.adapter.FragmentStateAdapter
import com.hjc.wanandroid.R
import com.hjc.wanandroid.base.BaseActivity
import com.hjc.wanandroid.base.BaseBindingActivity
import com.hjc.wanandroid.databinding.ActivityMainBinding
import com.hjc.wanandroid.ui.main.fragment.BlogFragment
import com.hjc.wanandroid.ui.main.fragment.MeFragment
import com.hjc.wanandroid.ui.main.fragment.ProjectFragment
import com.hjc.wanandroid.ui.main.fragment.SearchFragment

class MainActivity : BaseBindingActivity<ActivityMainBinding>({
    ActivityMainBinding.inflate(it)
}) {
    companion object {
        private const val TAG = "MainActivity"
    }

    override fun initView(savedInstanceState: Bundle?) {
        binding.navView.setOnItemSelectedListener {
            Log.d(TAG, "initViews: $it")
            when (it.itemId) {
                R.id.navigation_home -> switchFragment(0)
                R.id.navigation_blog -> switchFragment(1)
                R.id.navigation_search -> switchFragment(2)
                R.id.navigation_project_type -> switchFragment(3)
                R.id.navigation_me -> switchFragment(4)
            }
            true
        }

        initViewPager()
    }

    private fun switchFragment(position: Int) = binding.mainViewPager.setCurrentItem(position, true)

    private fun initViewPager() {
        binding.mainViewPager.isUserInputEnabled = false
        binding.mainViewPager.offscreenPageLimit = 2
        binding.mainViewPager.adapter = object : FragmentStateAdapter(this) {
            override fun getItemCount(): Int = 5

            override fun createFragment(position: Int): Fragment = when (position) {
                0 -> HomeFragment()
                1 -> BlogFragment()
                2 -> SearchFragment()
                3 -> ProjectFragment()
                4 -> MeFragment()
                else -> HomeFragment()
            }

        }
    }

    override fun initData(savedInstanceState: Bundle?) {
    }
}
package com.hjc.wanandroid.model.respository

import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

class HomeRepositoryTest {

    private val repository = HomeRepository()

    @Before
    fun setUp() {
    }

    @Test
    fun requestWanData() = runBlocking {
        val result = repository.requestWanData()
        println(result)
        assertEquals(0, result.code)
        assertEquals(3, result.data?.size)
    }

    @Test
    fun requestRankData() = runBlocking {
        val result = repository.requestRankData(0)
        println(result)
        assertEquals(0, result.code)
        assertTrue(result.data?.datas?.size!! > 0)
    }
}
package com.hjc.wanandroid.model.respository

import android.util.Log
import android.util.Log.d
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.anyString
import org.mockito.Mockito
import org.powermock.modules.junit4.PowerMockRunner

@RunWith(PowerMockRunner::class)
class HomeRepositoryTest {

    private val repository = HomeRepository()
    private val mockLog = Mockito.mockStatic(Log::class.java)


    @Before
    fun setUp() {
        Mockito.`when`(Log.d(anyString(), anyString())).thenReturn(1)

        val result = Log.d("tag", "msg")
        assertEquals(1, result)
    }

    @Test
    fun testRequestWanData() = runBlocking {
        val result = repository.requestWanData()
        println(result)
//        assertEquals("Success", result.errorMsg)
        assertEquals(3, result.data?.size)
    }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wan_android/app.dart';
import 'package:my_wan_android/http/dio_instance.dart';


void main() async{
  DioInstance.instance().initDio(baseUrl: "https://www.wanandroid.com/");
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}


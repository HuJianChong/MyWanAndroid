import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_wan_android/datas/home_banner_data.dart';

class HomeViewModel extends ChangeNotifier {
  List<BannerData>? bannerList;

  void getBanner() async {
    Dio dio = Dio();
    dio.options = BaseOptions(
        method: "get",
        baseUrl: "https://www.wanandroid.com/",
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30));
    Response response = await dio.get("/banner/json");
    HomeBannerData homeBannerData = HomeBannerData.fromJson(response.data);
    if (homeBannerData.errorCode == 0 && homeBannerData.data != null) {
      bannerList = homeBannerData.data;
    } else {
      bannerList = [];
    }
    notifyListeners();
  }
}

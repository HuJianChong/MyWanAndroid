import 'dart:async';
import 'dart:developer';

import 'package:my_wan_android/repository/api/wan_api.dart';
import 'package:my_wan_android/repository/model/home_banner_model.dart';



class BannerLogic {
  //初始化状态数据
  final BannerState state = BannerState();

  //获取流控制器
  final _controller = StreamController<BannerState>.broadcast(onListen: () {
    log("BannerLogic _controller onListen");
  }, onCancel: () {
    log("BannerLogic _controller onCancel");
  });

  //获取流控制器正在控制的流
  Stream<BannerState> getStream() {
    return _controller.stream;
  }

  ///获取Banner列表
  Future getBannerList() async {
    try {
      List<HomeBannerModel?>? banner = await WanApi.instance().bannerList();
      state.bannerList = banner;
    } catch (error) {
      state.bannerList = [];
    }
    _controller.add(state);
  }

  //需要在state-》dispose中调用
  void dispose() {
    _controller.close();
  }
}

class BannerState {
  List<HomeBannerModel?>? bannerList = [];
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_wan_android/repository/api/wan_api.dart';

import '../../repository/model/my_collects_model.dart';

//我的收藏页面逻辑层
class MyCollectsViewModel with ChangeNotifier {
  List<MyCollectItemModel>? dataList = [];
  int _pageCount = 0;

  ///获取我的收藏列表
  Future getMyCollects(bool loadMore) async {
    if (loadMore) {
      _pageCount++;
    } else {
      _pageCount = 0;
      dataList?.clear();
    }
    var list = await WanApi.instance().getMyCollects("$_pageCount");
    if (list != null && list.isNotEmpty == true) {
      dataList?.addAll(list);
      notifyListeners();
    } else {
      if (loadMore && _pageCount > 0) {
        _pageCount--;
      }
    }
  }

  ///取消收藏文章
  Future cancelCollect(int index, String? id) async {
    bool success = await WanApi.instance().cancelCollect(id ?? "");
    if (success) {
      try {
        dataList?.remove(dataList?[index]);
        notifyListeners();
      } catch (e) {
        log("cancelCollect error=$e");
      }
    }
  }
}

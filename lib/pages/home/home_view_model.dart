import 'package:flutter/cupertino.dart';

import '../../repository/api/wan_api.dart';
import '../../repository/model/home_list_model.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeListItemData>? listData = [];
  int _pageCount = 0;

  Future initDataList(bool loadMore, {ValueChanged<bool>? complete}) async {
    //加载更多
    if (loadMore) {
      _pageCount++;
    } else {
      //重置页码
      _pageCount = 0;
      //刷新数据
      listData?.clear();
    }

    //先获取置顶列表
    _getTopHomeList(loadMore).then((topList) {
      if (!loadMore) {
        listData?.addAll(topList ?? []);
      }
      _getHomeList(loadMore).then((list) {
        listData?.addAll(list ?? []);
        notifyListeners();
        //完成后抛出回调
        complete?.call(loadMore);
      });
    });
  }

  ///获取数据
  Future<List<HomeListItemData>?> _getHomeList(bool loadMore) async {
    HomeListModel? data = await WanApi.instance().homeList("$_pageCount");
    if (data != null && data.datas?.isNotEmpty == true) {
      return data.datas;
    } else {
      //加载更多场景，拿不到数据，页码-1
      if (loadMore && _pageCount > 0) {
        _pageCount--;
      }
      return [];
    }
  }

  ///获取置顶文章列表
  Future<List<HomeListItemData>?> _getTopHomeList(bool loadMore) async {
    //加载更多场景不需要获取置顶数据
    if (loadMore) {
      return [];
    }
    HomeTopListModel? data = await WanApi.instance().topHomeList();
    return data.dataList;
  }

  ///收藏文章
  Future collect(int index, String? id) async {
    bool success = await WanApi.instance().collect(id ?? "");
    if (success) {
      listData?[index].collect = true;
      notifyListeners();
    }
  }

  ///取消收藏文章
  Future cancelCollect(int index, String? id) async {
    bool success = await WanApi.instance().cancelCollect(id ?? "");
    if (success) {
      listData?[index].collect = false;
      notifyListeners();
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:my_wan_android/repository/api/wan_api.dart';

import '../../repository/model/common_website_model.dart';
import '../../repository/model/search_hot_key_model.dart';

class HotCommonViewModel with ChangeNotifier {
  List<SearchHotKeyModel> hotKeyList = [];
  List<CommonWebsiteModel> websiteList = [];

  Future getData({VoidCallback? complete}) async {
    getHotKeyList(complete: () {
      commonWebsiteList(complete: () {
        complete?.call();
      });
    });
  }

  ///获取搜索热词
  Future getHotKeyList({VoidCallback? complete}) async {
    var list = await WanApi.instance().searchHotKeys();
    if (list != null) {
      hotKeyList = list;
      notifyListeners();
    }
    complete?.call();
  }

  ///获取搜索热词
  Future commonWebsiteList({VoidCallback? complete}) async {
    var list = await WanApi.instance().commonWebsiteList();
    if (list != null) {
      websiteList = list;
      notifyListeners();
    }
    complete?.call();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_wan_android/common_ui/loading.dart';
import 'package:my_wan_android/repository/api/wan_api.dart';

import '../../../repository/model/knowledge_detail_list_model.dart';
import '../../../repository/model/knowledge_detail_param.dart';

///知识体系业务逻辑层
class KnowledgeDetailsViewModel with ChangeNotifier {
  List<Tab> tabList = [];

  List<KnowledgeDetailItem> detailList = [];

  //页码
  int _pageCount = 0;

  ///初始化tab列表
  void initTabs(List<KnowledgeDetailParam>? params) {
    if (params?.isNotEmpty == true) {
      params?.forEach((item) {
        tabList.add(Tab(text: item.name ?? ""));
      });
    }
  }

  ///知识体系明细列表数据
  Future getDetailList(String? id, bool loadMore) async {
    Loading.showLoading();
    if (loadMore) {
      _pageCount++;
    } else {
      _pageCount = 0;
      detailList.clear();
    }
    var list = await WanApi.instance().knowledgeDetailList(id ?? "", "$_pageCount");
    if (list?.isNotEmpty == true) {
      detailList.addAll(list ?? []);
      notifyListeners();
    } else {
      if (loadMore && _pageCount > 0) {
        _pageCount--;
      }
    }
    Loading.dismissAll();
  }
}

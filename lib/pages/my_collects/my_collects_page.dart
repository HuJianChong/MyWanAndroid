import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wan_android/common_ui/smart_refresh/smart_refresh_widget.dart';
import 'package:my_wan_android/repository/model/my_collects_model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common_ui/common_styles.dart';
import '../../common_ui/web/webview_page.dart';
import '../../common_ui/web/webview_widget.dart';
import '../../route/route_utils.dart';
import 'my_collects_view_model.dart';

///我的收藏页面
class MyCollectsPage extends StatefulWidget {
  const MyCollectsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyCollectsPageState();
  }
}

class _MyCollectsPageState extends State<MyCollectsPage> {
  var model = MyCollectsViewModel();
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
    refreshOrLoad(false);
  }

  void refreshOrLoad(bool loadMore) {
    model.getMyCollects(loadMore).then((value) {
      if (loadMore) {
        _refreshController.loadComplete();
      } else {
        _refreshController.refreshCompleted();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return model;
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: Selector<MyCollectsViewModel, List<MyCollectItemModel>?>(
              builder: (context, list, child) {
                return SmartRefreshWidget(
                    controller: _refreshController,
                    onRefresh: () {
                      refreshOrLoad(false);
                    },
                    onLoading: () {
                      refreshOrLoad(true);
                    },
                    child: ListView.builder(
                        itemCount: list?.length ?? 0,
                        itemBuilder: (context, index) {
                          return _collectItem(list?[index], onTap: () {
                            //取消收藏
                            model.cancelCollect(index, "${list?[index].id}");
                          }, itemClick: () {
                            //进入网页
                            RouteUtils.push(
                                context,
                                WebViewPage(
                                    loadResource: list?[index].link ?? "",
                                    webViewType: WebViewType.URL,
                                    showTitle: true,
                                    title: list?[index].title));
                          });
                        }));
              },
              selector: (context, vm) {
                return vm.dataList;
              },
            ))));
  }

  Widget _collectItem(MyCollectItemModel? item,
      {GestureTapCallback? onTap, GestureTapCallback? itemClick}) {
    return GestureDetector(
        onTap: itemClick,
        child: Container(
            margin: EdgeInsets.all(10.r),
            padding: EdgeInsets.all(15.r),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Expanded(
                  child: Text("作者: ${item?.author}"),
                ),
                Text("时间: ${item?.niceDate}")
              ]),
              SizedBox(height: 6.h),
              Text("${item?.title}", style: titleTextStyle15),
              Row(children: [
                Expanded(child: Text("分类: ${item?.chapterName}")),
                collectImage(true, onTap: onTap)
              ]),
            ])));
  }
}

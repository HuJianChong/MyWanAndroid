import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wan_android/common_ui/banner/home_banner_widget.dart';
import 'package:my_wan_android/common_ui/web/webview_page.dart';
import 'package:my_wan_android/common_ui/web/webview_widget.dart';
import 'package:my_wan_android/pages/home/home_view_model.dart';
import 'package:my_wan_android/route/route_utils.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common_ui/common_styles.dart';
import '../../common_ui/smart_refresh/smart_refresh_widget.dart';
import '../../repository/model/home_list_model.dart';

///首页文章列表页面
class HomeListPage extends StatefulWidget {
  const HomeListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeListPageState();
  }
}

class _HomeListPageState extends State<HomeListPage> {
  var model = HomeViewModel();
  BannerController? bannerController = BannerController();
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
    model.initDataList(false);
  }

  void refreshOrLoad(bool loadMore) {
    model.initDataList(loadMore, complete: (loadMore) {
      if (loadMore) {
        _refreshController.loadComplete();
      } else {
        _refreshController.refreshCompleted();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {
      return model;
    }, builder: (BuildContext context, Widget? child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: SmartRefreshWidget(
                  controller: _refreshController,
                  onLoading: () {
                    refreshOrLoad(true);
                  },
                  onRefresh: () {
                    refreshOrLoad(false);
                  },
                  child: SingleChildScrollView(
                      child: Column(children: [
                    BannerWidget(
                      controller: bannerController,
                      itemClick: (title, url) {
                        //进入网页
                        RouteUtils.push(
                            context,
                            WebViewPage(
                                loadResource: url,
                                webViewType: WebViewType.URL,
                                showTitle: true,
                                title: title));
                      },
                    ),
                    Consumer<HomeViewModel>(builder: (context, value, child) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.listData?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            HomeListItemData? item = value.listData?[index];
                            return _listItem(
                                item: item,
                                onItemClick: () {
                                  //进入网页
                                  RouteUtils.push(
                                      context,
                                      WebViewPage(
                                          loadResource: item?.link ?? "",
                                          webViewType: WebViewType.URL,
                                          showTitle: true,
                                          title: item?.title));
                                },
                                imageClick: () {
                                  if (item?.collect == true) {
                                    //取消收藏
                                    model.cancelCollect(index, "${item?.id}");
                                  } else {
                                    //收藏
                                    model.collect(index, "${item?.id}");
                                  }
                                });
                          });
                    })
                  ])))));
    });
  }

  ///列表item
  Widget _listItem(
      {HomeListItemData? item, GestureTapCallback? onItemClick, GestureTapCallback? imageClick}) {
    return GestureDetector(
        onTap: onItemClick,
        child: Container(
            margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                border: Border.all(color: Colors.black26)),
            width: double.infinity,
            padding: EdgeInsets.all(15.r),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(25.r),
                    child: Image.asset("assets/images/luoxiaohei.png",
                        width: 25.r, height: 25.r, fit: BoxFit.fill)),
                SizedBox(width: 5.w),
                normalText(item?.author),
                const Expanded(child: SizedBox()),
                normalText(item?.niceShareDate),
                SizedBox(
                  width: 10.w,
                ),
                Text(item?.type == 1 ? "置顶" : "",
                    style: TextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.w600, color: Colors.blueAccent))
              ]),
              SizedBox(height: 5.h),
              Text(
                item?.title ?? "",
                style: titleTextStyle15,
              ),
              SizedBox(height: 5.h),
              Row(children: [
                Text(
                  item?.chapterName ?? "",
                  style: TextStyle(fontSize: 13.sp, color: Colors.green),
                ),
                const Expanded(child: SizedBox()),
                collectImage(item?.collect, onTap: imageClick)
              ])
            ])));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wan_android/common_ui/smart_refresh/smart_refresh_widget.dart';
import 'package:my_wan_android/pages/knowledge/details/knowledge_details_view_model.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common_ui/common_styles.dart';
import '../../../common_ui/web/webview_page.dart';
import '../../../common_ui/web/webview_widget.dart';
import '../../../repository/model/knowledge_detail_list_model.dart';
import '../../../route/route_utils.dart';

///知识体系明细tab页签页面
class DetailTabChildPage extends StatefulWidget {
  final String? id;

  const DetailTabChildPage({super.key, this.id});

  @override
  State<StatefulWidget> createState() {
    return _DetailTabChildPageState();
  }
}

class _DetailTabChildPageState extends State<DetailTabChildPage> {
  var model = KnowledgeDetailsViewModel();
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
    refreshOrLoad(false);
  }

  void refreshOrLoad(bool loadMore) {
    model.getDetailList(widget.id, loadMore).then((value) {
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
          body: Consumer<KnowledgeDetailsViewModel>(builder: (context, value, child) {
            return SmartRefreshWidget(
                controller: _refreshController,
                onRefresh: () {
                  refreshOrLoad(false);
                },
                onLoading: () {
                  refreshOrLoad(true);
                },
                child: ListView.builder(
                    itemCount: value.detailList.length,
                    itemBuilder: (context, index) {
                      return _item(value.detailList[index], onTap: () {
                        //进入网页
                        RouteUtils.push(
                            context,
                            WebViewPage(
                                loadResource: value.detailList[index].link ?? "",
                                webViewType: WebViewType.URL,
                                showTitle: true,
                                title: value.detailList[index].title));
                      });
                    }));
          })),
    );
  }

  Widget _item(KnowledgeDetailItem item, {GestureTapCallback? onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(border: Border.all(color: Colors.black12, width: 0.5.r)),
            child: Column(children: [
              Row(
                children: [
                  normalText(item.superChapterName),
                  Expanded(child: SizedBox()),
                  Text("${item.niceShareDate}"),
                ],
              ),
              Text("${item.title}", style: titleTextStyle15),
              Row(
                children: [
                  normalText(item.chapterName),
                  Expanded(child: SizedBox()),
                  Text("${item.shareUser}"),
                ],
              )
            ])));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wan_android/common_ui/web/webview_page.dart';
import 'package:my_wan_android/common_ui/web/webview_widget.dart';
import 'package:my_wan_android/pages/search/search_view_model.dart';
import 'package:my_wan_android/repository/model/search_list_model.dart';
import 'package:my_wan_android/route/route_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../../common_ui/common_styles.dart';

///搜索页
class SearchPage extends StatefulWidget {
  final String? keyWord;

  const SearchPage({super.key, this.keyWord});

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  SearchViewModel viewModel = SearchViewModel();
  TextEditingController? _editController;

  @override
  void initState() {
    _editController = TextEditingController(text: widget.keyWord ?? "");
    super.initState();
    viewModel.searchList(widget.keyWord);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return viewModel;
        },
        child: Scaffold(
            body: SafeArea(
                child: Column(
          children: [
            _searchBar(onSubmitted: (value) {
              if (!value.trim().isNotEmpty) {
                showToast("输入不可以为空啊！");
                return;
              }
              //当点击软件的回车键就会触发此回调
              //主动隐藏软键盘
              // SystemChannels.textInput.invokeMethod('TextInput.hide');
              //另一种方式
              // FocusScope.of(context).unfocus();
              viewModel.searchList(value);
            }, onTapCancel: () {
              //清空
              viewModel.clearList();
            }, onTapFinish: () {
              //退出
              Navigator.pop(context);
            }),
            _searchResultsView(onItemTap: (item) {
              RouteUtils.push(
                  context,
                  WebViewPage(
                      loadResource: item?.link ?? "",
                      title: item?.title,
                      showTitle: true,
                      webViewType: WebViewType.URL));
            })
          ],
        ))));
  }

  Widget _searchBar(
      {ValueChanged<String>? onSubmitted,
      GestureTapCallback? onTapCancel,
      GestureTapCallback? onTapFinish}) {
    return Container(
        color: Colors.teal,
        height: 50.h,
        child: Row(children: [
          SizedBox(width: 5.w),
          GestureDetector(
              onTap: onTapFinish,
              child: Image.asset(
                "assets/images/icon_back.png",
                width: 30.r,
                height: 30.r,
              )),
          SizedBox(width: 10.w),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: TextField(
                    textAlign: TextAlign.justify,
                    controller: _editController,
                    style: titleTextStyle15,
                    decoration: _inputDecoration(),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    onSubmitted: onSubmitted,
                  ))),
          SizedBox(width: 10.w),
          GestureDetector(onTap: onTapCancel, child: Text("取消", style: whiteTextStyle15)),
          SizedBox(width: 15.w)
        ]));
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(15.r)));
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
        contentPadding: EdgeInsets.only(left: 10.w),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: _inputBorder(),
        focusedBorder: _inputBorder(),
        border: _inputBorder());
  }

  Widget _searchResultsView({ValueChanged<SearchListItemModel?>? onItemTap}) {
    return Selector<SearchViewModel, List<SearchListItemModel>?>(builder: (context, value, child) {
      return Expanded(
          child: ListView.builder(
              itemCount: value?.length ?? 0,
              itemBuilder: (context, index) {
                var item = value?[index];
                return _resultItem(item, onItemTap: () {
                  onItemTap?.call(item);
                });
              }));
    }, selector: (context, vm) {
      return vm.dataList;
    });
  }

  Widget _resultItem(SearchListItemModel? item, {GestureTapCallback? onItemTap}) {
    return GestureDetector(
        onTap: onItemTap,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 10.h),
          width: double.infinity,
          child: Html(data:item?.title ?? "" ,style: {
            //整体样式使用 html
            "html":Style(fontSize: FontSize(15.sp))
          }),
        ));


  }
}

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_wan_android/common_ui/web/webview_widget.dart';

///显示网页资源的页面
class WebViewPage extends StatefulWidget {
  WebViewPage({
    super.key,
    required this.loadResource,
    required this.webViewType,
    this.showTitle,
    this.title,
    this.jsChannelMap,
  });

  //是否显示标题
  final bool? showTitle;

  //标题内容
  final String? title;

  //需要加载的内容类型
  final WebViewType webViewType;

  //给webview加载的数据,可以是url，也可以是html文本
  final String loadResource;

  //与js通信的channel集合
  final Map<String, JsChannelCallback>? jsChannelMap;

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.showTitle ?? false)
          ? AppBar(title: _buildAppBarTitle(widget.showTitle, widget.title))
          : null,
      body: SafeArea(
        child: WebViewWidget(
          webViewType: widget.webViewType,
          loadResource: widget.loadResource,
          jsChannelMap: widget.jsChannelMap,
        ),
      ),
    );
  }

  Widget _buildAppBarTitle(bool? showTitle, String? title) {
    var show = showTitle ?? false;
    return show
        ? Html(data: title ?? "", style: {
            //整体样式使用 html
            "html": Style(fontSize: FontSize(15.sp))
          })
        : const SizedBox.shrink();
  }

  String limitsStr(String? content, {int limit = 15}) {
    if (content == null || content.isEmpty == true) {
      return "";
    }
    if (content.length > 15) {
      return content.substring(0, 15);
    } else {
      return content;
    }
  }
}

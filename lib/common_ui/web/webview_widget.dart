import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_wan_android/common_ui/loading.dart';

///需要加载的内容类型
enum WebViewType {
  //html文本
  HTMLTEXT,
  //链接
  URL
}

///定义js通信回调方法
typedef dynamic JsChannelCallback(List<dynamic> arguments);

///封装的WebView组件
class WebViewWidget extends StatefulWidget {
  const WebViewWidget(
      {super.key,
      required this.webViewType,
      required this.loadResource,
      this.jsChannelMap,
      this.onWebViewCreated,
      this.clearCache});

  //需要加载的内容类型
  final WebViewType webViewType;

  //给webview加载的数据,可以是url，也可以是html文本
  final String loadResource;

  //是否清除缓存后再加载
  final bool? clearCache;

  //与js通信的channel集合
  final Map<String, JsChannelCallback>? jsChannelMap;

  final Function(InAppWebViewController controller)? onWebViewCreated;

  @override
  State<StatefulWidget> createState() {
    return _WebViewWidgetState();
  }
}

class _WebViewWidgetState extends State<WebViewWidget> {
  //webview控制器
  late InAppWebViewController webViewController;
  final GlobalKey webViewKey = GlobalKey();

  // webview配置
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    // 跨平台配置
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    // android平台配置
    android: AndroidInAppWebViewOptions(
      //不允许缩放
      builtInZoomControls: false,
      //支持HybridComposition
      useHybridComposition: true,
    ),
    // ios平台配置
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
        key: webViewKey,
        initialOptions: options,
        onWebViewCreated: (controller) {
          //webview初始化完成之后加载数据
          webViewController = controller;

          //是否清除缓存后再加载
          if (widget.clearCache == true) {
            controller.clearCache();
          }

          if (widget.onWebViewCreated == null) {
            if (widget.webViewType == WebViewType.HTMLTEXT) {
              webViewController.loadData(data: widget.loadResource);
            } else if (widget.webViewType == WebViewType.URL) {
              webViewController.loadUrl(
                  urlRequest: URLRequest(url: Uri.parse(widget.loadResource)));
            }
          } else {
            widget.onWebViewCreated?.call(controller);
          }

          //注册与js通信回调
          widget.jsChannelMap?.forEach((handlerName, callback) {
            webViewController.addJavaScriptHandler(handlerName: handlerName, callback: callback);
          });
        },
        onConsoleMessage: (controller, consoleMessage) {
          //这里是打印来自于js的conse.log打印
          log("consoleMessage ====来自于js的打印==== \n $consoleMessage");
        },
        onProgressChanged: (InAppWebViewController controller, int progress) {},
        onLoadStart: (InAppWebViewController controller, Uri? url) {
          Loading.showLoading(duration: const Duration(seconds: 45));
        },
        onLoadError: (InAppWebViewController controller, Uri? url, int code, String message) {
          Loading.dismissAll();
        },
        onLoadStop: (InAppWebViewController controller, Uri? url) {
          Loading.dismissAll();
        },
        onPageCommitVisible: (InAppWebViewController controller, Uri? url) {});
  }
}

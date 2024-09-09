//路由地址
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/web_view_page.dart';

class RoutePath {
  // 首页
  static const String home = '/';

  // 网页
  static const String webView = '/web_view';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(const HomePage(), settings: settings);
      case RoutePath.webView:
        return pageRoute(WebViewPage(), settings: settings);
      default:
        return pageRoute(const Scaffold(body: Center(child: Text("404"))), settings: settings);
    }
  }

  static MaterialPageRoute pageRoute(Widget page,
      {RouteSettings? settings, bool? fullscreenDialog, bool? maintainState, bool? allowSnapshotting}) {
    return MaterialPageRoute(
        builder: (context) => page,
        settings: settings,
        fullscreenDialog: fullscreenDialog ?? false,
        maintainState: maintainState ?? true,
        allowSnapshotting: allowSnapshotting ?? true);
  }
}

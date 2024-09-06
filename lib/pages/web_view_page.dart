import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WebViewPage")),
      body: SafeArea(child: Text("WebViewPage")),
    );
  }
}

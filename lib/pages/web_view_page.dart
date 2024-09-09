import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  final String url;

  const WebViewPage({super.key, required this.title, required this.url});

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SafeArea(child: Container(child: _buildBackBtn())));
  }

  Widget _buildBackBtn() {
    return InkWell(
      child: const Text("返回"),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}

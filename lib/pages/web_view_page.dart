import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  String? title;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        var arguments = ModalRoute.of(context)?.settings.arguments;
        if (arguments is Map) {
          title = arguments['title'];
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title ?? "")), body: SafeArea(child: Container(child: _buildBackBtn())));
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

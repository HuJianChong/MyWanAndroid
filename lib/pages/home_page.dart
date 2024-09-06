import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:my_wan_android/pages/web_view_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          _Banner(),
          _ListView(),
        ],
      )),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150.h,
      child: Swiper(
        itemCount: 3,
        autoplay: true,
        indicatorLayout: PageIndicatorLayout.SCALE,
        pagination: const SwiperPagination(),
        controller: SwiperController(),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.lightBlue,
            height: 150.h,
            width: double.infinity,
          );
        },
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WebViewPage();
                  }));
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26, width: 0.5.r),
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  padding: EdgeInsets.all(10.r),
                  child: _getItem(index),
                ));
          }),
    );
  }

  Widget _getItem(int index) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: Image.network(
              "https://img1.baidu.com/it/u=3603317136,738383731&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=667",
              width: 50.r,
              height: 50.r,
              fit: BoxFit.cover),
        ),
        const SizedBox(width: 10),
        const Text("作者"),
        const Expanded(child: SizedBox()),
        Padding(padding: EdgeInsets.only(right: 10.w), child: const Text("2024-9-6 09:43")),
        const Text(
          "置顶",
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ]),
      const SizedBox(height: 10),
      const Text("标题标题标题标题标题标题标题标题"),
      const SizedBox(height: 10),
      Row(children: [
        const Text("分类"),
        const Expanded(child: SizedBox()),
        Image.asset(
          "assets/images/fav.png",
          width: 30.r,
          height: 30.r,
        )
      ]),
    ]);
  }
}

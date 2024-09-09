import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:my_wan_android/pages/home/home_vm.dart';
import 'package:my_wan_android/route/routes.dart';

import '../../datas/home_banner_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  List<BannerData>? bannerList;

  @override
  void initState() {
    super.initState();
    initBanner();
  }

  void initBanner() async {
    bannerList = await HomeViewModel.getBanner();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          _banner(),
          _listView(),
        ],
      ),
    ));
  }

  Widget _banner() {
    return SizedBox(
      width: double.infinity,
      height: 150.h,
      child: Swiper(
        itemCount: bannerList?.length ?? 0,
        autoplay: true,
        indicatorLayout: PageIndicatorLayout.SCALE,
        pagination: const SwiperPagination(),
        controller: SwiperController(),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.lightBlue,
            height: 150.h,
            width: double.infinity,
            child: Image.network(bannerList?[index].imagePath ?? '', fit: BoxFit.cover),
          );
        },
      ),
    );
  }

  Widget _listView() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutePath.webView,
                    arguments: {"title": "从首页来的", "url": "https://www.baidu.com/"});
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
        });
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

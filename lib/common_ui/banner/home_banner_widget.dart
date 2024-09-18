import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import 'banner_logic.dart';

abstract class BaseBannerController {
  void reload(bool load);
}

class BannerController extends BaseBannerController {
  BannerLogic? logic;

  @override
  void reload(bool load) {
    logic?.getBannerList();
  }

  void initState() {
    //组件初始化阶段获取数据
    logic ??= BannerLogic();
    logic?.getBannerList();
  }

  void dispose() {
    logic?.dispose();
  }
}

typedef BannerClick = Function(String title, String url);

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    super.key,
    this.itemClick,
    required this.controller,
  });

  final BannerClick? itemClick;
  final BannerController? controller;

  @override
  State<StatefulWidget> createState() {
    return _BannerWidgetState();
  }
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller?.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: widget.controller?.logic?.state,
        stream: widget.controller?.logic?.getStream(),
        builder: (context, AsyncSnapshot<BannerState> snapshot) {
          if (snapshot.data?.bannerList == null || snapshot.data?.bannerList?.isEmpty == true) {
            return SizedBox(height: 20.h);
          }
          return Container(
              width: double.infinity,
              height: 150.h,
              margin: EdgeInsets.only(left: 23.w, right: 23.w, top: 20.h),
              child: Swiper(
                indicatorLayout: PageIndicatorLayout.NONE,
                autoplayDelay: 5000,
                duration: 800,
                autoplay: true,
                pagination: SwiperPagination(
                    margin: EdgeInsets.all(5.r),
                    builder: DotSwiperPaginationBuilder(
                        size: 8.r, activeColor: Colors.blueAccent, color: Colors.grey)),
                // control: SwiperControl(size: 5.r),
                autoplayDisableOnInteraction: false,
                onTap: (int index) {
                  var url = snapshot.data?.bannerList?[index]?.url ?? "";
                  var title = snapshot.data?.bannerList?[index]?.title ?? "";
                  log("BannerWidget banner点击 地址=$url");
                  widget.itemClick?.call(title, url);
                },
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          placeholder: (context, url) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          imageUrl: snapshot.data?.bannerList?[index]?.imagePath ?? ""));
                },
                itemCount: snapshot.data?.bannerList?.length ?? 0,
              ));
        });
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }
}

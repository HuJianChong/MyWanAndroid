import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_wan_android/constants.dart';
import 'package:my_wan_android/repository/api/wan_api.dart';
import 'package:my_wan_android/utils/sp_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../repository/model/app_check_update_model.dart';

class MineViewModel with ChangeNotifier {
  String? userName;
  bool? shouldLogin;
  bool needUpdate = false;

  Future initData() async {
    String? name = await SpUtils.getString(Constants.SP_USER_NAME);
    log("MineViewModel $name");
    if (name == null || name.isEmpty == true) {
      userName = "未登录";
      shouldLogin = true;
    } else {
      userName = name;
      shouldLogin = false;
    }

    //是否显示更新红点
    shouldShowUpdateDot();

    notifyListeners();
  }

  ///退出登录
  Future logout() async {
    var success = await WanApi.instance().logout();
    if (success) {
      userName = "未登录";
      shouldLogin = true;
      //清除缓存
      SpUtils.remove(Constants.SP_USER_NAME);
      notifyListeners();
    } else {
      showToast("网络异常");
    }
  }

  Future shouldShowUpdateDot() async {
    var packInfo = await PackageInfo.fromPlatform();
    //获取当前app的版本code
    String versionCode = packInfo.buildNumber;
    //获取保存的新版本code
    String newVerCode = await SpUtils.getString(Constants.SP_NEW_APP_VERSION);
    if ((int.tryParse(versionCode) ?? 0) >= (int.tryParse(newVerCode) ?? 0)) {
      //当前已是最新版本
      needUpdate = false;
    } else {
      //有新版本，显示红点
      needUpdate = true;
    }
  }

  ///检查更新
  Future<String?> checkUpdate() async {
    var packInfo = await PackageInfo.fromPlatform();
    //获取当前app的版本code
    String versionCode = packInfo.buildNumber;

    AppCheckUpdateModel? model = await WanApi.instance().checkUpdate();
    //线上版本的code
    String onlineAppVerCode = model?.data?.buildVersionNo ?? "0";
    try {
      //如果当前版本小于线上版本，需要更新
      if ((int.tryParse(versionCode) ?? 0) < ((int.tryParse(onlineAppVerCode) ?? 0))) {
        SpUtils.saveString(Constants.SP_NEW_APP_VERSION, onlineAppVerCode);
        return model?.data?.downloadURL;
      } else {
        SpUtils.saveString(Constants.SP_NEW_APP_VERSION, versionCode);
        return null;
      }
    } catch (e) {
      log("checkUpdate error=$e");
      SpUtils.saveString(Constants.SP_NEW_APP_VERSION, versionCode);
      return null;
    }
  }

  ///跳转到外部浏览器打开
  Future jumpToOutLink(String? url) async {
    final uri = Uri.parse(url ?? "");
    if (await canLaunchUrl(uri)) {
      return launchUrl(uri);
    }
    return null;
  }
}

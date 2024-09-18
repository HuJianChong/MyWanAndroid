import 'package:dio/dio.dart';
import 'package:my_wan_android/http/dio_instance.dart';
import 'package:my_wan_android/repository/model/home_banner_model.dart';
import 'package:my_wan_android/repository/model/home_list_model.dart';
import 'package:my_wan_android/repository/model/knowledge_detail_list_model.dart';
import 'package:my_wan_android/repository/model/knowledge_list_model.dart';
import 'package:my_wan_android/repository/model/my_collects_model.dart';

import '../model/app_check_update_model.dart';
import '../model/common_website_model.dart';
import '../model/search_hot_key_model.dart';
import '../model/search_list_model.dart';
import '../model/user_info_model.dart';

class WanApi {
  static WanApi? _instance;

  WanApi._internal();

  static WanApi instance() {
    return _instance ??= WanApi._internal();
  }

  ///获取首页文章列表
  Future<HomeListModel?> homeList(String pageCount) async {
    // Dio dio = Dio();
    // dio.options = BaseOptions(
    //     method: "GET",
    //     baseUrl: "https://www.wanandroid.com/",
    //     connectTimeout: Duration(seconds: 30),
    //     receiveTimeout: Duration(seconds: 30),
    //     sendTimeout: Duration(seconds: 30));
    // Response response = await dio.get("article/list/0/json");
    Response response = await DioInstance.instance().get(path: "article/list/$pageCount/json");
    // var model = HomeListModel();
    // model.fromData(response.data);
    return HomeListModel.fromJson(response.data);
    // return null;
  }

  ///获取置顶文章列表
  Future<HomeTopListModel> topHomeList() async {
    Response response = await DioInstance.instance().get(path: "article/top/json");
    return HomeTopListModel.fromJson(response.data);
  }

  ///获取首页banner数据
  Future<List<HomeBannerModel?>?> bannerList() async {
    Response response = await DioInstance.instance().get(path: "banner/json");
    var model = HomeBannerListModel.fromJson(response.data);
    return model.bannerList;
  }

  ///获取搜索热词
  Future<List<SearchHotKeyModel>?> searchHotKeys() async {
    Response response = await DioInstance.instance().get(path: "hotkey/json");
    var model = SearchHotKeyListModel.fromJson(response.data);
    return model.list;
  }

  ///获取常用网站
  Future<List<CommonWebsiteModel>?> commonWebsiteList() async {
    Response response = await DioInstance.instance().get(path: "friend/json");
    var model = CommonWebsiteListModel.fromJson(response.data);
    return model.list;
  }

  ///知识体系列表
  Future<List<KnowledgeModel?>?> knowledgeList() async {
    Response response = await DioInstance.instance().get(path: "tree/json");
    var model = KnowledgeListModel.fromJson(response.data);
    return model.list;
  }

  ///知识体系明细列表数据
  Future<List<KnowledgeDetailItem>?> knowledgeDetailList(String id, String pageCount) async {
    // article/list/0/json?cid=60
    Response response =
        await DioInstance.instance().get(path: "article/list/$pageCount/json", param: {"cid": id});
    var model = KnowledgeDetailListModel.fromJson(response.data);
    return model.datas;
  }

  ///登录
  Future<UserInfoModel?> login(String? name, String? pwd) async {
    Response response = await DioInstance.instance()
        .post(path: "/user/login", queryParameters: {"username": name, "password": pwd});
    return UserInfoModel.fromJson(response.data);
  }

  ///注册
  Future<UserInfoModel?> register(String? name, String? pwd, String? pwdTwice) async {
    Response response = await DioInstance.instance().post(
        path: "user/register",
        queryParameters: {"username": name, "password": pwd, "repassword": pwdTwice});
    return UserInfoModel.fromJson(response.data);
  }

  ///登出
  Future<bool> logout() async {
    Response response = await DioInstance.instance().get(path: "user/logout/json");
    if (response.data != null && response.data == true) {
      return true;
    }
    return false;
  }

  ///收藏
  Future<bool> collect(String id) async {
    Response response = await DioInstance.instance().post(path: "lg/collect/$id/json");
    if (response.data != null && response.data == true) {
      return true;
    }
    return false;
  }

  ///取消收藏文章
  Future<bool> cancelCollect(String id) async {
    Response response = await DioInstance.instance().post(path: "lg/uncollect_originId/$id/json");
    if (response.data != null && response.data == true) {
      return true;
    }
    return false;
  }

  ///获取我的收藏列表
  Future<List<MyCollectItemModel>?> getMyCollects(String pageCount) async {
    Response rsp = await DioInstance.instance().get(path: "lg/collect/list/$pageCount/json");
    MyCollectsModel? model = MyCollectsModel.fromJson(rsp.data);
    if (model.datas != null && model.datas?.isNotEmpty == true) {
      return model.datas;
    }
    return [];
  }

  ///搜索
  Future<List<SearchListItemModel>?> search({required String keyWord}) async {
    Response rsp = await DioInstance.instance()
        .post(path: "article/query/0/json", queryParameters: {"k": keyWord});
    SearchListModel? model = SearchListModel.fromJson(rsp.data);
    if (model.datas != null && model.datas?.isNotEmpty == true) {
      return model.datas;
    }
    return [];
  }

  ///检查app新版本
  Future<AppCheckUpdateModel?> checkUpdate() async {
    DioInstance.instance().changeBaseUrl("https://www.pgyer.com/");
    Response response = await DioInstance.instance().post(
        path: "apiv2/app/check",
        queryParameters: {
          "_api_key": "57c543d258a34f8565748561de50b6e6",
          "appKey": "2639f784ce9ee850532074b7b0534e62"
        });

    DioInstance.instance().changeBaseUrl("https://www.wanandroid.com/");

    return AppCheckUpdateModel.fromJson(response.data);
  }
}

/// data : [{"desc":"我们支持订阅啦~","id":30,"imagePath":"https://www.wanandroid.com/blogimgs/42da12d8-de56-4439-b40c-eab66c227a4b.png","isVisible":1,"order":2,"title":"我们支持订阅啦~","type":0,"url":"https://www.wanandroid.com/blog/show/3352"},{"desc":"","id":6,"imagePath":"https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png","isVisible":1,"order":1,"title":"我们新增了一个常用导航Tab~","type":1,"url":"https://www.wanandroid.com/navi"},{"desc":"一起来做个App吧","id":10,"imagePath":"https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png","isVisible":1,"order":1,"title":"一起来做个App吧","type":1,"url":"https://www.wanandroid.com/blog/show/2"}]
/// errorCode : 0
/// errorMsg : ""

class HomeBannerData {
  HomeBannerData({
      this.data, 
      this.errorCode, 
      this.errorMsg,});

  HomeBannerData.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BannerData.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }
  List<BannerData>? data;
  num? errorCode;
  String? errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['errorCode'] = errorCode;
    map['errorMsg'] = errorMsg;
    return map;
  }

}

/// desc : "我们支持订阅啦~"
/// id : 30
/// imagePath : "https://www.wanandroid.com/blogimgs/42da12d8-de56-4439-b40c-eab66c227a4b.png"
/// isVisible : 1
/// order : 2
/// title : "我们支持订阅啦~"
/// type : 0
/// url : "https://www.wanandroid.com/blog/show/3352"

class BannerData {
  BannerData({
      this.desc, 
      this.id, 
      this.imagePath, 
      this.isVisible, 
      this.order, 
      this.title, 
      this.type, 
      this.url,});

  BannerData.fromJson(dynamic json) {
    desc = json['desc'];
    id = json['id'];
    imagePath = json['imagePath'];
    isVisible = json['isVisible'];
    order = json['order'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }
  String? desc;
  num? id;
  String? imagePath;
  num? isVisible;
  num? order;
  String? title;
  num? type;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['desc'] = desc;
    map['id'] = id;
    map['imagePath'] = imagePath;
    map['isVisible'] = isVisible;
    map['order'] = order;
    map['title'] = title;
    map['type'] = type;
    map['url'] = url;
    return map;
  }

}
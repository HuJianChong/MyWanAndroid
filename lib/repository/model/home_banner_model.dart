/// desc : "我们支持订阅啦~"
/// id : 30
/// imagePath : "https://www.wanandroid.com/blogimgs/42da12d8-de56-4439-b40c-eab66c227a4b.png"
/// isVisible : 1
/// order : 2
/// title : "我们支持订阅啦~"
/// type : 0
/// url : "https://www.wanandroid.com/blog/show/3352"

///首页返回的banner数据
class HomeBannerListModel {
  List<HomeBannerModel?>? bannerList = [];

  HomeBannerListModel({this.bannerList});

  HomeBannerListModel.fromJson(dynamic json) {
    if (json != null && json is List) {
      json.forEach((jsonObj) {
        bannerList?.add(HomeBannerModel.fromJson(jsonObj));
      });
    }
  }
}

class HomeBannerModel {
  HomeBannerModel({
    this.desc,
    this.id,
    this.imagePath,
    this.isVisible,
    this.order,
    this.title,
    this.type,
    this.url,
  });

  HomeBannerModel.fromJson(dynamic json) {
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

///我的收藏列表
class MyCollectsModel {
  MyCollectsModel({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  MyCollectsModel.fromJson(Map<String, dynamic>? json) {
    curPage = json?['curPage'];
    if (json?['datas'] != null && json?['datas'] is List) {
      datas = [];
      json?['datas'].forEach((v) {
        datas?.add(MyCollectItemModel.fromJson(v));
      });
    }
    offset = json?['offset'];
    over = json?['over'];
    pageCount = json?['pageCount'];
    size = json?['size'];
    total = json?['total'];
  }

  num? curPage;
  List<MyCollectItemModel>? datas;
  num? offset;
  bool? over;
  num? pageCount;
  num? size;
  num? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['curPage'] = curPage;
    if (datas != null) {
      map['datas'] = datas?.map((v) => v.toJson()).toList();
    }
    map['offset'] = offset;
    map['over'] = over;
    map['pageCount'] = pageCount;
    map['size'] = size;
    map['total'] = total;
    return map;
  }
}

/// author : "郭霖"
/// chapterId : 409
/// chapterName : "郭霖"
/// courseId : 13
/// desc : ""
/// envelopePic : ""
/// id : 327419
/// link : "https://mp.weixin.qq.com/s/QtFgc_SBw4go9sPrewvxiQ"
/// niceDate : "2024-03-31 14:10"
/// origin : ""
/// originId : 28209
/// publishTime : 1711865435000
/// title : "Room和Flow最佳实践"
/// userId : 159938
/// visible : 0
/// zan : 0

class MyCollectItemModel {
  MyCollectItemModel({
    this.author,
    this.chapterId,
    this.chapterName,
    this.courseId,
    this.desc,
    this.envelopePic,
    this.id,
    this.link,
    this.niceDate,
    this.origin,
    this.originId,
    this.publishTime,
    this.title,
    this.userId,
    this.visible,
    this.zan,
  });

  MyCollectItemModel.fromJson(Map<String, dynamic>? json) {
    author = json?['author'];
    chapterId = json?['chapterId'];
    chapterName = json?['chapterName'];
    courseId = json?['courseId'];
    desc = json?['desc'];
    envelopePic = json?['envelopePic'];
    id = json?['id'];
    link = json?['link'];
    niceDate = json?['niceDate'];
    origin = json?['origin'];
    originId = json?['originId'];
    publishTime = json?['publishTime'];
    title = json?['title'];
    userId = json?['userId'];
    visible = json?['visible'];
    zan = json?['zan'];
  }

  String? author;
  num? chapterId;
  String? chapterName;
  num? courseId;
  String? desc;
  String? envelopePic;
  num? id;
  String? link;
  String? niceDate;
  String? origin;
  num? originId;
  num? publishTime;
  String? title;
  num? userId;
  num? visible;
  num? zan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = author;
    map['chapterId'] = chapterId;
    map['chapterName'] = chapterName;
    map['courseId'] = courseId;
    map['desc'] = desc;
    map['envelopePic'] = envelopePic;
    map['id'] = id;
    map['link'] = link;
    map['niceDate'] = niceDate;
    map['origin'] = origin;
    map['originId'] = originId;
    map['publishTime'] = publishTime;
    map['title'] = title;
    map['userId'] = userId;
    map['visible'] = visible;
    map['zan'] = zan;
    return map;
  }
}

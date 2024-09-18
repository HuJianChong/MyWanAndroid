import '../../http/base_model.dart';

// class HomeListModel {
//   HomeListModel({
//     this.data,
//     this.errorCode,
//     this.errorMsg,
//   });
//
//   HomeListModel.fromJson(dynamic json) {
//     data = json['data'] != null ? HomeListData.fromJson(json['data']) : null;
//     errorCode = json['errorCode'];
//     errorMsg = json['errorMsg'];
//   }
//
//   HomeListData? data;
//   num? errorCode;
//   String? errorMsg;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (data != null) {
//       map['data'] = data?.toJson();
//     }
//     map['errorCode'] = errorCode;
//     map['errorMsg'] = errorMsg;
//     return map;
//   }
// }

class HomeListModel {
  HomeListModel({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  HomeListModel.fromJson(Map<String, dynamic>? json) {
    curPage = json?['curPage'];
    if (json?['datas'] != null) {
      datas = [];
      json?['datas'].forEach((v) {
        datas?.add(HomeListItemData.fromJson(v));
      });
    }
    offset = json?['offset'];
    over = json?['over'];
    pageCount = json?['pageCount'];
    size = json?['size'];
    total = json?['total'];
  }

  num? curPage;
  List<HomeListItemData>? datas;
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

///置顶列表返回数据
class HomeTopListModel {
  List<HomeListItemData>? dataList = [];

  HomeTopListModel.fromJson(dynamic json) {
    if (json is List) {
      for (var element in json) {
        dataList?.add(HomeListItemData.fromJson(element));
      }
    }
  }
}

class HomeListItemData {
  HomeListItemData({
    this.adminAdd,
    this.apkLink,
    this.audit,
    this.author,
    this.canEdit,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.descMd,
    this.envelopePic,
    this.fresh,
    this.host,
    this.id,
    this.isAdminAdd,
    this.link,
    this.niceDate,
    this.niceShareDate,
    this.origin,
    this.prefix,
    this.projectLink,
    this.publishTime,
    this.realSuperChapterId,
    this.selfVisible,
    this.shareDate,
    this.shareUser,
    this.superChapterId,
    this.superChapterName,
    this.tags,
    this.title,
    //0=普通 1=置顶
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  HomeListItemData.fromJson(Map<String, dynamic>? json) {
    adminAdd = json?['adminAdd'];
    apkLink = json?['apkLink'];
    audit = json?['audit'];
    author = json?['author'];
    canEdit = json?['canEdit'];
    chapterId = json?['chapterId'];
    chapterName = json?['chapterName'];
    collect = json?['collect'];
    courseId = json?['courseId'];
    desc = json?['desc'];
    descMd = json?['descMd'];
    envelopePic = json?['envelopePic'];
    fresh = json?['fresh'];
    host = json?['host'];
    id = json?['id'];
    isAdminAdd = json?['isAdminAdd'];
    link = json?['link'];
    niceDate = json?['niceDate'];
    niceShareDate = json?['niceShareDate'];
    origin = json?['origin'];
    prefix = json?['prefix'];
    projectLink = json?['projectLink'];
    publishTime = json?['publishTime'];
    realSuperChapterId = json?['realSuperChapterId'];
    selfVisible = json?['selfVisible'];
    shareDate = json?['shareDate'];
    shareUser = json?['shareUser'];
    superChapterId = json?['superChapterId'];
    superChapterName = json?['superChapterName'];
    if (json?['tags'] != null) {
      tags = [];
      json?['tags'].forEach((v) {
        tags?.add(v);
      });
    }
    title = json?['title'];
    type = json?['type'];
    userId = json?['userId'];
    visible = json?['visible'];
    zan = json?['zan'];
  }

  bool? adminAdd;
  String? apkLink;
  num? audit;
  String? author;
  bool? canEdit;
  num? chapterId;
  String? chapterName;
  bool? collect;
  num? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  num? id;
  bool? isAdminAdd;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  num? publishTime;
  num? realSuperChapterId;
  num? selfVisible;
  num? shareDate;
  String? shareUser;
  num? superChapterId;
  String? superChapterName;
  List<dynamic>? tags;
  String? title;
  num? type;
  num? userId;
  num? visible;
  num? zan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adminAdd'] = adminAdd;
    map['apkLink'] = apkLink;
    map['audit'] = audit;
    map['author'] = author;
    map['canEdit'] = canEdit;
    map['chapterId'] = chapterId;
    map['chapterName'] = chapterName;
    map['collect'] = collect;
    map['courseId'] = courseId;
    map['desc'] = desc;
    map['descMd'] = descMd;
    map['envelopePic'] = envelopePic;
    map['fresh'] = fresh;
    map['host'] = host;
    map['id'] = id;
    map['isAdminAdd'] = isAdminAdd;
    map['link'] = link;
    map['niceDate'] = niceDate;
    map['niceShareDate'] = niceShareDate;
    map['origin'] = origin;
    map['prefix'] = prefix;
    map['projectLink'] = projectLink;
    map['publishTime'] = publishTime;
    map['realSuperChapterId'] = realSuperChapterId;
    map['selfVisible'] = selfVisible;
    map['shareDate'] = shareDate;
    map['shareUser'] = shareUser;
    map['superChapterId'] = superChapterId;
    map['superChapterName'] = superChapterName;
    if (tags != null) {
      map['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    map['title'] = title;
    map['type'] = type;
    map['userId'] = userId;
    map['visible'] = visible;
    map['zan'] = zan;
    return map;
  }
}

import 'dart:collection';

///知识体系明细列表数据
class KnowledgeDetailListModel {
  KnowledgeDetailListModel({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  KnowledgeDetailListModel.fromJson(Map<String, dynamic>? json) {
    curPage = json?['curPage'];
    if (json?['datas'] != null && json?['datas'] is List) {
      datas = [];
      json?['datas'].forEach((v) {
        datas?.add(KnowledgeDetailItem.fromJson(v));
      });
    }
    offset = json?['offset'];
    over = json?['over'];
    pageCount = json?['pageCount'];
    size = json?['size'];
    total = json?['total'];
  }

  num? curPage;
  List<KnowledgeDetailItem>? datas;
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

/// adminAdd : false
/// apkLink : ""
/// audit : 1
/// author : ""
/// canEdit : false
/// chapterId : 60
/// chapterName : "Android Studio相关"
/// collect : false
/// courseId : 13
/// desc : ""
/// descMd : ""
/// envelopePic : ""
/// fresh : false
/// host : ""
/// id : 12871
/// isAdminAdd : false
/// link : "https://juejin.im/post/5e94815551882573af79b2a0"
/// niceDate : "2020-04-14 00:05"
/// niceShareDate : "2020-04-13 23:58"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1586793921000
/// realSuperChapterId : 150
/// selfVisible : 0
/// shareDate : 1586793515000
/// shareUser : "鸿洋"
/// superChapterId : 60
/// superChapterName : "开发环境"
/// tags : []
/// title : "数据库还可以这么看？（Android Studio 4.1 新特性）"
/// type : 0
/// userId : 2
/// visible : 1
/// zan : 0

class KnowledgeDetailItem {
  KnowledgeDetailItem({
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
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  KnowledgeDetailItem.fromJson(Map<String, dynamic>? json) {
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

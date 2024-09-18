class SearchListModel {
  SearchListModel({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  SearchListModel.fromJson(Map<String, dynamic>? json) {
    curPage = json?['curPage'];
    if (json?['datas'] != null && json?['datas'] is List) {
      datas = [];
      json?['datas'].forEach((v) {
        datas?.add(SearchListItemModel.fromJson(v));
      });
    }
    offset = json?['offset'];
    over = json?['over'];
    pageCount = json?['pageCount'];
    size = json?['size'];
    total = json?['total'];
  }

  num? curPage;
  List<SearchListItemModel>? datas;
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
/// author : "xiaoyang"
/// canEdit : false
/// chapterId : 440
/// chapterName : "官方"
/// collect : false
/// courseId : 13
/// desc : "<p>欢迎推荐，大家觉得不错的教程。</p>\r\n<p>我们会安排专门的同学去审核版权是否允许转载，以及联合合作，在通过版权审核后，会以更快速度上线。</p>\r\n<p>非常感谢共建本站内容。</p>"
/// descMd : ""
/// envelopePic : ""
/// fresh : false
/// host : ""
/// id : 21826
/// isAdminAdd : false
/// link : "https://www.wanandroid.com/wenda/show/21826"
/// niceDate : "2022-03-20 15:38"
/// niceShareDate : "2022-03-20 15:38"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1647761883000
/// realSuperChapterId : 439
/// selfVisible : 0
/// shareDate : 1647761883000
/// shareUser : ""
/// superChapterId : 440
/// superChapterName : "问答"
/// tags : [{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}]
/// title : "【教程推荐】欢迎推荐，大家觉得不错的教程"
/// type : 2
/// userId : 2
/// visible : 1
/// zan : 0

class SearchListItemModel {
  SearchListItemModel({
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

  SearchListItemModel.fromJson(Map<String, dynamic>? json) {
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
        tags?.add(Tags.fromJson(v));
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
  List<Tags>? tags;
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

/// name : "本站发布"
/// url : "/article/list/0?cid=440"

class Tags {
  Tags({
    this.name,
    this.url,
  });

  Tags.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    url = json?['url'];
  }

  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }
}

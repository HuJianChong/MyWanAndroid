/// articleList : []
/// author : ""
/// children : [{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":60,"lisense":"","lisenseLink":"","name":"Android Studio相关","order":1000,"parentChapterId":150,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":169,"lisense":"","lisenseLink":"","name":"gradle","order":1001,"parentChapterId":150,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":269,"lisense":"","lisenseLink":"","name":"官方发布","order":1002,"parentChapterId":150,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":529,"lisense":"","lisenseLink":"","name":"90-120hz","order":1003,"parentChapterId":150,"type":0,"userControlSetTop":false,"visible":1}]
/// courseId : 13
/// cover : ""
/// desc : ""
/// id : 150
/// lisense : ""
/// lisenseLink : ""
/// name : "开发环境"
/// order : 1
/// parentChapterId : 0
/// type : 0
/// userControlSetTop : false
/// visible : 1

class KnowledgeListModel {
  List<KnowledgeModel?> list = [];

  KnowledgeListModel(this.list);

  KnowledgeListModel.fromJson(dynamic json) {
    if (json is List) {
      for (var element in json) {
        list.add(KnowledgeModel.fromJson(element));
      }
    }
  }
}

class KnowledgeModel {
  KnowledgeModel({
    this.articleList,
    this.author,
    this.children,
    this.courseId,
    this.cover,
    this.desc,
    this.id,
    this.lisense,
    this.lisenseLink,
    this.name,
    this.order,
    this.parentChapterId,
    this.type,
    this.userControlSetTop,
    this.visible,
  });

  KnowledgeModel.fromJson(dynamic json) {
    if (json['articleList'] != null) {
      articleList = [];
      json['articleList'].forEach((v) {
        articleList?.add(v);
      });
    }
    author = json['author'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children?.add(Children.fromJson(v));
      });
    }
    courseId = json['courseId'];
    cover = json['cover'];
    desc = json['desc'];
    id = json['id'];
    lisense = json['lisense'];
    lisenseLink = json['lisenseLink'];
    name = json['name'];
    order = json['order'];
    parentChapterId = json['parentChapterId'];
    type = json['type'];
    userControlSetTop = json['userControlSetTop'];
    visible = json['visible'];
  }

  List<dynamic>? articleList;
  String? author;
  List<Children>? children;
  num? courseId;
  String? cover;
  String? desc;
  num? id;
  String? lisense;
  String? lisenseLink;
  String? name;
  num? order;
  num? parentChapterId;
  num? type;
  bool? userControlSetTop;
  num? visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (articleList != null) {
      map['articleList'] = articleList?.map((v) => v.toJson()).toList();
    }
    map['author'] = author;
    if (children != null) {
      map['children'] = children?.map((v) => v.toJson()).toList();
    }
    map['courseId'] = courseId;
    map['cover'] = cover;
    map['desc'] = desc;
    map['id'] = id;
    map['lisense'] = lisense;
    map['lisenseLink'] = lisenseLink;
    map['name'] = name;
    map['order'] = order;
    map['parentChapterId'] = parentChapterId;
    map['type'] = type;
    map['userControlSetTop'] = userControlSetTop;
    map['visible'] = visible;
    return map;
  }
}

/// articleList : []
/// author : ""
/// children : []
/// courseId : 13
/// cover : ""
/// desc : ""
/// id : 60
/// lisense : ""
/// lisenseLink : ""
/// name : "Android Studio相关"
/// order : 1000
/// parentChapterId : 150
/// type : 0
/// userControlSetTop : false
/// visible : 1

class Children {
  Children({
    this.articleList,
    this.author,
    this.children,
    this.courseId,
    this.cover,
    this.desc,
    this.id,
    this.lisense,
    this.lisenseLink,
    this.name,
    this.order,
    this.parentChapterId,
    this.type,
    this.userControlSetTop,
    this.visible,
  });

  Children.fromJson(dynamic json) {
    if (json['articleList'] != null) {
      articleList = [];
      json['articleList'].forEach((v) {
        articleList?.add(v);
      });
    }
    author = json['author'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children?.add(v);
      });
    }
    courseId = json['courseId'];
    cover = json['cover'];
    desc = json['desc'];
    id = json['id'];
    lisense = json['lisense'];
    lisenseLink = json['lisenseLink'];
    name = json['name'];
    order = json['order'];
    parentChapterId = json['parentChapterId'];
    type = json['type'];
    userControlSetTop = json['userControlSetTop'];
    visible = json['visible'];
  }

  List<dynamic>? articleList;
  String? author;
  List<dynamic>? children;
  num? courseId;
  String? cover;
  String? desc;
  num? id;
  String? lisense;
  String? lisenseLink;
  String? name;
  num? order;
  num? parentChapterId;
  num? type;
  bool? userControlSetTop;
  num? visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (articleList != null) {
      map['articleList'] = articleList?.map((v) => v.toJson()).toList();
    }
    map['author'] = author;
    if (children != null) {
      map['children'] = children?.map((v) => v.toJson()).toList();
    }
    map['courseId'] = courseId;
    map['cover'] = cover;
    map['desc'] = desc;
    map['id'] = id;
    map['lisense'] = lisense;
    map['lisenseLink'] = lisenseLink;
    map['name'] = name;
    map['order'] = order;
    map['parentChapterId'] = parentChapterId;
    map['type'] = type;
    map['userControlSetTop'] = userControlSetTop;
    map['visible'] = visible;
    return map;
  }
}

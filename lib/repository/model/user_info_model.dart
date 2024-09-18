/// admin : false
/// chapterTops : []
/// coinCount : 75
/// collectIds : [27996,28256,26624,28266,28250,28249,28260]
/// email : ""
/// icon : ""
/// id : 160102
/// nickname : "woaichikaorou"
/// password : ""
/// publicName : "woaichikaorou"
/// token : ""
/// type : 0
/// username : "woaichikaorou"

///用户数据返回
class UserInfoModel {
  UserInfoModel({
    this.admin,
    this.chapterTops,
    this.coinCount,
    this.collectIds,
    this.email,
    this.icon,
    this.id,
    this.nickname,
    this.password,
    this.publicName,
    this.token,
    this.type,
    this.username,
  });

  UserInfoModel.fromJson(Map<String, dynamic>? json) {
    admin = json?['admin'];
    if (json?['chapterTops'] != null) {
      chapterTops = [];
      json?['chapterTops'].forEach((v) {
        chapterTops?.add(v);
      });
    }
    coinCount = json?['coinCount'];

    if (json?['collectIds'] is List) {
      collectIds = [];
      json?['collectIds'].forEach((v) {
        collectIds?.add(v);
      });
    }
    email = json?['email'];
    icon = json?['icon'];
    id = json?['id'];
    nickname = json?['nickname'];
    password = json?['password'];
    publicName = json?['publicName'];
    token = json?['token'];
    type = json?['type'];
    username = json?['username'];
  }

  bool? admin;
  List<dynamic>? chapterTops;
  num? coinCount;
  List<num?>? collectIds;
  String? email;
  String? icon;
  num? id;
  String? nickname;
  String? password;
  String? publicName;
  String? token;
  num? type;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['admin'] = admin;
    if (chapterTops != null) {
      map['chapterTops'] = chapterTops?.map((v) => v.toJson()).toList();
    }
    map['coinCount'] = coinCount;
    map['collectIds'] = collectIds;
    map['email'] = email;
    map['icon'] = icon;
    map['id'] = id;
    map['nickname'] = nickname;
    map['password'] = password;
    map['publicName'] = publicName;
    map['token'] = token;
    map['type'] = type;
    map['username'] = username;
    return map;
  }
}

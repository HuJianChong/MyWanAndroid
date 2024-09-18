/// id : 6
/// link : ""
/// name : "面试"
/// order : 1
/// visible : 1
///搜索热词返回
class SearchHotKeyListModel {
  List<SearchHotKeyModel> list = [];

  SearchHotKeyListModel.fromJson(dynamic json) {
    if (json is List) {
      for (var element in json) {
        list.add(SearchHotKeyModel.fromJson(element));
      }
    }
  }
}

class SearchHotKeyModel {
  SearchHotKeyModel({
    this.id,
    this.link,
    this.name,
    this.order,
    this.visible,
  });

  SearchHotKeyModel.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    link = json?['link'];
    name = json?['name'];
    order = json?['order'];
    visible = json?['visible'];
  }

  num? id;
  String? link;
  String? name;
  num? order;
  num? visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['link'] = link;
    map['name'] = name;
    map['order'] = order;
    map['visible'] = visible;
    return map;
  }
}

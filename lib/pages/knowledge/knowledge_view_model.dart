import 'package:flutter/widgets.dart';
import 'package:my_wan_android/common_ui/loading.dart';
import 'package:my_wan_android/repository/api/wan_api.dart';
import 'package:my_wan_android/repository/model/knowledge_detail_param.dart';

import '../../repository/model/knowledge_list_model.dart';

class KnowledgeViewModel with ChangeNotifier {
  List<KnowledgeModel?>? list = [];

  Future getKnowledgeList() async {
    Loading.showLoading();
    var resp = await WanApi.instance().knowledgeList();
    if (resp?.isNotEmpty == true) {
      list = resp;
      notifyListeners();
    }
    Loading.dismissAll();
  }

  String generalChildNames(List<Children?>? children) {
    var names = StringBuffer();
    children?.forEach((element) {
      names.write("${element?.name}  ");
    });
    return names.toString();
  }

  List<KnowledgeDetailParam> generalParams(List<Children?>? children) {
    List<KnowledgeDetailParam> params = [];

    children?.forEach((element) {
      KnowledgeDetailParam param = KnowledgeDetailParam(element?.name, "${element?.id}");
      params.add(param);
    });
    return params;
  }
}

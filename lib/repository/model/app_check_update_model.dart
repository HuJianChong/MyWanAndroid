/// code : 0
/// message : ""
/// data : {"buildBuildVersion":"7","forceUpdateVersion":"","forceUpdateVersionNo":"","needForceUpdate":false,"downloadURL":"https://www.pgyer.com/app/installUpdate/a13612a93812c0d4cfa3da5f50c9284b?sig=brAFJYcCf6R2gleDIKXxTGMt35R5wNKPcMcimnx2R1P6jBvfbnYk3FcIR51RF%2F7P&forceHttps=","buildHaveNewVersion":false,"buildVersionNo":"7","buildVersion":"1.0.7","buildDescription":"","buildUpdateDescription":"","appURl":"https://www.pgyer.com/a13612a93812c0d4cfa3da5f50c9284b","appKey":"2639f784ce9ee850532074b7b0534e62","buildKey":"a13612a93812c0d4cfa3da5f50c9284b","buildName":"Android资讯","buildIcon":"https://cdn-app-icon.pgyer.com/a/5/c/8/4/a5c84809a0096a2b96efc81e6d0af63f?x-oss-process=image/resize,m_lfit,h_120,w_120/format,jpg","buildFileKey":"556e82d16b9f1718d76a48a98b40eff2.apk","buildFileSize":"16977009"}

class AppCheckUpdateModel {
  AppCheckUpdateModel({
    this.code,
    this.message,
    this.data,
  });

  AppCheckUpdateModel.fromJson(Map<String, dynamic>? json) {
    code = json?['code'];
    message = json?['message'];
    data = json?['data'] != null ? UpdateInfoData.fromJson(json?['data']) : null;
  }

  num? code;
  String? message;
  UpdateInfoData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// buildBuildVersion : "7"
/// forceUpdateVersion : ""
/// forceUpdateVersionNo : ""
/// needForceUpdate : false
/// downloadURL : "https://www.pgyer.com/app/installUpdate/a13612a93812c0d4cfa3da5f50c9284b?sig=brAFJYcCf6R2gleDIKXxTGMt35R5wNKPcMcimnx2R1P6jBvfbnYk3FcIR51RF%2F7P&forceHttps="
/// buildHaveNewVersion : false
/// buildVersionNo : "7"
/// buildVersion : "1.0.7"
/// buildDescription : ""
/// buildUpdateDescription : ""
/// appURl : "https://www.pgyer.com/a13612a93812c0d4cfa3da5f50c9284b"
/// appKey : "2639f784ce9ee850532074b7b0534e62"
/// buildKey : "a13612a93812c0d4cfa3da5f50c9284b"
/// buildName : "Android资讯"
/// buildIcon : "https://cdn-app-icon.pgyer.com/a/5/c/8/4/a5c84809a0096a2b96efc81e6d0af63f?x-oss-process=image/resize,m_lfit,h_120,w_120/format,jpg"
/// buildFileKey : "556e82d16b9f1718d76a48a98b40eff2.apk"
/// buildFileSize : "16977009"

class UpdateInfoData {
  UpdateInfoData({
    this.buildBuildVersion,
    this.forceUpdateVersion,
    this.forceUpdateVersionNo,
    this.needForceUpdate,
    this.downloadURL,
    this.buildHaveNewVersion,
    this.buildVersionNo,
    this.buildVersion,
    this.buildDescription,
    this.buildUpdateDescription,
    this.appURl,
    this.appKey,
    this.buildKey,
    this.buildName,
    this.buildIcon,
    this.buildFileKey,
    this.buildFileSize,
  });

  UpdateInfoData.fromJson(Map<String, dynamic>? json) {
    buildBuildVersion = json?['buildBuildVersion'];
    forceUpdateVersion = json?['forceUpdateVersion'];
    forceUpdateVersionNo = json?['forceUpdateVersionNo'];
    needForceUpdate = json?['needForceUpdate'];
    downloadURL = json?['downloadURL'];
    buildHaveNewVersion = json?['buildHaveNewVersion'];
    buildVersionNo = json?['buildVersionNo'];
    buildVersion = json?['buildVersion'];
    buildDescription = json?['buildDescription'];
    buildUpdateDescription = json?['buildUpdateDescription'];
    appURl = json?['appURl'];
    appKey = json?['appKey'];
    buildKey = json?['buildKey'];
    buildName = json?['buildName'];
    buildIcon = json?['buildIcon'];
    buildFileKey = json?['buildFileKey'];
    buildFileSize = json?['buildFileSize'];
  }

  String? buildBuildVersion;
  String? forceUpdateVersion;
  String? forceUpdateVersionNo;
  bool? needForceUpdate;

  //app的下载链接
  String? downloadURL;
  bool? buildHaveNewVersion;

  //最新的线上app版本号
  String? buildVersionNo;
  String? buildVersion;
  String? buildDescription;
  String? buildUpdateDescription;
  String? appURl;
  String? appKey;
  String? buildKey;
  String? buildName;
  String? buildIcon;
  String? buildFileKey;
  String? buildFileSize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['buildBuildVersion'] = buildBuildVersion;
    map['forceUpdateVersion'] = forceUpdateVersion;
    map['forceUpdateVersionNo'] = forceUpdateVersionNo;
    map['needForceUpdate'] = needForceUpdate;
    map['downloadURL'] = downloadURL;
    map['buildHaveNewVersion'] = buildHaveNewVersion;
    map['buildVersionNo'] = buildVersionNo;
    map['buildVersion'] = buildVersion;
    map['buildDescription'] = buildDescription;
    map['buildUpdateDescription'] = buildUpdateDescription;
    map['appURl'] = appURl;
    map['appKey'] = appKey;
    map['buildKey'] = buildKey;
    map['buildName'] = buildName;
    map['buildIcon'] = buildIcon;
    map['buildFileKey'] = buildFileKey;
    map['buildFileSize'] = buildFileSize;
    return map;
  }
}

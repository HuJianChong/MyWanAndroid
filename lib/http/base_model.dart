class BaseModel<T> {
  T? data;
  int? errorCode;
  String? errorMsg;

  BaseModel.fromJson(dynamic json) {
    data = json['data'];
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }
}

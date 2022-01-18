class ApiResponseModel {
  late var message;
  late bool status;
  late var entity;

  ApiResponseModel(
      {required this.message, required this.status, required this.entity});

  ApiResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['entity'] is List<dynamic>) {
      Map newEntity = {"data": json['entity']};
      entity = newEntity;
    } else {
      if (json['entity'] == null) {
        entity = {};
      } else {
        entity = json['entity'];
      }
    }

    if (json['status']) {
      message = json['message'];
      status = json['status'];
    } else {
      if (json['errorType'] == "validation") {
        message = json['message'][0];
      } else {
        message = json['message'];
      }
      status = json['status'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['entity'] = entity;
    return data;
  }
}

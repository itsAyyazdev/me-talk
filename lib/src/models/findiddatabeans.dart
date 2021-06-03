class FindIDResponse {
  FindIDData data;
  String message;
  int statusCode;

  FindIDResponse({this.data, this.message, this.statusCode});

  FindIDResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new FindIDData.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class FindIDData {
  String scalar;
  String email;
  String name;

  FindIDData({this.scalar, this.email, this.name});

  FindIDData.fromJson(Map<String, dynamic> json) {
    scalar = json['scalar'];
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scalar'] = this.scalar;
    data['email'] = this.email;
    data['name'] = this.name;
    return data;
  }
}

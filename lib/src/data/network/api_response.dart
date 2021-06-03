class ApiResponse {
  bool status;
  String message;
  dynamic data;
  dynamic otherData;
  int statusCode;
  int requestStatus;

  ApiResponse(
      this.status, this.message, this.data, this.otherData, this.statusCode, this.requestStatus);

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
    otherData = json['other_data'];
    statusCode = json['status_code'];
    requestStatus = json['request_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['status'] = this.status;
    map['message'] = this.message;
    map['data'] = this.data;
    map['other_data'] = otherData;
    map['status_code'] = statusCode;
    map['request_status'] = requestStatus;
    return data;
  }
}

class BusinessList {
  List<BusinessListData> data;
  Null otherData;
  String message;
  int statusCode;

  BusinessList({this.data, this.otherData, this.message, this.statusCode});

  BusinessList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<BusinessListData>();
      json['data'].forEach((v) {
        data.add(new BusinessListData.fromJson(v));
      });
    }
    otherData = json['other_data'];
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['other_data'] = this.otherData;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class BusinessListData {
  int catId;
  String catName;
  List<Subcat> subcat;

  BusinessListData({this.catId, this.catName, this.subcat});

  BusinessListData.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
    if (json['subcat'] != null) {
      subcat = new List<Subcat>();
      json['subcat'].forEach((v) {
        subcat.add(new Subcat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    if (this.subcat != null) {
      data['subcat'] = this.subcat.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcat {
  int subId;
  String subName;
  String icon;
  int order;

  Subcat({this.subId, this.subName, this.icon, this.order});

  Subcat.fromJson(Map<String, dynamic> json) {
    subId = json['sub_id'];
    subName = json['sub_name'];
    icon = json['icon'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_id'] = this.subId;
    data['sub_name'] = this.subName;
    data['icon'] = this.icon;
    data['order'] = this.order;
    return data;
  }
}

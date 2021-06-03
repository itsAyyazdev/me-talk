
class ShopCategoryResponse {
  List<ShopCategoryData> data;
  String message;
  int statusCode;

  ShopCategoryResponse({this.data, this.message, this.statusCode});

  ShopCategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<ShopCategoryData>();
      json['data'].forEach((v) {
        data.add(new ShopCategoryData.fromJson(v));
      });
    }
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class ShopCategoryData {
  int categoryId;
  String categoryName;
  int id;
  String name;
  String icon;
  int order;

  ShopCategoryData(
      {this.categoryId,
        this.categoryName,
        this.id,
        this.name,
        this.icon,
        this.order});

  ShopCategoryData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['order'] = this.order;
    return data;
  }
}

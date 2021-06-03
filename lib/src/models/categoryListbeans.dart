class CategoryListResponses {
  CategoryListData data;
  String message;
  int statusCode;

  CategoryListResponses({this.data, this.message, this.statusCode});

  CategoryListResponses.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new CategoryListData.fromJson(json['data']) : null;
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

class CategoryListData {
  List<Category> category;

  CategoryListData({this.category});

  CategoryListData.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = new List<Category>();
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int id;
  int categoryTypeId;
  String type;
  int parentId;
  String name;
  String logo;
  int statusId;
  String createdAt;
  String updatedAt;
  String deletedAt;
  List<Children> children;
  String categoryTypeName;
  String statusName;

  Category(
      {this.id,
        this.categoryTypeId,
        this.type,
        this.parentId,
        this.name,
        this.logo,
        this.statusId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.children,
        this.categoryTypeName,
        this.statusName});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryTypeId = json['category_type_id'];
    type = json['type'];
    parentId = json['parent_id'];
    name = json['name'];
    logo = json['logo'];
    statusId = json['status_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['children'] != null) {
      children = new List<Children>();
      json['children'].forEach((v) {
        children.add(new Children.fromJson(v));
      });
    }
    categoryTypeName = json['category_type_name'];
    statusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_type_id'] = this.categoryTypeId;
    data['type'] = this.type;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['status_id'] = this.statusId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    data['category_type_name'] = this.categoryTypeName;
    data['status_name'] = this.statusName;
    return data;
  }
}

class Children {
  int id;
  int categoryTypeId;
  String name;
  String logo;
  int statusId;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String categoryTypeName;
  String statusName;

  Children(
      {this.id,
        this.categoryTypeId,
        this.name,
        this.logo,
        this.statusId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.categoryTypeName,
        this.statusName});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryTypeId = json['category_type_id'];
    name = json['name'];
    logo = json['logo'];
    statusId = json['status_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    categoryTypeName = json['category_type_name'];
    statusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_type_id'] = this.categoryTypeId;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['status_id'] = this.statusId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['category_type_name'] = this.categoryTypeName;
    data['status_name'] = this.statusName;
    return data;
  }
}



class SearchCommunityRequest{

  int reviewTypeId;
  String searchKeyword;

  SearchCommunityRequest(this.reviewTypeId, this.searchKeyword);

  SearchCommunityRequest.fromJson(Map<String, dynamic> json) {
    reviewTypeId = json['review_type_id'];
    searchKeyword = json['search_keyword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_type_id'] = this.reviewTypeId;
    data['search_keyword'] = this.searchKeyword;
    return data;
  }

}
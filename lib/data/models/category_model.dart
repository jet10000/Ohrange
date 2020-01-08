class CategoryResult {
  List<CategoryModel> category;

  CategoryResult({this.category});

  CategoryResult.fromJson(Map<String, dynamic> json) {
    if (json['Category'] != null) {
      category = new List<CategoryModel>();
      json['Category'].forEach((v) {
        category.add(new CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['Category'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryModel {
  int categoryId;
  String image;
  String catName;
  String catSlug;
  int catSorting;
  int createdBy;
  String status;
  String createdAt;
  String upadtedAt;
  int subCount;
  int productCount;
  String imagePath;
  int total;

  CategoryModel(
      {this.categoryId,
      this.image,
      this.catName,
      this.catSlug,
      this.catSorting,
      this.createdBy,
      this.status,
      this.createdAt,
      this.upadtedAt,
      this.subCount,
      this.productCount,
      this.imagePath,
      this.total});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    image = json['image'];
    catName = json['cat_name'];
    catSlug = json['cat_slug'];
    catSorting = json['cat_sorting'];
    createdBy = json['created_by'];
    status = json['status'];
    createdAt = json['created_at'];
    upadtedAt = json['upadted_at'];
    subCount = json['sub_count'];
    productCount = json['product_count'];
    imagePath = json['Image_path'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['cat_name'] = this.catName;
    data['cat_slug'] = this.catSlug;
    data['cat_sorting'] = this.catSorting;
    data['created_by'] = this.createdBy;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['upadted_at'] = this.upadtedAt;
    data['sub_count'] = this.subCount;
    data['product_count'] = this.productCount;
    data['Image_path'] = this.imagePath;
    data['total'] = this.total;
    return data;
  }
}
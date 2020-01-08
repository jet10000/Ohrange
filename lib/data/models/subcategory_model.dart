class SubCategoryResult {
  List<SubCategoryModel> subCategoryByCatID;

  SubCategoryResult({this.subCategoryByCatID});

  SubCategoryResult.fromJson(Map<String, dynamic> json) {
    if (json['SubCategoryByCatID'] != null) {
      subCategoryByCatID = new List<SubCategoryModel>();
      json['SubCategoryByCatID'].forEach((v) {
        subCategoryByCatID.add(new SubCategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subCategoryByCatID != null) {
      data['SubCategoryByCatID'] =
          this.subCategoryByCatID.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategoryModel {
  int subCategoryId;
  int catId;
  String image;
  String subCatName;
  String subSlug;
  int sorting;
  int createdBy;
  String status;
  String createdAt;
  String updatedAt;
  String imagePath;

  SubCategoryModel(
      {this.subCategoryId,
      this.catId,
      this.image,
      this.subCatName,
      this.subSlug,
      this.sorting,
      this.createdBy,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.imagePath});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    catId = json['cat_id'];
    image = json['image'];
    subCatName = json['sub_cat_name'];
    subSlug = json['sub_slug'];
    sorting = json['sorting'];
    createdBy = json['created_by'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['Image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_id'] = this.subCategoryId;
    data['cat_id'] = this.catId;
    data['image'] = this.image;
    data['sub_cat_name'] = this.subCatName;
    data['sub_slug'] = this.subSlug;
    data['sorting'] = this.sorting;
    data['created_by'] = this.createdBy;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['Image_path'] = this.imagePath;
    return data;
  }
}
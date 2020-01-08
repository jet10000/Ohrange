class ProductsResult {
  List<ProductsModel> products;
  ProductsResult({this.products});

  ProductsResult.fromJson(Map<String, dynamic> json) {
    if (json['Products'] != null) {
      products = new List<ProductsModel>();
      json['Products'].forEach((v) {
        products.add(new ProductsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['Products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsModel {
  int productsId;
  String image;
  String productName;
  String productDesc;
  String highLights;
  String tags;
  String seoTitle;
  String seoTag;
  String seoDesc;
  String slug;
  int catIdFk;
  int subCatIdFk;
  String bestOffers;
  String topSelling;
  String featured;
  String latestProducts;
  int availability;
  int sellerId;
  int createdBy;
  String pStatus;
  String createdAt;
  String updatedAt;
  String rating;
  int overall;
  String catName;
  String subCatName;
  int countof;
  String imagePath;
  String id;
  List<Prices> prices;

  ProductsModel(
      {this.productsId,
      this.image,
      this.productName,
      this.productDesc,
      this.highLights,
      this.tags,
      this.seoTitle,
      this.seoTag,
      this.seoDesc,
      this.slug,
      this.catIdFk,
      this.subCatIdFk,
      this.bestOffers,
      this.topSelling,
      this.featured,
      this.latestProducts,
      this.availability,
      this.sellerId,
      this.createdBy,
      this.pStatus,
      this.createdAt,
      this.updatedAt,
      this.rating,
      this.overall,
      this.catName,
      this.subCatName,
      this.countof,
      this.imagePath,
      this.id,
      this.prices});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    productsId = json['products_id'];
    image = json['image'];
    productName = json['product_name'];
    productDesc = json['product_desc'];
    highLights = json['high_lights'];
    tags = json['tags'];
    seoTitle = json['seo_title'];
    seoTag = json['seo_tag'];
    seoDesc = json['seo_desc'];
    slug = json['slug'];
    catIdFk = json['cat_id_fk'];
    subCatIdFk = json['sub_cat_id_fk'];
    bestOffers = json['best_offers'];
    topSelling = json['top_selling'];
    featured = json['featured'];
    latestProducts = json['latest_products'];
    availability = json['availability'];
    sellerId = json['seller_id'];
    createdBy = json['created_by'];
    pStatus = json['p_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rating = json['rating'];
    overall = json['overall'];
    catName = json['cat_name'];
    subCatName = json['sub_cat_name'];
    countof = json['Countof'];
    imagePath = json['Image_path'];
    id = json['id'];
    if (json['Prices'] != null) {
      prices = new List<Prices>();
      json['Prices'].forEach((v) {
        prices.add(new Prices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['products_id'] = this.productsId;
    data['image'] = this.image;
    data['product_name'] = this.productName;
    data['product_desc'] = this.productDesc;
    data['high_lights'] = this.highLights;
    data['tags'] = this.tags;
    data['seo_title'] = this.seoTitle;
    data['seo_tag'] = this.seoTag;
    data['seo_desc'] = this.seoDesc;
    data['slug'] = this.slug;
    data['cat_id_fk'] = this.catIdFk;
    data['sub_cat_id_fk'] = this.subCatIdFk;
    data['best_offers'] = this.bestOffers;
    data['top_selling'] = this.topSelling;
    data['featured'] = this.featured;
    data['latest_products'] = this.latestProducts;
    data['availability'] = this.availability;
    data['seller_id'] = this.sellerId;
    data['created_by'] = this.createdBy;
    data['p_status'] = this.pStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['rating'] = this.rating;
    data['overall'] = this.overall;
    data['cat_name'] = this.catName;
    data['sub_cat_name'] = this.subCatName;
    data['Countof'] = this.countof;
    data['Image_path'] = this.imagePath;
    data['id'] = this.id;
    if (this.prices != null) {
      data['Prices'] = this.prices.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Prices {
  int packSizeId;
  int productId;
  String quantity;
  int price;
  int salePrice;

  Prices(
      {this.packSizeId,
      this.productId,
      this.quantity,
      this.price,
      this.salePrice});

  Prices.fromJson(Map<String, dynamic> json) {
    packSizeId = json['pack_size_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    price = json['price'];
    salePrice = json['sale_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pack_size_id'] = this.packSizeId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['sale_price'] = this.salePrice;
    return data;
  }
}

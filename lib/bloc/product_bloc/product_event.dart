import 'package:meta/meta.dart';
abstract class ProductEvent {}

class FetchAllProductEvent extends ProductEvent {}

class FetchProductsBySubCategorySlugEvent extends ProductEvent {
  String slug;
  FetchProductsBySubCategorySlugEvent({@required this.slug}) : assert(slug!=null);
}

class GetLatestProductsEvent extends ProductEvent {
  String type;
  GetLatestProductsEvent({@required this.type}) : assert(type!=null);
}

class GetTopSellingProductsEvent extends ProductEvent {
  String type;
  GetTopSellingProductsEvent({@required this.type}) : assert(type!=null);
}
class GetBestofferProductsEvent extends ProductEvent {
  String type;
  GetBestofferProductsEvent({@required this.type}) : assert(type!=null);
}

class GetFeaturedProductsEvent extends ProductEvent {
  String type;
  GetFeaturedProductsEvent({@required this.type}) : assert(type!=null);
}

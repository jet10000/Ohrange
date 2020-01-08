import 'package:ohrange_bloc/data/models/product_model.dart';
import 'package:ohrange_bloc/data/services/product_services.dart';
import 'dart:convert';
class ProductsRepository {
  ProductsApiProvider _ProductsApiProvider = ProductsApiProvider();

  Future<List<ProductsModel>> getAllProducts() => _ProductsApiProvider.getAllProducts();

  Future<List<ProductsModel>> getProductsBySubCategorySlug(String slug) => _ProductsApiProvider.getProductsBySubCategorySlug(slug);

  Future<List<ProductsModel>> getLatestProducts(String type) => _ProductsApiProvider.GetSpecialProducts(type);

  Future<List<ProductsModel>> getTopSellingProducts(String type) => _ProductsApiProvider.GetSpecialProducts(type);

  Future<List<ProductsModel>> getBestOffersProducts(String type) => _ProductsApiProvider.GetSpecialProducts(type);

  Future<List<ProductsModel>> getFeaturedProducts(String type) => _ProductsApiProvider.GetSpecialProducts(type);




}

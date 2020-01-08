import 'package:ohrange_bloc/data/models/category_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ohrange_bloc/data/models/category_model.dart';
import 'package:ohrange_bloc/data/services/category_services.dart';

class CategoryRepository {
  CategoryApiProvider _categoryApiProvider = CategoryApiProvider();
  
  Future<List<CategoryModel>> getCategory() => _categoryApiProvider.getCategory();
}

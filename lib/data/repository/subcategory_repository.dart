import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ohrange_bloc/data/models/subcategory_model.dart';
import 'package:ohrange_bloc/data/services/subcategory_services.dart';

class SubCategoryRepository {
  SubCategoryApiProvider _sub_categoryApiProvider = SubCategoryApiProvider();
  
  Future<List<SubCategoryModel>> getSubCategoryByID(String id)  => _sub_categoryApiProvider.getSubCategoryByID(id);
}

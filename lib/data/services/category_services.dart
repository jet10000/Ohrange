import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ohrange_bloc/config/constant.dart';
import 'package:ohrange_bloc/data/models/category_model.dart';

class CategoryApiProvider{

  Future<List<CategoryModel>> getCategory() async {
    try {
   final response = await http.post(
        ApiConstants.API_BASE_URL,
        body: {'srv': ApiSrv.CATEGOTY_SRV, 'method': ApiMethods.GET_CATEGOEY},
        headers: {"Accept": "application/json"}
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return CategoryResult.fromJson(data).category;
    } else {
      throw Exception();
    }
  }catch (exception) {
      print(exception);
      if(exception.toString().contains('SocketException')) {
        return null;
      } else {
        return null;
      }
   }
  }
  
}
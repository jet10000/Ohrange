import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ohrange_bloc/config/constant.dart';
import 'package:ohrange_bloc/data/models/subcategory_model.dart';

class SubCategoryApiProvider{

  Future<List<SubCategoryModel>> getSubCategoryByID(String id) async {
    try {
   final response = await http.post(
        ApiConstants.API_BASE_URL,
        body: {'srv':ApiSrv.SUBCATEGORY_SRV, 'method': ApiMethods.GET_SUBCATEGORY,'action':'','cat_id_fk':id.toString()},
        headers: {"Accept": "application/json"}
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return SubCategoryResult.fromJson(data).subCategoryByCatID;
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
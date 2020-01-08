import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ohrange_bloc/config/constant.dart';
import 'package:ohrange_bloc/data/models/product_model.dart';


class ProductsApiProvider{

  Future<List<ProductsModel>> getAllProducts() async {
    try {
   final response = await http.post(
        ApiConstants.API_BASE_URL,
        body: {'srv': ApiSrv.PRODUCTS_SRV, 'method': ApiMethods.GET_PRODUCTS},
        headers: {"Accept": "application/json"}
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // print(data);
      return ProductsResult.fromJson(data).products;
    } else {
      throw HttpException("Error Occurred While Fetching Data");
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
  Future<List<ProductsModel>> getProductsBySubCategorySlug(String slug) async {
    try {
   final response = await http.post(
        ApiConstants.API_BASE_URL,
        body: {'srv': ApiSrv.PRODUCTS_SRV, 'method': ApiMethods.GET_PRODUCTS,'sub':slug},
        headers: {"Accept": "application/json"}
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // print(data);
      if(data.toString() =='No Data'){
        // print(data);
        return data;
      }else{
      return ProductsResult.fromJson(data).products;
      }
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

  Future<List<ProductsModel>> GetSpecialProducts(String type) async {
    try {
   final response = await http.post(
        ApiConstants.API_BASE_URL,
        body: {'srv': ApiSrv.PRODUCTS_SRV, 'method': ApiMethods.GET_SPECIAL_LIST,'select_type':type.toString(),'mobile':
        ''},
        headers: {"Accept": "application/json"}
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // print(data);
      if(data.toString() =='No Data'){
        // print(data);
        return data;
      }else{
      return ProductsResult.fromJson(data).products;
      }
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


  // List<ProductsModel> parseResponse(http.Response response) {
  //   final responseString = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     return ProductsResult.fromJson(responseString).products;
  //   } else {
  //     throw Exception('failed to load players');
  //   }
  // }


  
}
// import 'package:meta/meta.dart';
// import 'package:bloc/bloc.dart';
// import 'package:ohrange_bloc/bloc/product_bloc/product_event.dart';
// import 'package:ohrange_bloc/bloc/product_bloc/product_state.dart';
// import 'package:ohrange_bloc/data/models/product_model.dart';
// import 'package:ohrange_bloc/data/repository/product_repository.dart';
// import 'package:rxdart/subjects.dart';

// class SpecailProductsBloc {
//   final _productrepository = ProductsRepository();
//   final _topProductsFetcher = PublishSubject<List<ProductsModel>>();

//   Stream<List<ProductsModel>> get GetTopSellingProducts =>  _topProductsFetcher.stream;
  
//   fetchTopSellingProducts(String type) async {
//     final List<ProductsModel> data = await _productrepository.getTopSellingProducts(type);
//     _topProductsFetcher.sink.add(data);
//   }
// dispose() {
//     _topProductsFetcher.close();
//   }
// }

// final bloc = SpecailProductsBloc();


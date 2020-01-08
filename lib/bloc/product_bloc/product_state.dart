import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ohrange_bloc/data/models/product_model.dart';
abstract class ProductState extends Equatable {}

class ProductInitialState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadedState extends ProductState {

  final List<ProductsModel> products;

  ProductLoadedState({@required this.products}) : assert (products!= null);

  @override
  List<Object> get props => [products];
}

class ProductErrorState extends ProductState {

  String message;

  ProductErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
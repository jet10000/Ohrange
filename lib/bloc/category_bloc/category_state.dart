import 'package:equatable/equatable.dart';
import 'package:ohrange_bloc/data/models/category_model.dart';
import 'package:meta/meta.dart';
abstract class CategoryState extends Equatable {}

class CategoryInitialState extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadedState extends CategoryState {

  final List<CategoryModel> catgeory;

  CategoryLoadedState({@required this.catgeory}) : assert (catgeory!= null);

  @override
  List<Object> get props => [catgeory];
}

class CategoryErrorState extends CategoryState {

  String message;

  CategoryErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
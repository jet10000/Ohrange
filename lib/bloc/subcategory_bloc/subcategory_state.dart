import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ohrange_bloc/data/models/subcategory_model.dart';
abstract class SubCategoryState extends Equatable {}

class SubCategoryInitialState extends SubCategoryState {
  @override
  List<Object> get props => [];
}

class SubCategoryLoadingState extends SubCategoryState {
  @override
  List<Object> get props => [];
}

class SubCategoryLoadedState extends SubCategoryState {

  final List<SubCategoryModel> subcatgeory;

  SubCategoryLoadedState({@required this.subcatgeory}) : assert (subcatgeory!= null);

  @override
  List<Object> get props => [subcatgeory];
}

class SubCategoryErrorState extends SubCategoryState {

  String message;

 SubCategoryErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
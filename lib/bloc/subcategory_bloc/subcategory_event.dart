
import 'package:flutter/foundation.dart';

abstract class SubCategoryEvent {}

class FetchSubCategoryEvent extends SubCategoryEvent {
   String id;
  FetchSubCategoryEvent({@required this.id}) : assert(id!=null);
}

import 'package:meta/meta.dart';
import 'package:ohrange_bloc/bloc/subcategory_bloc/subcategory_event.dart';
import 'package:ohrange_bloc/bloc/subcategory_bloc/subcategory_state.dart';
import 'package:ohrange_bloc/data/models/subcategory_model.dart';
import 'package:bloc/bloc.dart';
import 'package:ohrange_bloc/data/repository/subcategory_repository.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent,SubCategoryState>{

  SubCategoryRepository subCategoryRepository ;
  SubCategoryBloc({@required this.subCategoryRepository}) : assert (subCategoryRepository != null);

  @override
  SubCategoryState get initialState => SubCategoryInitialState();

  @override
  Stream<SubCategoryState> mapEventToState(SubCategoryEvent event) async* {
    if(event is FetchSubCategoryEvent){
      yield SubCategoryLoadingState();
      try{
        final List<SubCategoryModel> data = await subCategoryRepository.getSubCategoryByID(event.id.toString());
        yield SubCategoryLoadedState(subcatgeory: data);
      }catch(e){
        yield SubCategoryErrorState(message: e.toString());
      }       
    }
  }

}
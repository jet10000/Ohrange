import 'package:ohrange_bloc/bloc/category_bloc/category_event.dart';
import 'package:ohrange_bloc/bloc/category_bloc/category_state.dart';
import 'package:bloc/bloc.dart';
import 'package:ohrange_bloc/data/models/category_model.dart';
import 'package:ohrange_bloc/data/repository/category_repository.dart';
import 'package:meta/meta.dart';
class CategoryBloc extends Bloc<CategoryEvent,CategoryState>{

  CategoryRepository categoryRepository ;
  CategoryBloc({@required this.categoryRepository}) : assert (categoryRepository != null);

  @override
  CategoryState get initialState => CategoryInitialState();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if(event is FetchCategoryEvent){
      yield CategoryLoadingState();
      try{
        final List<CategoryModel> data = await categoryRepository.getCategory();
        yield CategoryLoadedState(catgeory: data);
      }catch(e){
        yield CategoryErrorState(message: e.toString());
      }       
    }
  }

}
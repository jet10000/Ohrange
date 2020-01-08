import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:ohrange_bloc/bloc/product_bloc/product_event.dart';
import 'package:ohrange_bloc/bloc/product_bloc/product_state.dart';
import 'package:ohrange_bloc/data/models/product_model.dart';
import 'package:ohrange_bloc/data/repository/product_repository.dart';
class ProductBloc extends Bloc<ProductEvent,ProductState>{

  ProductsRepository productRepository ;
  
  ProductBloc({@required this.productRepository}) : assert (productRepository != null);

  @override
  ProductState get initialState => ProductInitialState();
  // LatestProductState get initialState =>
  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if(event is FetchAllProductEvent){
      yield ProductLoadingState();
      try{
        final List<ProductsModel> data = await productRepository.getAllProducts();
        yield ProductLoadedState(products: data);
      }catch(e){
        yield ProductErrorState(message: e.toString());
      }       
    }else if(event is FetchProductsBySubCategorySlugEvent){
       yield ProductLoadingState();
      try{
        final List<ProductsModel> data = await productRepository.getProductsBySubCategorySlug(event.slug);
        yield ProductLoadedState(products: data);
      }catch(e){
        yield ProductErrorState(message: e.toString());
      }       
    }else if(event is GetTopSellingProductsEvent){
       yield ProductLoadingState();
      try{
        final List<ProductsModel> data = await productRepository.getTopSellingProducts(event.type);
        yield ProductLoadedState(products: data);
      }catch(e){
        yield ProductErrorState(message: e.toString());
      }       
    }else if(event is GetLatestProductsEvent){
       yield ProductLoadingState();
      try{
        final List<ProductsModel> data = await productRepository.getLatestProducts(event.type);
        yield ProductLoadedState(products: data);
      }catch(e){
        yield ProductErrorState(message: e.toString());
      }       
    }else if(event is GetFeaturedProductsEvent){
       yield ProductLoadingState();
      try{
        final List<ProductsModel> data = await productRepository.getFeaturedProducts(event.type);
        yield ProductLoadedState(products: data);
      }catch(e){
        yield ProductErrorState(message: e.toString());
      }       
    }else if(event is GetBestofferProductsEvent){
       yield ProductLoadingState();
      try{
        final List<ProductsModel> data = await productRepository.getBestOffersProducts(event.type);
        yield ProductLoadedState(products: data);
      }catch(e){
        yield ProductErrorState(message: e.toString());
      }       
    }
  }
  // @override
  // Stream<ProductState> mapEventToState(ProductEvent event) async* {
  //   if (event is FetchAllProductEvent) {
  //     yield* _mapLoadProductsToState();
  //   } else if (event is FetchProductsBySubCategorySlugEvent) {
  //     yield* _mapProductsBySubCategoryToState(event);
  //   } else if (event is GetTopSellingProductsEvent) {
  //     yield* _mapTopSellingProductsToState(event);
  //   } else if (event is GetLatestProductsEvent) {
  //     yield* _mapLatestProductsToState(event);
  //   } else if (event is GetFeaturedProductsEvent) {
  //     yield* _mapFeaturedProductsToState(event);
  //   } else if (event is GetBestofferProductsEvent) {
  //     yield* _mapBestofferProductsToState(event);
  //   }
  // }

  // Stream<ProductState> _mapLoadProductsToState() async* {
  //   try {
  //      final List<ProductsModel> data = await productRepository.getAllProducts();
  //       yield ProductLoadedState(products: data);
  //   } catch (_) {
  //     yield ProductLoadingState();
  //   }
  // }

  // Stream<ProductState> _mapProductsBySubCategoryToState(event) async* {
  //   try {
  //       final List<ProductsModel> data = await productRepository.getProductsBySubCategorySlug(event.slug);
  //       yield ProductLoadedState(products: data);
  //   } catch (_) {
  //     yield ProductLoadingState();
  //   }
  // }
  // Stream<ProductState> _mapTopSellingProductsToState(event) async* {
  //   try {
  //       final List<ProductsModel> data = await productRepository.getTopSellingProducts(event.type);
  //       yield ProductLoadedState(products: data);
  //   } catch (_) {
  //     yield ProductLoadingState();
  //   }
  // }
  // Stream<ProductState> _mapLatestProductsToState(event) async* {
  //   try {
  //        final List<ProductsModel> data = await productRepository.getLatestProducts(event.type);
  //       yield ProductLoadedState(products: data);
  //   } catch (_) {
  //     yield ProductLoadingState();
  //   }
  // }
  // Stream<ProductState> _mapFeaturedProductsToState(event) async* {
  //   try {
  //       final List<ProductsModel> data = await productRepository.getFeaturedProducts(event.type);
  //       yield ProductLoadedState(products: data);
  //   } catch (_) {
  //     yield ProductLoadingState();
  //   }
  // }
  // Stream<ProductState> _mapBestofferProductsToState(event) async* {
  //   try {
  //       final List<ProductsModel> data = await productRepository.getBestOffersProducts(event.type);
  //       yield ProductLoadedState(products: data);
  //   } catch (_) {
  //     yield ProductLoadingState();
  //   }
  // }


}
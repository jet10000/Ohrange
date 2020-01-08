import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohrange_bloc/bloc/category_bloc/category_bloc.dart';
import 'package:ohrange_bloc/bloc/category_bloc/category_event.dart';
import 'package:ohrange_bloc/bloc/category_bloc/category_state.dart';
import 'package:ohrange_bloc/bloc/product_bloc/product_bloc.dart';
import 'package:ohrange_bloc/bloc/product_bloc/product_event.dart';
import 'package:ohrange_bloc/bloc/product_bloc/product_state.dart';
import 'package:ohrange_bloc/bloc/product_bloc/special_product_bloc.dart';
import 'package:ohrange_bloc/data/models/product_model.dart';
import 'package:ohrange_bloc/ui/widgets/categorysliderwidget.dart';
import 'package:ohrange_bloc/ui/widgets/circularloadingwidget.dart';
import 'package:ohrange_bloc/ui/widgets/item.dart';
import 'package:ohrange_bloc/ui/widgets/searchbarwidget.dart';
import 'package:ohrange_bloc/ui/widgets/topsellingproductwidget.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  CategoryBloc _categoryBloc;
  ProductBloc _productBloc;

  @override
  void initState() {
    final _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    _categoryBloc.add(FetchCategoryEvent());
     _productBloc = BlocProvider.of<ProductBloc>(context);
    // print(_categoryBloc.add(FetchCategoryEvent()));
    _productBloc.add(GetLatestProductsEvent(type: "latest_products"));
    // _productBloc.add(GetTopSellingProductsEvent(type: "top_selling"));
    // _productBloc.add(GetBestofferProductsEvent(type: "best_offers"));
    // _productBloc.add(GetFeaturedProductsEvent(type: "featured"));

      super.initState();
  }
    @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    Widget _itemNew(String title) {
      return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle
                  ),
                  InkWell(
                    onTap: null,
                    child: Text("See More",maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.title),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: BlocListener(
                  bloc: _productBloc,
                listener: (context, state) {
                  print(state);
                },
                  child: BlocBuilder<ProductBloc,ProductState>(
                  bloc: _productBloc,
                  builder: (context,state){
                    print(state);
                    if(state is ProductInitialState){
                      return CircularLoadingWidget(height: 200,);
                    }else if(state is ProductLoadingState){
                      return CircularLoadingWidget(height: 200,);
                    }else if(state is ProductLoadedState){
                    return Container(
                      margin: EdgeInsets.only(right: 10.0, bottom: 15.0),
                      height: 300.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index)=> Item(state.products[index],context),
                        itemCount: state.products.length,
                      ),
                    );
                    }else if(state is ProductErrorState){
                      return CircularLoadingWidget(height: 500,);
                    }
                  }
                ),
              )
            )
          ],
        ),
      ),
    );
    }
  
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:PrepareCategory(),
           ),
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBarWidget(),
            ),
            _itemNew("Latest Products"),
            // _itemNew("Featured"),
          ],
        ),
      );
  }

   

  Widget PrepareCategory (){
    return BlocListener(
           bloc: _categoryBloc,
        listener: (context, state) {
          // print(state);
        },
     child: BlocBuilder<CategoryBloc,CategoryState>(
        builder: (context,state){
          if(state is CategoryInitialState){
            return CircularLoadingWidget(height: 100,);
          }else if(state is CategoryLoadingState){
            return CircularLoadingWidget(height: 100,);
          }else if(state is CategoryLoadedState){
            return CategoriesCarouselWidget(categories:state.catgeory);
          }else if(state is CategoryErrorState){
            return CircularLoadingWidget(height: 100,);
          }
        }
      ),
    );
  }
 }


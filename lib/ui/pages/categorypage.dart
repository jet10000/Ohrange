import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohrange_bloc/bloc/category_bloc/category_bloc.dart';
import 'package:ohrange_bloc/bloc/category_bloc/category_event.dart';
import 'package:ohrange_bloc/bloc/category_bloc/category_state.dart';
import 'package:ohrange_bloc/ui/widgets/circularloadingwidget.dart';
import 'package:ohrange_bloc/ui/widgets/drawerwidget.dart';
import 'package:ohrange_bloc/ui/widgets/preparecat.dart';
import 'package:ohrange_bloc/ui/widgets/shoppingcartbuttonwidget.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  CategoryBloc _categoryBloc ;
@override
  void initState() {
        _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    _categoryBloc.add(FetchCategoryEvent());
    super.initState();
  }
    @override
  void dispose() {
    super.dispose();
  }
  @override
  void didUpdateWidget(CategoryPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Category"
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).hintColor, labelColor: Theme.of(context).accentColor),
        ],
       ),
      body: PrepareSubCategory(),
    );
  }
  Widget PrepareSubCategory(){
    return BlocListener(
           bloc: _categoryBloc,
        listener: (context, state) {
        },
      child: BlocBuilder<CategoryBloc,CategoryState>(
        bloc: _categoryBloc,
        builder: (context,state){
          if(state is CategoryInitialState){
            return CircularLoadingWidget(height: 200,);
          }else if(state is CategoryLoadingState){
            return CircularLoadingWidget(height: 200,);
          }else if(state is CategoryLoadedState){
          return Preparecat(categories:state.catgeory);
          }else if(state is CategoryErrorState){
            return CircularLoadingWidget(height: 200,);
          }
        }
      ),
    );
  }
}
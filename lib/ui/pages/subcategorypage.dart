import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohrange_bloc/bloc/subcategory_bloc/subcategory_bloc.dart';
import 'package:ohrange_bloc/bloc/subcategory_bloc/subcategory_event.dart';
import 'package:ohrange_bloc/bloc/subcategory_bloc/subcategory_state.dart';
import 'package:ohrange_bloc/data/models/route_argument.dart';
import 'package:ohrange_bloc/data/models/subcategory_model.dart';
import 'package:ohrange_bloc/ui/widgets/circularloadingwidget.dart';
import 'package:ohrange_bloc/ui/widgets/drawerwidget.dart';
import 'package:ohrange_bloc/ui/widgets/preparesubcategory.dart';
import 'package:ohrange_bloc/ui/widgets/searchbarwidget.dart';
import 'package:ohrange_bloc/ui/widgets/shoppingcartbuttonwidget.dart';
import 'package:ohrange_bloc/ui/widgets/subcategorylist.dart';
class SubCategory extends StatefulWidget {
  final RouteArgument routeArgument;

  SubCategory({Key key, this.routeArgument}) : super(key: key);
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
    SubCategoryBloc _subCategoryBloc;

  @override
  void initState() {
    _subCategoryBloc = BlocProvider.of<SubCategoryBloc>(context);
    _subCategoryBloc.add(FetchSubCategoryEvent(id:widget.routeArgument.id));
    super.initState();
  }
    @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
//    _con.ca.isNotEmpty ? _con.foods[0].restaurant.name : '',
          "${widget.routeArgument.heroTag}"
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
           bloc: _subCategoryBloc,
        listener: (context, state) {
          // print(state);
        },
      child: BlocBuilder<SubCategoryBloc,SubCategoryState>(
          bloc: _subCategoryBloc,
          builder: (context,state){
            if(state is SubCategoryInitialState){
              return CircularLoadingWidget(height: 200,);
            }else if(state is SubCategoryLoadingState){
              return CircularLoadingWidget(height: 200,);
            }else if(state is SubCategoryLoadedState){
            return PrepareSub(subcategories:state.subcatgeory);
            }else if(state is SubCategoryErrorState){
              return CircularLoadingWidget(height: 200,);
            }
          }
      ),
    );
  }
}
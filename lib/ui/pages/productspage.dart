import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohrange_bloc/bloc/product_bloc/product_bloc.dart';
import 'package:ohrange_bloc/bloc/product_bloc/product_event.dart';
import 'package:ohrange_bloc/bloc/product_bloc/product_state.dart';
import 'package:ohrange_bloc/data/models/product_model.dart';
import 'package:ohrange_bloc/data/models/route_argument.dart';
import 'package:ohrange_bloc/ui/widgets/circularloadingwidget.dart';
import 'package:ohrange_bloc/ui/widgets/drawerwidget.dart';
import 'package:ohrange_bloc/ui/widgets/productgrid.dart';
import 'package:ohrange_bloc/ui/widgets/productlistitem.dart';
import 'package:ohrange_bloc/ui/widgets/searchbarwidget.dart';
import 'package:ohrange_bloc/ui/widgets/shoppingcartbuttonwidget.dart';

class ProductsPage extends StatefulWidget {
  final RouteArgument routeArgument;
  ProductsPage({Key key,this.routeArgument}) : super(key: key);
  @override
  _ProductsPageState createState() => _ProductsPageState();
}
class _ProductsPageState extends State<ProductsPage> {
  String layout = 'grid';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ProductBloc _productBloc ;
@override
  void initState() {
      _productBloc = BlocProvider.of<ProductBloc>(context);
      widget.routeArgument == null ?
      _productBloc.add(FetchAllProductEvent()) : _productBloc.add(FetchProductsBySubCategorySlugEvent(slug: widget.routeArgument.id.toString()));
    super.initState();
  }
    @override
  void dispose() {
    super.dispose();
  }
  @override
  void didUpdateWidget(ProductsPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    // print(widget.routeArgument);
    return widget.routeArgument == null ? Scaffold(
       drawer: DrawerWidget(),
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "All Products"
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).hintColor, labelColor: Theme.of(context).accentColor),
        ],
      ),

      body: Products(title: widget.routeArgument == null ? "All Products" : widget.routeArgument.heroTag)
    ) : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "${widget.routeArgument.heroTag}"
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).hintColor, labelColor: Theme.of(context).accentColor),
        ],
      ),
      body: Products(title: widget.routeArgument.heroTag),
    );
  }

  Widget Products({String title}){
    return BlocListener(
      bloc: _productBloc,
      listener: (context, state) {
      },
      child: BlocBuilder<ProductBloc,ProductState>(
        bloc: _productBloc,
        builder: (context,state){
          if(state is ProductInitialState){
            return CircularLoadingWidget(height: 200,);
          }else if(state is ProductLoadingState){
            return CircularLoadingWidget(height: 200,);
          }else if(state is ProductLoadedState){
          return PrepareProductLayout(context,state,title);
          }else if(state is ProductErrorState){
            return CircularLoadingWidget(height: 500,);
          }
        }
      ),
    );
  }
  Widget PrepareProductLayout(BuildContext context,state, String title){
    return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SearchBarWidget(),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  leading: Icon(
                    Icons.category,
                    color: Theme.of(context).hintColor,
                  ),
                  title: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.display1,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          setState(() {
                            this.layout = 'list';
                          });
                        },
                        icon: Icon(
                          Icons.format_list_bulleted,
                          color: this.layout == 'list' ? Theme.of(context).accentColor : Theme.of(context).focusColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            this.layout = 'grid';
                          });
                        },
                        icon: Icon(
                          Icons.apps,
                          color: this.layout == 'grid' ? Theme.of(context).accentColor : Theme.of(context).focusColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Offstage(
                offstage: this.layout != 'list',
                child: PrepareProductList(state.products)
              ),
                Offstage(
                offstage: this.layout != 'grid',
                child: PrepareGridView(state.products)
              )
      ],
    ));
  }
  Widget PrepareProductList(List<ProductsModel> productsmodel){
    return ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          itemCount: productsmodel.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            return ProductListItem(
              heroTag: 'Apple',
              productsModel: productsmodel.elementAt(index)
          );
          },
        );
  }
  Widget PrepareGridView(List<ProductsModel> productsmodel){
    return GridView.count(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      primary: false,
      crossAxisSpacing: 10,
      mainAxisSpacing: 20,
      padding: EdgeInsets.symmetric(horizontal: 20),
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(productsmodel.length, (index) {
        return ProductGrid(
          heroTag: 'favorites_grid',
          productsModel: productsmodel.elementAt(index),
        );
      }),
    );
  }
}

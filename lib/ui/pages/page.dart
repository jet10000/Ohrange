import 'package:flutter/material.dart';
import 'package:ohrange_bloc/ui/pages/cartpage.dart';
import 'package:ohrange_bloc/ui/pages/homepage.dart';
import 'package:ohrange_bloc/ui/pages/searchpage.dart';
import 'package:ohrange_bloc/ui/widgets/drawerwidget.dart';
import 'package:ohrange_bloc/ui/widgets/shoppingcartbuttonwidget.dart';
import 'favouritepage.dart';
import 'orderspage.dart';

class PagesTestWidget extends StatefulWidget {
  int currentTab;
  String currentTitle;
  Widget currentPage = HomePage();

  PagesTestWidget({
    Key key,
    this.currentTab,
  }) {
    currentTab = currentTab != null ? currentTab : 2;
  }

  @override
  _PagesTestWidgetState createState() {
    return _PagesTestWidgetState();
  }
}

class _PagesTestWidgetState extends State<PagesTestWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  initState() {
    super.initState();
    _selectTab(widget.currentTab);
  }

  @override
  void didUpdateWidget(PagesTestWidget oldWidget) {
    _selectTab(oldWidget.currentTab);
    super.didUpdateWidget(oldWidget);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      switch (tabItem) {
        case 0:
          widget.currentTitle = "Ohrange";
          widget.currentPage = HomePage();
          break;
        case 1:
          widget.currentTitle = "Search";
          widget.currentPage = SearchPage();
          break;
        case 2:
          widget.currentTitle = "Cart";
          widget.currentPage = CartPage();
          break;
        case 3:
          widget.currentTitle = "Orders";
          widget.currentPage = OrdersPage();
          break;
        case 4:
          widget.currentTitle = "Favourite";
          widget.currentPage = FavouritePage();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: DrawerWidget(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              widget.currentTitle ?? "Ohrange" ?? "Home",
              style: Theme.of(context).textTheme.title.merge(TextStyle(letterSpacing: 1.3)),
            ),
            actions: <Widget>[
              new ShoppingCartButtonWidget(
                  iconColor: Theme.of(context).hintColor, labelColor: Theme.of(context).accentColor),
            ],
          ),
          body: widget.currentPage,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).accentColor,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            iconSize: 22,
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedIconTheme: IconThemeData(size: 28),
            unselectedItemColor: Theme.of(context).focusColor.withOpacity(1),
            currentIndex: widget.currentTab,
            onTap: (int i) {
              this._selectTab(i);
            },
            // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: new Container(height: 0.0),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: new Container(height: 0.0),
              ),
              BottomNavigationBarItem(
                  title: new Container(height: 5.0),
                  icon: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).accentColor.withOpacity(0.4), blurRadius: 40, offset: Offset(0, 15)),
                        BoxShadow(
                            color: Theme.of(context).accentColor.withOpacity(0.4), blurRadius: 13, offset: Offset(0, 3))
                      ],
                    ),
                    child: new Icon(Icons.shopping_basket, color: Theme.of(context).primaryColor),
                  )),
              BottomNavigationBarItem(
                icon: new Icon(Icons.library_books),
                title: new Container(height: 0.0),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.favorite),
                title: new Container(height: 0.0),
              ),
            ],
          ),
        ),
      // ),
    );
  }
}

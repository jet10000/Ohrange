import 'package:flutter/material.dart';
import 'package:ohrange_bloc/ui/pages/categorypage.dart';
import 'package:ohrange_bloc/ui/pages/page.dart';
import 'package:ohrange_bloc/ui/pages/productspage.dart';
import 'package:ohrange_bloc/ui/pages/profilepage.dart';
import 'package:ohrange_bloc/ui/pages/subcategorypage.dart';

import 'data/models/route_argument.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
        case '/':
        return MaterialPageRoute(builder: (_) => PagesTestWidget(currentTab: 0));
        case '/Category':
        return MaterialPageRoute(builder: (_) => CategoryPage());
        case '/SubCategory':
        return MaterialPageRoute(builder: (_) => SubCategory(routeArgument: args as RouteArgument));
        case '/Products':
        return MaterialPageRoute(builder: (_) =>ProductsPage(routeArgument: args as RouteArgument));
        case '/Settings':
        return MaterialPageRoute(builder: (_) => ProfilePage());
         default:
        return MaterialPageRoute(builder: (_) => PagesTestWidget(currentTab: 0));
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohrange_bloc/bloc/category_bloc/category_bloc.dart';
import 'package:ohrange_bloc/bloc/product_bloc/special_product_bloc.dart';
import 'package:ohrange_bloc/bloc/subcategory_bloc/subcategory_bloc.dart';
import 'package:ohrange_bloc/data/repository/category_repository.dart';
import 'package:ohrange_bloc/data/repository/subcategory_repository.dart';
import 'package:ohrange_bloc/route_generator.dart';
import 'bloc/product_bloc/product_bloc.dart';
import 'config/app_config.dart' as config;
import 'data/repository/product_repository.dart';

void main(){
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
        data: (brightness) {
          if (brightness == Brightness.light) {
            return ThemeData(
              fontFamily: 'Poppins',
              primaryColor: Colors.white,
              brightness: brightness,
              accentColor: config.Colors().mainColor(1),
              focusColor: config.Colors().accentColor(1),
              hintColor: config.Colors().secondColor(1),
              textTheme: TextTheme(
                headline: TextStyle(fontSize: 20.0, color: config.Colors().secondColor(1)),
                display1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.Colors().secondColor(1)),
                display2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: config.Colors().secondColor(1)),
                display3: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: config.Colors().mainColor(1)),
                display4: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: config.Colors().secondColor(1)),
                subhead: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.Colors().secondColor(1)),
                title: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: config.Colors().mainColor(1)),
                body1: TextStyle(fontSize: 12.0, color: config.Colors().secondColor(1)),
                body2: TextStyle(fontSize: 14.0, color: config.Colors().secondColor(1)),
                caption: TextStyle(fontSize: 12.0, color: config.Colors().accentColor(1)),
              ),
            );
          } else {
            return ThemeData(
              fontFamily: 'Poppins',
              primaryColor: Color(0xFF252525),
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Color(0xFF2C2C2C),
              accentColor: config.Colors().mainDarkColor(1),
              hintColor: config.Colors().secondDarkColor(1),
              focusColor: config.Colors().accentDarkColor(1),
              textTheme: TextTheme(
                headline: TextStyle(fontSize: 20.0, color: config.Colors().secondDarkColor(1)),
                display1:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
                display2:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
                display3:
                    TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: config.Colors().mainDarkColor(1)),
                display4:
                    TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: config.Colors().secondDarkColor(1)),
                subhead:
                    TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.Colors().secondDarkColor(1)),
                title: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: config.Colors().mainDarkColor(1)),
                body1: TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(1)),
                body2: TextStyle(fontSize: 14.0, color: config.Colors().secondDarkColor(1)),
                caption: TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(0.6)),
              ),
            );
          }
        },
        themedWidgetBuilder: (context, theme) {
          return MultiBlocProvider(
          providers: [
            BlocProvider<CategoryBloc>(
              create: (BuildContext context) => CategoryBloc(categoryRepository: CategoryRepository()),
            ),
            BlocProvider<SubCategoryBloc>(
              create: (BuildContext context) => SubCategoryBloc(subCategoryRepository: SubCategoryRepository()),
            ),
            BlocProvider<ProductBloc>(
              create: (BuildContext context) => ProductBloc(productRepository: ProductsRepository()),
            ),
            // BlocProvider<SpecailProductsBloc>(
            //   create: (BuildContext context) => SpecailProductsBloc(),
            // ),
          ],
          
          child:MaterialApp(
                title: 'Ohrange',
                initialRoute: '/',
                onGenerateRoute: RouteGenerator.generateRoute,
                debugShowCheckedModeBanner: false,
                theme: theme,
          ),
           );
        });
  }
}
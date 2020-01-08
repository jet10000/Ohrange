import 'package:flutter/material.dart';
import 'package:ohrange_bloc/bloc/category_bloc/category_bloc.dart';
import 'package:ohrange_bloc/data/models/category_model.dart';

import 'CategoriesCarouselItemWidget.dart';
import 'circularloadingwidget.dart';


class CategoriesCarouselWidget extends StatelessWidget {
  
  List<CategoryModel> categories;

  CategoriesCarouselWidget({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
                  // print(categories.length);
    return this.categories.isEmpty
        ? CircularLoadingWidget(height: 150)
        : Container(
            height: 120,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              itemCount: this.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                double _marginLeft = 0;
                (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
                return new CategoriesCarouselItemWidget(
                  marginLeft: _marginLeft,
                  category: this.categories.elementAt(index),
                );
              },
            ));
  }
}

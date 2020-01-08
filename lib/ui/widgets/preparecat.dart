import 'package:flutter/material.dart';
import 'package:ohrange_bloc/data/models/category_model.dart';
import 'package:ohrange_bloc/ui/widgets/categorylist.dart';


class Preparecat extends StatelessWidget {
  List<CategoryModel> categories;
  // PrepareSub(List<SubCategoryModel> subcatgeory);
Preparecat({Key key, this.categories}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
                      color: Colors.white,
                      child: CustomScrollView(
                        slivers: <Widget>[
                       SliverPadding(
                      padding: EdgeInsets.only(top: 0.0),
                      sliver: SliverFixedExtentList(
                          itemExtent: 145.0,
                          delegate: SliverChildBuilderDelegate(
                            /// Calling itemCard Class for constructor card
                                  (context, index) => CategoryList(this.categories[index]),
                              childCount:categories.length)),
                       )
                     ],
            ),
          );
  }
}
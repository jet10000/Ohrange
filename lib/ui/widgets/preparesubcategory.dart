import 'package:flutter/material.dart';
import 'package:ohrange_bloc/data/models/subcategory_model.dart';
import 'package:ohrange_bloc/ui/widgets/subcategorylist.dart';

class PrepareSub extends StatelessWidget {
  List<SubCategoryModel> subcategories;
  // PrepareSub(List<SubCategoryModel> subcatgeory);
PrepareSub({Key key, this.subcategories}) : super(key: key);
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
                        (context, index) => SubCategoryList(this.subcategories[index]),
                    childCount: subcategories.length)),
              )
            ],
       ),
    );
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ohrange_bloc/data/models/category_model.dart';
import 'package:ohrange_bloc/data/models/route_argument.dart';

class CategoriesCarouselItemWidget extends StatelessWidget {
  double marginLeft;
  CategoryModel category;
  CategoriesCarouselItemWidget({Key key, this.marginLeft, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).pushNamed('/SubCategory', arguments: RouteArgument(id: category.categoryId.toString(),heroTag: category.catName.toString()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: category.catName,
            child: Container(
              margin: EdgeInsets.only(left: this.marginLeft, right: 10),
              width: 80,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.network(
                  category.imagePath.toString(),
                  // color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.only(left: this.marginLeft, right: 10),
            child: Text(
              category.catName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
          ),
        ],
      ),
    );
  }
}

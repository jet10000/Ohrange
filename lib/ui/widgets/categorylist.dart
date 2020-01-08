import 'package:flutter/material.dart';
import 'package:ohrange_bloc/data/models/category_model.dart';
import 'package:ohrange_bloc/data/models/route_argument.dart';


class CategoryList extends StatelessWidget {
  CategoryModel categories;
  CategoryList(this.categories);
  @override
  Widget build(BuildContext context) {
    return LoopData(context,categories);
  }

  Widget LoopData(BuildContext context,categories){
    return Padding(
      padding:
      const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
        Navigator.of(context).pushNamed('/SubCategory', arguments: RouteArgument(id: categories.categoryId.toString(),heroTag: categories.catName.toString()));
        },
        child: Container(
          height: 130.0,
          width: 400.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
        
            child: Material(
              child: DecoratedBox(
                decoration:
                BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage( categories.imagePath == 'null' ? "http://via.placeholder.com/350x150" : categories.imagePath.toString() ))),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.black12.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text(
                      categories.catName,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Berlin",
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:ohrange_bloc/data/models/route_argument.dart';
import 'package:ohrange_bloc/data/models/subcategory_model.dart';


class SubCategoryList extends StatelessWidget {
  /// Declaration and Get data from BrandDataList.dart
  SubCategoryModel subcategories;
  SubCategoryList(this.subcategories);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
        Navigator.of(context).pushNamed('/Products', arguments: RouteArgument(id: subcategories.subSlug.toString(),heroTag: subcategories.subCatName.toString()));
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
                        image: NetworkImage( subcategories.imagePath == 'null' ? "http://via.placeholder.com/350x150" : subcategories.imagePath.toString() ))),
//                decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                  image: DecorationImage(
//                      image:  image: NetworkImage("http://via.placeholder.com/350x150"),
//                  boxShadow: [
//                    BoxShadow(
//                      color: Color(0xFFABABAB).withOpacity(0.3),
//                      blurRadius: 1.0,
//                      spreadRadius: 2.0,
//                    ),
//                  ],
//                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.black12.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text(
                      subcategories.subCatName,
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


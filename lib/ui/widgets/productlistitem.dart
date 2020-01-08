import 'package:flutter/material.dart';
import 'package:ohrange_bloc/data/models/product_model.dart';


class ProductListItem extends StatelessWidget {
  String heroTag;
  ProductsModel productsModel;
  ProductListItem({Key key,this.heroTag,this.productsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var diff = productsModel.prices[0].price - productsModel.prices[0].salePrice;
    var percentage = (( diff / productsModel.prices[0].price  ) * 100).round();
  
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      focusColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColor,
      // onTap: () {
      //   Navigator.of(context).pushNamed('/Food', arguments: new RouteArgument(heroTag: this.heroTag, id: this.food.id));
      // },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.9),
          boxShadow: [
            BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 5, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: heroTag + productsModel.productName.toString(),
              child: Container(
                height: 130,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(image: NetworkImage(productsModel.imagePath.toString()), fit: BoxFit.contain),
                ),
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            productsModel.productName.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.subhead,
                          ),
                          SizedBox(height:5.0,),
                          Text(
                            // "Nill", 
                            productsModel.catName,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          SizedBox(height: 5.0,),
                          RichText(
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                text: TextSpan(
                                        text: "\u20B9",
                                        style: Theme.of(context).textTheme.subhead,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:  "${productsModel.prices[0].price} ", style: new TextStyle(
                                                    color: Colors.redAccent,
                                                    decoration: TextDecoration.lineThrough,
                                                  ),
                                          ),
                                          TextSpan(
                                            text: "${productsModel.prices[0].salePrice}", style: Theme.of(context).textTheme.subhead),
                                        ],
                                      )
                              ),
                              SizedBox(height: 5.0,),

                          Text(
                            percentage.toString() + "% OFF",
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: Theme.of(context).textTheme.overline,
                          ),
                          
                        //   SizedBox(
                        //   height: 25,
                        //   width: 40,
                        //   child: Chip(
                        //     padding: EdgeInsets.all(0),
                        //     label: Row(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: <Widget>[
                        //         Padding(
                        //           padding: const EdgeInsets.only(bottom:3.0),
                        //           child: Text( "${productsModel.overall}",
                        //               style: Theme.of(context)
                        //                   .textTheme
                        //                   .subtitle
                        //                   .merge(TextStyle(color: Theme.of(context).primaryColor))),
                        //         ),
                        //                 // SizedBox(height: 23,),
                        //         Icon(
                        //           Icons.star_border,
                        //           color: Theme.of(context).primaryColor,
                        //           size: 14
                        //         ),
                        //       ],
                        //     ),
                        //     backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
                        //     shape: StadiumBorder(),
                        //   ),
                        // ),
                          // Icon(Icons.star, size: 18, color: Color(0xFFFFB24D)),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(width:),
                  // Helper.getPrice(food.price, style: Theme.of(context).textTheme.display1),
                  
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: < Widget>[
                          Container(
                              margin: EdgeInsets.all(10),
                              width: 30,
                              height: 30,
                              child: FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                child: Tooltip(
                                  message: 'call icon',
                                    child: Icon(
                                    productsModel.availability.toString() =='0' ? Icons.strikethrough_s : Icons.add_shopping_cart,
                                    color: Theme.of(context).primaryColor,
                                    size: 18,
                                   ),
                                ),
                                // child: 
                                color: productsModel.availability.toString() =='0' ? Colors.redAccent :Theme.of(context).accentColor.withOpacity(0.9),
                                shape: StadiumBorder(),
                              ),
                              ) ,  
                                
                      ],)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

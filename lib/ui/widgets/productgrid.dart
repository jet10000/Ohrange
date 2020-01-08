import 'package:flutter/material.dart';
import 'package:ohrange_bloc/data/models/product_model.dart';

class ProductGrid extends StatelessWidget {
  final String heroTag;
  final ProductsModel productsModel;

  ProductGrid({Key key, this.heroTag,this.productsModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     var diff = productsModel.prices[0].price - productsModel.prices[0].salePrice;
    var percentage = (( diff / productsModel.prices[0].price  ) * 100).round();
  
    return InkWell(
      highlightColor: Colors.white70,
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      // onTap: () {
      //   Navigator.of(context).pushNamed('/Food', arguments: new RouteArgument(heroTag: this.heroTag, id: this.food.id));
      // },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Hero(
                    tag: heroTag + productsModel.productsId.toString(),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(productsModel.imagePath), fit: BoxFit.contain),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  productsModel.productName,
                  style: Theme.of(context).textTheme.body2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                Text(
                  productsModel.catName,
                  style: Theme.of(context).textTheme.caption,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                // SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
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
                    Text(
                      percentage.toString() + "% OFF",
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: Theme.of(context).textTheme.overline,
                    ),
                ],
                
                )
                
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: 30,
            height: 30,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              child: Icon(
                Icons.add_shopping_cart,
                color: Theme.of(context).primaryColor,
                size: 18,
              ),
              color: Theme.of(context).accentColor.withOpacity(0.9),
              shape: StadiumBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

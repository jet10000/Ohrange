import 'package:flutter/material.dart';
import 'package:ohrange_bloc/data/models/product_model.dart';

class Item extends StatelessWidget {
  ProductsModel item;

  Item(this.item, BuildContext context);


  @override
  Widget build(BuildContext context) {
    var diff = item.prices[0].price - item.prices[0].salePrice;
    var percentage = (( diff / item.prices[0].price  ) * 100).round();
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, left: 10.0, bottom: 10.0, right: 0.0),
      child: InkWell(
        onTap: (){

        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF656565).withOpacity(0.15),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                )
              ]),
          child: Wrap(
            children: <Widget>[
              Container(
                width: 160.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 185.0,
                      width: 160.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7.0),
                              topRight: Radius.circular(7.0)),
                          image: DecorationImage(
                              image: NetworkImage(item.imagePath.toString()), fit: BoxFit.contain)),
                    ),
                    Padding(padding: EdgeInsets.only(top: 7.0)),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        item.productName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        item.catName != null ? item.catName : '',
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                              text:  "${item.prices[0].price} ", style: new TextStyle(
                                                    color: Colors.redAccent,
                                                    decoration: TextDecoration.lineThrough,
                                                  ),
                                          ),
                                          TextSpan(
                                            text: "${item.prices[0].salePrice}", style: Theme.of(context).textTheme.subhead),
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
                    ],),
                   
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    //   child: Text(
                    //     item.prices[0].salePrice.toString(),
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 14.0),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       left: 15.0, right: 15.0, top: 5.0),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: <Widget>[
                    //       Row(
                    //         children: <Widget>[
                    //           Text(
                    //             item.overall.toString(),
                    //             style: TextStyle(
                    //                 color: Colors.black26,
                    //                 fontWeight: FontWeight.w500,
                    //                 fontSize: 12.0),
                    //           ),
                    //           Icon(
                    //             Icons.star,
                    //             color: Colors.yellow,
                    //             size: 14.0,
                    //           )
                    //         ],
                    //       ),
                    //       Text(
                    //         item.countof.toString(),
                    //         style: TextStyle(
                    //             color: Colors.black26,
                    //             fontWeight: FontWeight.w500,
                    //             fontSize: 12.0),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
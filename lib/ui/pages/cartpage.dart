import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // key: _con.scaffoldKey,
        body: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 150),
                      padding: EdgeInsets.only(bottom: 15),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 10),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(vertical: 0),
                                leading: Icon(
                                  Icons.shopping_cart,
                                  color: Theme.of(context).hintColor,
                                ),
                                title: Text(
                                  'Shopping Cart',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.display1,
                                ),
                                subtitle: Text(
                                  'Verify your quantity and click checkout',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                            ),
                            // ListView.separated(
                            //   padding: EdgeInsets.symmetric(vertical: 15),
                            //   scrollDirection: Axis.vertical,
                            //   shrinkWrap: true,
                            //   primary: false,
                            //   itemCount: _con.carts.length,
                            //   separatorBuilder: (context, index) {
                            //     return SizedBox(height: 15);
                            //   },
                            //   itemBuilder: (context, index) {
                                // return CartItemWidget(
                                //   cart: _con.carts.elementAt(index),
                                //   heroTag: 'cart',
                                //   increment: () {
                                //     _con.incrementQuantity(_con.carts.elementAt(index));
                                //   },
                                //   decrement: () {
                                //     _con.decrementQuantity(_con.carts.elementAt(index));
                                //   },
                                //   onDismissed: () {
                                //     _con.removeFromCart(_con.carts.elementAt(index));
                                //   },
                                // );
                              // },
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 170,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).focusColor.withOpacity(0.15),
                                  offset: Offset(0, -2),
                                  blurRadius: 5.0)
                            ]),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      'Subtotal',
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ),
                                  // Helper.getPrice(_con.subTotal, style: Theme.of(context).textTheme.subhead)
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "tax",
                                      // 'TAX (${setting.defaultTax}%)',
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ),
                                  // Helper.getPrice(_con.taxAmount, style: Theme.of(context).textTheme.subhead)
                                ],
                              ),
                              SizedBox(height: 10),
                              Stack(
                                fit: StackFit.loose,
                                alignment: AlignmentDirectional.centerEnd,
                                children: <Widget>[
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width - 40,
                                    child: FlatButton(
                                      onPressed: () {
                                        // Navigator.of(context).pushNamed('/PaymentMethod',
                                        //     arguments:
                                        //         new RouteArgument(param: [_con.carts, _con.total, setting.defaultTax]));
//                                      Navigator.of(context).pushReplacementNamed('/Checkout',
//                                          arguments:
//                                              new RouteArgument(param: [_con.carts, _con.total, setting.defaultTax]));
                                      },
                                      padding: EdgeInsets.symmetric(vertical: 14),
                                      color: Theme.of(context).accentColor,
                                      shape: StadiumBorder(),
                                      child: Text(
                                        'Checkout',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Theme.of(context).primaryColor),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    // child: Helper.getPrice(
                                    //   _con.total,
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .display1
                                    //       .merge(TextStyle(color: Theme.of(context).primaryColor)),
                                    // ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      );
  }
}

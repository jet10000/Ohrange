import 'package:flutter/material.dart';
import 'package:ohrange_bloc/ui/widgets/drawerwidget.dart';
import 'package:ohrange_bloc/ui/widgets/profileavatorwidget.dart';
import 'package:ohrange_bloc/ui/widgets/shoppingcartbuttonwidget.dart';

class ProfilePage extends StatefulWidget {
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Settings"
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).hintColor, labelColor: Theme.of(context).accentColor),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child:Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        ProfileAvatarWidget(),
                        
                        SizedBox(
                          height: 5.0,
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                customCards(
                                    'Total Orders', '5', Icons.devices_other,Colors.redAccent),
                                customCards(
                                    'Amount Spend', '2,000',  Icons.attach_money,Colors.green),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              customCards('Favourites', '8',  Icons.favorite_border,Colors.blue[800]),
                              customCards('Ratings', '1',  Icons.rate_review,Colors.orange[400]),
                            ],
                          ),
                           SizedBox(
                              height: 10.0,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                 SizedBox(height: 10.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:20.0,top: 10.0,bottom: 5.0),
                child: Text("Accounts",style: Theme.of(context).textTheme.button,),
              ), 
              customlistDetails('Edit Profile', Icons.account_box, Colors.red[100], Colors.red[400]),
              customlistDetails('Change Password', Icons.lock_outline, Colors.grey[200], Colors.red[900]),
              customlistDetails('Orders', Icons.shopping_basket, Colors.red[100], Colors.red[400]),
              Padding(
                padding: const EdgeInsets.only(left:20.0,top: 10.0,bottom: 5.0),
                child: Text("My Stuff",style: Theme.of(context).textTheme.button,),
              ), 
              customlistDetails('Favourites', Icons.favorite_border, Colors.orange[100], Colors.red[300]),
              customlistDetails('Address', Icons.location_on, Colors.orange[200], Colors.orange[400]),
              customlistDetails('Reviews', Icons.rate_review, Colors.orange[300], Colors.red[500]),

              Padding(
                padding: const EdgeInsets.only(left:20.0,top: 10.0,bottom: 5.0),
                child: Text("Support",style: Theme.of(context).textTheme.button,),
              ), 
              customlistDetails('Conntact Us', Icons.contacts, Colors.blue[100], Colors.blue[400]),
              Padding(
                padding: const EdgeInsets.only(left:20.0,top: 10.0,bottom: 5.0),
                child: Text("Others",style: Theme.of(context).textTheme.button,),
              ), 
              customlistDetails('Terms & Conditions', Icons.text_format, Colors.orange[100], Colors.orange[300]),
              customlistDetails("Privacy & Policy's", Icons.pages, Colors.orange[100], Colors.orange[300]),
              customlistDetails('FAQS', Icons.question_answer, Colors.orange[100], Colors.orange[300]),

              ],), 
             
              ],
            )
          // ],
        // ),
      ),
    );
  }

  Widget customCards(String title, String qty,IconData icon,Color iconcolor) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        height: 125.0,
        width: (MediaQuery.of(context).size.width / 2.0) - 20.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(top:15.0,left: 15.0),
              child: Icon(icon, color:iconcolor,size: 40,),
            ),
            SizedBox(height: 2.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(title,style: Theme.of(context).textTheme.body2,),
            ),
            SizedBox(height: 3.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(qty,
                  style: TextStyle(
                      // fontFamily: 'Quicksand',
                      fontSize: 15.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget customlistDetails(String title, IconData icon, Color backgroundColor, Color iconColor) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.body2,
      ),
      leading: CircleAvatar(
        backgroundColor: backgroundColor,
        child: Center(
          child: Icon(icon, color: iconColor,),
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.redAccent),
    );
  }

}
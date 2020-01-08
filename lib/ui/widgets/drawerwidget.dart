import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'circularloadingwidget.dart';


class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;
  String _id;
  String _name,_email;
  // String _image = "https://ya-webdesign.com/images250_/user-avatar-png-7.png";
  @override
  void initState() {

    // Future.delayed(Duration.zero).then((_) async {
    //    _fetname();
    // });
    super.initState();
    
  }
  void setBrightness(Brightness brightness) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  brightness == Brightness.dark ? prefs.setBool("isDark", true) : prefs.setBool("isDark", false);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: _id == 0
          ? CircularLoadingWidget(height: 500)
          : ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Settings');
                  },
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor.withOpacity(0.1),
                    ),
                    accountName: Text(
                      // user.firstName +' '+ user.lastName,
                      "Venkateswara Reddy",
                      // _name.toString(),
                      style: Theme.of(context).textTheme.title,
                    ),
                    accountEmail: Text(
                      // _email,
                      "venkateswara*8views.com",
                      // user.email.toString(),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      backgroundImage: NetworkImage("https://ya-webdesign.com/images250_/user-avatar-png-7.png"),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/', arguments: 0);
                  },
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Home",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Category');
                  },
                  leading: Icon(
                    Icons.category,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Category",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Products');
                  },
                  leading: Icon(
                    Icons.polymer,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Products",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Search', arguments: 1);
                  },
                  leading: Icon(
                    Icons.search,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Search",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/', arguments: 3);
                  },
                  leading: Icon(
                    Icons.library_books,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "My Orders",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/', arguments: 4);
                  },
                  leading: Icon(
                    Icons.favorite,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Favorite ",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Application Preferences",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Icon(
                    Icons.remove,
                    color: Theme.of(context).focusColor.withOpacity(0.3),
                  ),
                ),

                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Help');
                  },
                  leading: Icon(
                    Icons.help,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Help & Support",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Settings');
                  },
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Settings",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Languages');
                  },
                  leading: Icon(
                    Icons.translate,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Languages",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    if (Theme.of(context).brightness == Brightness.dark) {
                      setBrightness(Brightness.light);
                      DynamicTheme.of(context).setBrightness(Brightness.light);
                    } else {
                      setBrightness(Brightness.dark);
                      DynamicTheme.of(context).setBrightness(Brightness.dark);
                    }
                  },
                  leading: Icon(
                    Icons.brightness_6,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    Theme.of(context).brightness == Brightness.dark ? "Light Mode" : "Dark Mode",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    // AuthProvider.logoutUser(context,_sharedPreferences);
                    //  Navigator.of(context).pushNamedAndRemoveUntil('/Login', (Route<dynamic> route) => false);
                  },
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Log out",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Version 0.0.1",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Icon(
                    Icons.remove,
                    color: Theme.of(context).focusColor.withOpacity(0.3),
                  ),
                ),
              ],
            ),
    );
  }
  

}
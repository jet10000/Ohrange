import 'package:flutter/material.dart';
class ProfileAvatarWidget extends StatelessWidget {
  // final User user;
  ProfileAvatarWidget({
    Key key
    // this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 160,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 135,
                height: 135,
                child: CircleAvatar(
                  backgroundImage: 
                  NetworkImage("https://www.netclipart.com/pp/m/202-2024386_person-icon-png-transparent-standing-man-icon-png.png"),
                  foregroundColor: Theme.of(context).primaryColor,
                  ),
              ),
            ],
          ),
        ),
        Text(
          // user.name,
          "Test",
          style: Theme.of(context).textTheme.headline,
        ),
        Text(
          "Number",
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}

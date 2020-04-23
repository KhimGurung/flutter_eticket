import 'package:flutter/material.dart';
import 'package:fluttereticket/icons/flutter_icon_icons.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/drawer_item_widget.dart';

class DrawerNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 268,
            child: DrawerHeader(
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  height: 128,
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
          SizedBox(height: 20,),
          DrawerItem(
            title: "Home",
            icon: Icons.home,
          ),
          DrawerItem(
            title: "Buy Tickets",
            icon: FlutterIcon.ticket,
          ),
          DrawerItem(
            title: "About Us",
            icon: Icons.info_outline,
          ),
          DrawerItem(
            title: "Setting",
            icon: Icons.settings,
          ),
          DrawerItem(
            title: "Logout",
            icon: FlutterIcon.logout_1,
            route: "/login",
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttereticket/icons/flutter_icon_icons.dart';

class TicketListScreen extends StatefulWidget {
  @override
  _TicketListScreenState createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawerNavigation(context)
    );
  }
}

Widget _drawerNavigation(context){
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
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
            child: Icon(
              Icons.home,
              size: 20,
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(
            'Home',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).accentColor
            ),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
            child: Icon(
              FlutterIcon.ticket,
              size: 20,
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(
            'Buy Tickets',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).accentColor
            ),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
            child: Icon(
              Icons.info_outline,
              size: 20,
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(
            'About Us',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).accentColor
            ),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
            child: Icon(
              Icons.settings,
              size: 20,
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(
            'Setting',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).accentColor
            ),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
            child: Icon(
              FlutterIcon.logout_1,
              size: 20,
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(
            'Logout',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).accentColor
            ),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    ),
  );
}
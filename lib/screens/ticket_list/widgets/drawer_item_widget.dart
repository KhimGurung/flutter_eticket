import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {

  final String title;
  final IconData icon;

  const DrawerItem({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
        child: Icon(
          icon,
          size: 20,
          color: Theme.of(context).accentColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
            color: Theme.of(context).accentColor
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}

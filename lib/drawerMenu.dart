import 'package:flutter/material.dart';

import './filterScreen.dart';
import './homePage.dart';

class DrawerMenu extends StatelessWidget {
  Widget buildListTile(IconData icon, String title, Function tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.lightGreenAccent,
            alignment: Alignment.bottomLeft,
            child: Text(
              'Cooking Up !',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 28.5,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 20),
          buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          }),
          buildListTile(Icons.filter_alt, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../about/about.dart';

class DoveDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Drawer(
        child: ListView(
          // Important: Remove all padding from ListView
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: DrawerHeader(
                child: Center(
                  child: Text(
                    "Aficionado Menu",
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.color
                ),
              )
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("About"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About())
                );
              },
            )
          ],
        ),
      );
  }
}
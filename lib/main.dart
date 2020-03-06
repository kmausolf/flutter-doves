import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async' show Future;

import 'dove/doveCard.dart';
import 'dove/doveModel.dart';
import 'drawer/doveDrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      /// Put all of your app's theme data here! You can reference these theme
      /// elements with Theme.of(context).<your theme variable name>
      /// theme: This is your "light" theme
      /// darkTheme: This is your "dark" theme
      theme: ThemeData( 
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          color: Colors.blueGrey[300]
        ),
        primaryColor: Colors.grey[300]
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900]
      ),
      home: HomePage(
        title: 'Mourning Dove Aficionados'
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map doveInfo;

  @override
  void initState() {
    super.initState();
    loadDoveInfo().then((result) {
      setState(() {
        doveInfo = result;
      });
    });
  }

  /// Load up the dove data from the json file
  /// Futures are like JS Promises
  Future<Map> loadDoveInfo() async {
    String rawInfoString = await rootBundle.loadString("res/doves.json");
    return json.decode(rawInfoString);
  }

  Widget _renderDoveListItem(index) {
    return new DoveCard(
      new Dove(
          doveInfo["doves"][index]["name"],
          doveInfo["doves"][index]["description"],
          doveInfo["doves"][index]["image"],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: new DoveDrawer(),
      body: Center(
        child: Column(
          children: doveInfo == null 
          ? <Widget> [ Container() ]
          : <Widget> [
              Expanded (
                child: new ListView.builder(
                  itemCount: doveInfo["doves"]?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) => _renderDoveListItem(index)
                )
            )
          ]
        )
      )
    );
  }
}

import 'package:flutter/material.dart';

import 'doveModel.dart';

class DoveCard extends StatefulWidget {
  final Dove dove;

  DoveCard(this.dove);

  @override
  _DoveCardState createState() => _DoveCardState(dove);
}

class _DoveCardState extends State<DoveCard> {
  Dove dove;

  _DoveCardState(this.dove);
  
  _renderDoveDetails() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: <Widget>[
          Container (
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              this.dove.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              )
            )
          ),
          Container (
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              this.dove.description,
              style: TextStyle(
                fontSize: 16
              ),
            )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0)
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(this.dove.imagePath)
                      )
                    ),
                    width: (MediaQuery.of(context).size.width * 0.9)
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(20.0),
                        bottomRight: const Radius.circular(20.0)
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      children: <Widget> [
                        Center(
                          child: _renderDoveDetails()
                        ),
                        FlatButton(
                          color: Colors.blue[100],
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: const Radius.circular(20.0),
                              bottomRight: const Radius.circular(20.0)
                            )
                          ),
                          onPressed: () => {},
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Icon(Icons.info, color: Colors.blue)
                          )
                        )
                      ],
                    ),
                    width: (MediaQuery.of(context).size.width * 0.9)
                  ),
                ]
              )
            )
          ],
        ),
      );
  }
}
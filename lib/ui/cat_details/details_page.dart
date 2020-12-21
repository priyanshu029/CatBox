import 'package:catbox/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:catbox/ui/cat_details/header/details_header.dart';
import 'package:catbox/ui/cat_details/details_body.dart';
import 'package:catbox/ui/cat_details/footer/details_footer.dart';

class CatDetailsPage extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  CatDetailsPage(this.cat, {
    @required this.avatarTag});


  @override
  _catDetailsPageState createState() => new _catDetailsPageState();
}

  class _catDetailsPageState extends State<CatDetailsPage>{

  var linearGradiant =new BoxDecoration(
    gradient: new LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: [Colors.blue,Colors.lightBlueAccent]),
  );

  @override
    Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          decoration: linearGradiant,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new CatDetailsHeader(
                    widget.cat,
                    avatarTag: widget.avatarTag,
                  ),

                ],
              ),
              new Padding(
                padding: new EdgeInsets.all(24.0),
                child: new CatDetailsBody(widget.cat),
              ),
              new CatShowcase(widget.cat),
            ],
          ),
        ),
      ),
    );

  }

  }


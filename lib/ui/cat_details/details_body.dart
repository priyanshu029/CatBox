import 'package:catbox/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CatDetailsBody extends StatelessWidget {


  final Cat cat;
  CatDetailsBody(this.cat);



  @override
  Widget build(BuildContext context) {
    var theme= Theme.of(context);
    var textTheme =theme.textTheme;

    var locationInfo =new Row(
      children: <Widget>[
        new Icon(
          Icons.place,
          color: Colors.white,
          size: 16.0,
        ),
        new Padding(
            padding: new EdgeInsets.only(left: 8.0),
          child: new Text(
            cat.location,
            style: textTheme.subhead.copyWith(color: Colors.white),
          ),
        )
      ],
    );


    _createCircleBadge (IconData iconData,Color color){
      return new Padding(
          padding: new EdgeInsets.only(left: 8.0),
          child: new CircleAvatar(
            backgroundColor: color,
            child: new Icon(
              iconData,
              color: Colors.white,
              size: 16.0,


            ),
            radius: 16.0,
          ),
      );

    }


    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          cat.name,
          style: textTheme.headline.copyWith(color: Colors.white),
        ),
        new Padding(
            padding: new EdgeInsets.only(top: 4.0),
            child: locationInfo,
        ),
        new Padding(
            padding: new EdgeInsets.only(top: 16.0),
          child: new Text(
            cat.description,
            style: textTheme.body1.copyWith(color: Colors.white70,fontSize: 16.0),
          ),
        ),
        new Padding(
            padding: new EdgeInsets.only(top: 16.0),
            child: new Row(
              children: <Widget>[
                _createCircleBadge(Icons.share,theme.accentColor),
                _createCircleBadge(Icons.phone, Colors.lightBlueAccent),
                _createCircleBadge(Icons.email, Colors.lightBlueAccent),
              ],
            ),
        )
      ],
    );


  }
}
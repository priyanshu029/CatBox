
import 'package:catbox/models/cat.dart';
import 'package:catbox/ui/cat_details/header/cat_colored_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

class CatDetailsHeader extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  CatDetailsHeader(this.cat,{ @override this.avatarTag});

  @override
  _catDetailsHeaderState createState() => new _catDetailsHeaderState();

}

class _catDetailsHeaderState extends State<CatDetailsHeader>{

  static const BACKGROUND_IMAGE ='assets/a.jpeg';







  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var diagonalBackground = new DiagonallyCutColoredImage(
      new Image.asset(
          BACKGROUND_IMAGE,
          width: screenWidth,
          height: 280.0,
        fit: BoxFit.cover,
      ),
      color: const Color(0xBB42A5F5),
    );


    var theme= Theme.of(context);
    var textTheme =theme.textTheme;

    var avatar= new Hero(
      tag: widget.avatarTag,
      child: new CircleAvatar(
        backgroundImage: new NetworkImage(widget.cat.avatarUrl),
        radius: 75.0,
      ),
    );

    var likeInfo=new Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Icon(Icons.thumb_up,size: 16.0,color: Colors.white,),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(widget.cat.likeCounter.toString(),
            style: textTheme.subhead.copyWith(color: Colors.white),),
          )
        ],
      ),
    );
    var actionButtons =new Padding(
      padding:const EdgeInsets.only(top: 16.0,left: 16.0,right: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new MaterialButton(
              minWidth: 140.0,
              color: theme.accentColor,
              onPressed: ()async {//to handle adopt
              },
              child: new Text('Adopt'),
            ),
          ),
          new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new MaterialButton(
              color: Colors.lightGreen,
              textColor: Colors.white,
              onPressed: ()async {//to handle adopt
              },
              child: new Text('Like'),
            ),
          )
        ],
      ),
    );


    return new Stack(
      children: <Widget>[
        diagonalBackground,
        new Align(
          alignment: FractionalOffset.bottomRight,
          heightFactor: 1.4,
          child: new Column(
            children: <Widget>[
              avatar,
              likeInfo,
              actionButtons
      ],
          )),
      new Positioned(
        top: 26.0,
          left: 4.0,
          child: new BackButton())]);

  }
}
import 'package:catbox/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CattributesShowcase extends StatelessWidget {
  final Cat cat;

  CattributesShowcase(this.cat);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('Cattributes',textAlign: TextAlign.center,),
    );

  }


}
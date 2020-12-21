
import 'package:flutter/material.dart';
import 'package:catbox/ui/cat_list.dart';


void main(){
  runApp(new CatBoxApp());
}

class CatBoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme:new ThemeData(
            primarySwatch:Colors.blue,
            accentColor:Colors.orangeAccent
        ),
        home:new CatList(),
    );
  }
}


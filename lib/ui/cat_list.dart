import 'package:catbox/utils/routes.dart';
import 'package:flutter/material.dart';
import 'dart:async' ;
import 'package:catbox/services/api.dart';
import 'package:catbox/models/cat.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:catbox/ui/cat_details/details_page.dart';


class CatList extends StatefulWidget {
  @override
  _CatListState createState() => new _CatListState();
}

class _CatListState extends State<CatList> {

  List<Cat> _cats=[];

  @override
  void initState() {
    super.initState();
    _loadCats();
  }

  _loadCats() async {
    String fileData= await DefaultAssetBundle.of(context).loadString("assets/cats.json");
    setState(() {
      _cats=CatApi.allCatsFromJson(fileData);
    });



  }

  _navigateToCatDetails(Cat cat ,Object avatarTag){

    Navigator.of(context).push(
      new FadePageRoute(
        builder: (c) {
          return new CatDetailsPage(cat, avatarTag: avatarTag);
        } ,
        settings: new RouteSettings(),
      )
    );

  }








  Widget _buildCatItem(BuildContext context,int index){
    Cat cat=_cats[index];
    return Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Card(
        child: new Column(
          mainAxisSize:MainAxisSize.min,
          children: <Widget>[
            new ListTile(
                onTap:() =>_navigateToCatDetails(cat, index),
              leading: new Hero(

                  tag: index,
                  
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(cat.avatarUrl),
                  ),
              ),
              title: new Text(cat.name),
              subtitle: new Text(cat.description),
              isThreeLine: true,
              dense: false,
            )
          ],
        ),
      ),
    );
  }

  Future<Null> refresh(){
    _loadCats();
    return new Future<Null>.value();
  }

  Widget _getAppTitleWidget(){
    return new Text(
      'Cats',
      style:new TextStyle(
          color:Colors.white,
          fontWeight:FontWeight.bold,
          fontSize:32.0
      ),
    );
  }






  Widget _getListViewWidget(){
    return new Flexible(
      child:new RefreshIndicator(
        onRefresh:refresh,
        child: new ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: _cats.length,
            itemBuilder:_buildCatItem
        ),
      ),)
      ;
  }

  Widget _buildBody(){
    return new Container(
      margin: new EdgeInsets.fromLTRB(
        8.0,
        56.0,
        8.0,
        0.0
      ),
      child: new Column(
        children: <Widget>[
          _getAppTitleWidget(),
          _getListViewWidget(),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor:Colors.blue,
      body:_buildBody(),

    );
  }


}
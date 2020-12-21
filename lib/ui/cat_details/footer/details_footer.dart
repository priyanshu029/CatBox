import 'package:catbox/models/cat.dart';
import 'package:flutter/material.dart';
import 'showcase_cattributes.dart';
import 'showcase_details.dart';
import 'Showcase_pictures.dart';

class CatShowcase extends StatefulWidget{
  final Cat cat;
  CatShowcase(this.cat);

  @override
  _CatShowcaseState createState() => new _CatShowcaseState();
}

class _CatShowcaseState extends State<CatShowcase> with TickerProviderStateMixin{

  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs=[
    new Tab(text: 'Pictures'),
      new Tab(text: 'Details'),
      new Tab(text: 'Cattributes',)
    ];
    _pages=[
      new PictureShowcase(widget.cat),
      new DetailsShowcase(widget.cat),
      new CattributesShowcase(widget.cat)
    ];
    _controller =new TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding:new EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          new TabBar(
              tabs: _tabs,
            controller: _controller,
            indicatorColor: Colors.white,
          ),
          new SizedBox.fromSize(
            size: const Size.fromHeight(300),
            child: new TabBarView(children: _pages,controller: _controller,),
          )
        ],
      ),
    );
    

  }

}
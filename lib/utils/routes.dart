import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FadePageRoute<T> extends MaterialPageRoute<T>{
  FadePageRoute({
    @override WidgetBuilder builder,
    @override RouteSettings settings
}) : super(builder: builder,settings: settings);


  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if(settings.name == '/'){
      return child;
    }

    return new FadeTransition(opacity: animation,child: child,);
  }

}
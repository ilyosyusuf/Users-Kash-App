import 'package:flutter/material.dart';
import 'package:users/screens/view/home_view.dart';

class AllRoutes {
  static final AllRoutes _instance = AllRoutes._init();
  static AllRoutes get instance => _instance;
  AllRoutes._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/homeview':
        return _pages(HomeView());
    }
  }
  
  _pages(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}

import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService.init();
  static NavigationService get instance => _instance;
  NavigationService.init();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> pushNamed({required String routeName, var args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  Future<dynamic> pushNamedAndRemoveUntil({required String routeName, var args}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName,  (route) => false, arguments: args);
  }

  Future<dynamic> pushNamedReplacementNamed(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  void pop() {
    return navigatorKey.currentState!.pop();
  }
}
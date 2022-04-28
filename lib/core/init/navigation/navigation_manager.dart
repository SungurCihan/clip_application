import 'package:flutter/material.dart';

import 'abstract/i_navigation_service.dart';

class NavigationManager implements INavigationService {
  static final NavigationManager _instance = NavigationManager._init();
  static NavigationManager get instance => _instance;

  NavigationManager._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String? path, Object? data}) async {
    if (path != null && navigatorKey.currentState != null) {
      await navigatorKey.currentState!.pushNamed(path, arguments: data);
    }
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? data}) async {
    if (path != null && navigatorKey.currentState != null) {
      await navigatorKey.currentState!
          .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
    }
  }
}

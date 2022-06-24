import 'package:flutter/material.dart';

import '../../../features/home/view/bottom_page_route.dart';
import '../../../features/profile/view/profile_detail_view.dart';
import '../../../features/profile/view/profile_view.dart';
import '../../../features/registration/view/login_screen.dart';
import '../../../features/registration/view/sign_screen.dart';
import '../../../product/widgets/card/not_found_navigation.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoutes(RouteSettings args) {
    switch (args.name) {
      case NavigationCostants.sign:
        return normalNavigate(SignScreen());
      case NavigationCostants.login:
        return normalNavigate(LoginScreen());
      case NavigationCostants.home:
        return normalNavigate(const BottomPageRoute());
      case NavigationCostants.profile:
        return normalNavigate(const ProfileView());
      case NavigationCostants.profileDetail:
        return normalNavigate(const ProfileDetailView());
      default:
        return MaterialPageRoute(
            builder: (context) => const NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

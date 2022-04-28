import 'package:flutter/material.dart';

import 'core/init/navigation/navigation_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/theme/app_light_theme.dart';
import 'features/registration/view/login_or_sign_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clip Application',
        navigatorKey: NavigationManager.instance.navigatorKey,
        onGenerateRoute: NavigationRoute.instance.generateRoutes,
        theme: AppThemeLight.instance.theme,
        home: const LoginOrSign());
  }
}

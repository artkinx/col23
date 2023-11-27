import 'package:flutter/material.dart';
import 'package:klusterthon/presentation/onboarding/login_screen/login_screen_page.dart';
import 'package:klusterthon/presentation/onboarding/sigin_up/sigin_up_page.dart';
import 'package:klusterthon/presentation/onboarding/track_selection/track_selection_page.dart';

class RouteNames {
  static const String index = '/';
  static const String signUp = '/sign_up';
  static const String register = '/register';
}

class AppRoutes {
  static buildRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.index:
        return MaterialPageRoute(builder: (_) => const LoginScreenPage());
      case RouteNames.signUp:
        return MaterialPageRoute(builder: (_) => const SiginUpPage());
      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => const TrackSelectionPage());
      default:
        return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klusterthon/app_routes.dart';
import 'package:klusterthon/core/services/bloc_provider_service.dart';
import 'package:klusterthon/core/services/navigation_service.dart';
import 'package:klusterthon/core/theme/app_theme.dart';
import 'package:klusterthon/presentation/home/dash_board/dash_board_page.dart';
import 'package:klusterthon/presentation/onboarding/login_screen/login_screen_page.dart';

NavigationService navService = NavigationService();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviderService.buildProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigationKey,
        onGenerateRoute: (v) => AppRoutes.buildRoutes(v),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const DashBoardPage(),
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klusterthon/presentation/onboarding/login_screen/bloc/login_bloc.dart';
import 'package:klusterthon/presentation/onboarding/sigin_up/bloc/sign_up_bloc.dart';
import 'package:klusterthon/widgets/menu/bloc/drawer_menu_bloc.dart';

class BlocProviderService {
  static buildProviders() => [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => SignUpBloc()),
        BlocProvider(create: (_) => DrawerMenuBloc()),
      ];
}

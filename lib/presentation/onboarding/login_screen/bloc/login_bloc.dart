import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klusterthon/app_routes.dart';
import 'package:klusterthon/main.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginPostEvent>(_registerLoginPostEvent);
  }
}

_registerLoginPostEvent(LoginPostEvent event, Emitter<LoginState> emit) {
  navService.pushReplacementNamed(RouteNames.signUp);
}

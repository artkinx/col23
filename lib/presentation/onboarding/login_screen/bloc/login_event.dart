part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginPostEvent extends LoginEvent {
  LoginPostEvent();
}

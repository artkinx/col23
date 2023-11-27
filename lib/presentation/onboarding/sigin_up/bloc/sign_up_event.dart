part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class PostRequestEvent extends SignUpEvent {
  final SignUpRequest? request;
  PostRequestEvent(this.request);
}

class SignUpFormChangingEvent extends SignUpEvent {
  final SignUpRequest request;

  SignUpFormChangingEvent(this.request);
}

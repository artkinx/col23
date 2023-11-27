part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {
  final SignUpRequest? formData;
  final LoadingStates loadingStates;

  SignUpState copyWith({SignUpRequest? form});

  const SignUpState({
    this.formData,
    this.loadingStates = LoadingStates.idle,
  });
}

final class SignUpInitial extends SignUpState {
  const SignUpInitial({SignUpRequest? form}) : super(formData: form);

  @override
  SignUpState copyWith({SignUpRequest? form}) {
    return SignUpInitial(form: form);
  }
}

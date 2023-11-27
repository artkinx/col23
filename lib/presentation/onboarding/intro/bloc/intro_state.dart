part of 'intro_bloc.dart';

@immutable
sealed class IntroState {}

final class IntroInitial extends IntroState {
  final bool showNextButton;

  IntroInitial({this.showNextButton = false});

  IntroInitial copyWith({bool showNextButton = false}) {
    return IntroInitial(showNextButton: showNextButton);
  }
}

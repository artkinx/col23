import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroInitial()) {
    on<IntroEvent>((event, emit) {});
  }
}

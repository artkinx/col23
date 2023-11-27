import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klusterthon/app_routes.dart';
import 'package:klusterthon/core/helper/constant_var_helper.dart';
import 'package:klusterthon/core/services/navigation_service.dart';
import 'package:klusterthon/data/apis/user_api_requests.dart';
import 'package:klusterthon/data/requests/sign_up_request.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpInitial()) {
    on<PostRequestEvent>(_signUpSendData);
    on<SignUpFormChangingEvent>(_signUpChangingEvent);
  }

  _signUpSendData(PostRequestEvent event, Emitter<SignUpState> emit) async {
    var userReq = UserApiRequests();

    if (event.request == null) {
      return;
    }

    var resp = await userReq.signUpAsync(event.request!);

    if (!resp) {
      return;
    }

    await navService.pushNamed(RouteNames.register);
  }

  _signUpChangingEvent(
      SignUpFormChangingEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(form: event.request));
  }
}

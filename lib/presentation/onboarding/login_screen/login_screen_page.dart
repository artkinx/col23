import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klusterthon/app_routes.dart';
import 'package:klusterthon/core/helper/constant_var_helper.dart';
import 'package:klusterthon/main.dart';
import 'package:klusterthon/presentation/onboarding/login_screen/bloc/login_bloc.dart';
import 'package:klusterthon/widgets/onboarding_form/onboarding_form_page.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({super.key});

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  @override
  Widget build(BuildContext context) {
    var body = OnboardingFormPage(
      title: "Log In",
      text1: "Remember Me",
      text2: "Forgot Password",
      text3: "Not a memeber yet?",
      text4: "Create Account",
      btnText: "Log In",
      buttonColor: primaryColor,
      secondaryBtnTextColor: primaryColor,
      onMainButtonClick: () => context.read<LoginBloc>().add(LoginPostEvent()),
      body: [
        SizedBox(
          height: 43,
          child: TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(8, 10, 10, 40),
                border: const OutlineInputBorder(),
                hintText: "Usernam",
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 13, height: 5)),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 43,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(8, 10, 10, 40),
              hintText: "Password",
              border: const OutlineInputBorder(),
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontSize: 13, height: 5),
            ),
          ),
        ),
      ],
    );
    return body;
  }
}

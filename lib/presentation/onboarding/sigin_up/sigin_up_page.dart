import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klusterthon/core/helper/constant_var_helper.dart';
import 'package:klusterthon/data/requests/sign_up_request.dart';
import 'package:klusterthon/presentation/onboarding/sigin_up/bloc/sign_up_bloc.dart';
import 'package:klusterthon/widgets/onboarding_form/onboarding_form_page.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SiginUpPage extends StatefulWidget {
  const SiginUpPage({super.key});

  @override
  State<SiginUpPage> createState() => _SiginUpPageState();
}

class _SiginUpPageState extends State<SiginUpPage> {
  var model = SignUpRequest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OnboardingFormPage(
      buttonColor: primaryColor,
      secondaryBtnTextColor: primaryColor,
      title: "Sign Up",
      text1: "Accept Col123",
      text3: "Already a member?",
      text4: "Log In",
      btnText: "Sign Up",
      onMainButtonClick: () {
        // var model = ReactiveSignUpRequestForm.of(context)?.model;

        context.read<SignUpBloc>().add(PostRequestEvent(model));
      },
      body: [
        SignUpRequestFormBuilder(
            model: model,
            builder: (_, form, child) {
              // form.form.collectionChanges.listen((v) => context
              //     .read<SignUpBloc>()
              //     .add(SignUpFormChangingEvent(form.model)));
              return BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  model = form.model;
                  if (state.formData == null) {
                    print("No data...");
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      ReactiveSignUpRequestFormConsumer(
                          builder: (context, form, child) {
                        context
                            .read<SignUpBloc>()
                            .add(SignUpFormChangingEvent(form.model));
                        return Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 43,
                                child: ReactiveTextField(
                                  formControl: form.firstnameControl,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          8, 10, 10, 40),
                                      border: const OutlineInputBorder(),
                                      hintText: "First Name",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                            fontSize: 13,
                                            height: 5,
                                          ),
                                      errorStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                            color: Colors.red,
                                            height: 0.002,
                                          )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 43,
                                child: ReactiveTextField(
                                  formControl: form.lastnameControl,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          8, 10, 10, 40),
                                      border: const OutlineInputBorder(),
                                      hintText: "Last Name",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(fontSize: 13, height: 5)),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 43,
                        child: ReactiveTextField(
                          formControl: form.emailControl,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(8, 10, 10, 40),
                              border: const OutlineInputBorder(),
                              hintText: "Email",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(fontSize: 13, height: 5)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 43,
                        child: ReactiveTextField(
                          formControl: form.passwordControl,
                          obscureText: true,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(8, 10, 10, 40),
                              border: const OutlineInputBorder(),
                              hintText: "Password",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(fontSize: 13, height: 5)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 43,
                        child: ReactiveTextField(
                          formControl: form.confirmpasswordControl,
                          obscureText: true,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(8, 10, 10, 40),
                              border: const OutlineInputBorder(),
                              hintText: "Confirm Password",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(fontSize: 13, height: 5)),
                        ),
                      ),
                    ],
                  );
                },
              );
            }),
      ],
    ));
  }
}

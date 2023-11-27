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

class WidgetTest extends StatefulWidget {
  const WidgetTest({super.key});

  @override
  State<WidgetTest> createState() => _WidgetTestState();
}

class _WidgetTestState extends State<WidgetTest> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-----------------------Sidebar---------------------
            Container(
              width: 308,
              height: MediaQuery.sizeOf(context).height,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.sizeOf(context).height,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 566.60,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 78.60,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Col-23',
                                              style: TextStyle(
                                                color: Color(0xFF5B0BC1),
                                                fontSize: 24,
                                                fontFamily: 'Helvetica Neue',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        decoration: const ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 0.50,
                                              strokeAlign:
                                                  BorderSide.strokeAlignCenter,
                                              color: Color(0xFF8D8D8D),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 456,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 264,
                                        // padding:
                                        //     const EdgeInsets.symmetric(
                                        //         vertical: 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              padding: const EdgeInsets.all(16),
                                              decoration: ShapeDecoration(
                                                color: const Color(0xFFEFE7F9),
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      width: 1,
                                                      color: Color(0xFFBC9BE6)),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 24,
                                                          height: 24,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 0,
                                                                top: 0,
                                                                child:
                                                                    Container(
                                                                  width: 24,
                                                                  height: 24,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                          color:
                                                                              Color(0xFFD9D9D9)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        const Text(
                                                          'Overview',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF5B0BC1),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            height: 0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 24,
                                                          height: 24,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 0,
                                                                top: 0,
                                                                child:
                                                                    Container(
                                                                  width: 24,
                                                                  height: 24,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                          color:
                                                                              Color(0xFFD9D9D9)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        const Text(
                                                          'Pair generator',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF8D8D8D),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 24,
                                                          height: 24,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 0,
                                                                top: 0,
                                                                child:
                                                                    Container(
                                                                  width: 24,
                                                                  height: 24,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                          color:
                                                                              Color(0xFFD9D9D9)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        const Text(
                                                          'Notification',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF8D8D8D),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 24,
                                                          height: 24,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 0,
                                                                top: 0,
                                                                child:
                                                                    Container(
                                                                  width: 24,
                                                                  height: 24,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                          color:
                                                                              Color(0xFFD9D9D9)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        const Text(
                                                          'Feedback',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF8D8D8D),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 24,
                                                          height: 24,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 0,
                                                                top: 0,
                                                                child:
                                                                    Container(
                                                                  width: 24,
                                                                  height: 24,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                          color:
                                                                              Color(0xFFD9D9D9)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        const Text(
                                                          'Activities',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF8D8D8D),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 104,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 24,
                                                          height: 24,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 0,
                                                                top: 0,
                                                                child:
                                                                    Container(
                                                                  width: 24,
                                                                  height: 24,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                          color:
                                                                              Color(0xFFD9D9D9)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        const Text(
                                                          'Settings',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF8D8D8D),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 24,
                                                          height: 24,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 0,
                                                                top: 0,
                                                                child:
                                                                    Container(
                                                                  width: 24,
                                                                  height: 24,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                          color:
                                                                              Color(0xFFD9D9D9)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        const Text(
                                                          'Support',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF8D8D8D),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 24,
                                                    height: 24,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          left: 0,
                                                          top: 0,
                                                          child: Container(
                                                            width: 24,
                                                            height: 24,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    color: Color(
                                                                        0xFFD9D9D9)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  const Text(
                                                    'Log out',
                                                    style: TextStyle(
                                                      color: Color(0xFF8D8D8D),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 188,
                            padding: const EdgeInsets.all(16),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              image: const DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/244x188"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Upgrade to pro',
                                  style: TextStyle(
                                    color: Color(0xFF7734CC),
                                    fontSize: 18,
                                    fontFamily: 'Helvetica Neue',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  '1 month premium\nFree',
                                  style: TextStyle(
                                    color: Color(0xFF3A3A3A),
                                    fontSize: 18,
                                    fontFamily: 'Helvetica Neue',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(0x7F7734CC),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Start  Trial',
                                        style: TextStyle(
                                          color: Color(0xFFEBEBEB),
                                          fontSize: 16,
                                          fontFamily: 'Helvetica Neue',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                          letterSpacing: -0.41,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //------------------sidebar---------------

            //--------------------body----------------
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 108,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---------------topbar---------------
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.all(24),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.50, color: Color(0xFF8D8D8D)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Search',
                                  style: TextStyle(
                                    color: Color(0xFF8D8D8D),
                                    fontSize: 16,
                                    fontFamily: 'Helvetica Neue',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(width: 173),
                                Container(
                                  width: 24,
                                  height: 24,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: const BoxDecoration(
                                              color: Color(0xFFD9D9D9)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Dera Blessing',
                                              style: TextStyle(
                                                color: Color(0xFF3A3A3A),
                                                fontSize: 20,
                                                fontFamily: 'Helvetica Neue',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'Ui/Ux Designer',
                                              style: TextStyle(
                                                color: Color(0xFF3A3A3A),
                                                fontSize: 14,
                                                fontFamily: 'Helvetica Neue',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: ShapeDecoration(
                                                      image:
                                                          const DecorationImage(
                                                        image: NetworkImage(
                                                            "https://via.placeholder.com/50x50"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: const BorderSide(
                                                            width: 2,
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(200),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: const ShapeDecoration(
                                                color: Color(0xFF7EAB17),
                                                shape: OvalBorder(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //------------------tobbar end--------------

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Dera, Welcome back.',
                              style: TextStyle(
                                color: Color(0xFF3A3A3A),
                                fontSize: 18,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'How can we be of help to you?',
                              style: TextStyle(
                                color: Color(0xFF3A3A3A),
                                fontSize: 16,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //--------------------------graphs---------------
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width / 3.6,
                                  height: 306,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 19,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFFF8E7),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: Color(0xFFFFEFC2)),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        flex: 4,
                                        child: Container(
                                          width: 633,
                                          height: 633,
                                          child: const Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Skills',
                                                style: TextStyle(
                                                  color: Color(0xFF3A3A3A),
                                                  fontSize: 18,
                                                  fontFamily: 'Helvetica Neue',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                ),
                                              ),
                                              SizedBox(height: 7),
                                              Text(
                                                'Ratings are according to the feedback\nfrom your peers.',
                                                style: TextStyle(
                                                  color: Color(0xFF8D8D8D),
                                                  fontSize: 14,
                                                  fontFamily: 'Helvetica Neue',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 166,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 296,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'Empathy',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Container(
                                                    width: 190,
                                                    height: 8,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: ShapeDecoration(
                                                      color: const Color(
                                                          0xFFEFE7F9),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 190,
                                                          height: 8,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFF1B9D2A),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  const Text(
                                                    '75%',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .height,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'Commn.',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Container(
                                                    width: 191,
                                                    height: 8,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 46.84),
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: ShapeDecoration(
                                                      color: const Color(
                                                          0xFFEFE7F9),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 144.16,
                                                          height: 8,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFF0A4FC7),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  const Text(
                                                    '50%',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .height,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'User Flow',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Container(
                                                    width: 184,
                                                    height: 8,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 45.12),
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: ShapeDecoration(
                                                      color: const Color(
                                                          0xFFEFE7F9),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 138.88,
                                                          height: 8,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFF0A4FC7),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  const Text(
                                                    '90%',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .height,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'Research',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Container(
                                                    width: 187,
                                                    height: 8,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 45.85),
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: ShapeDecoration(
                                                      color: const Color(
                                                          0xFFEFE7F9),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 141.15,
                                                          height: 8,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFF0A4FC7),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  const Text(
                                                    '75%',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .height,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'Empathy',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Container(
                                                    width: 190,
                                                    height: 8,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 46.59),
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: ShapeDecoration(
                                                      color: const Color(
                                                          0xFFEFE7F9),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 143.41,
                                                          height: 8,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFF0A4FC7),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  const Text(
                                                    '80%',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // const SizedBox(width: 20),
                                Container(
                                  width: 406,
                                  height: 306,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFF1F6FF),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: Color(0xFF518EF8)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        left: MediaQuery.sizeOf(context).width /
                                            20.8,
                                        top: 40,
                                        child: Container(
                                          width: 226.24,
                                          height: 226.24,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 226.24,
                                                top: 139.19,
                                                child: Transform(
                                                  transform: Matrix4.identity()
                                                    ..translate(0.0, 0.0)
                                                    ..rotateZ(2.58),
                                                  child: Container(
                                                    width: 164.17,
                                                    height: 164.17,
                                                    decoration:
                                                        const ShapeDecoration(
                                                      color: Color(0xFFDCE6F7),
                                                      shape: OvalBorder(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 19.29,
                                                top: 44.77,
                                                child: Transform(
                                                  transform: Matrix4.identity()
                                                    ..translate(0.0, 0.0)
                                                    ..rotateZ(-0.16),
                                                  child: Container(
                                                    width: 164.17,
                                                    height: 164.17,
                                                    decoration:
                                                        const ShapeDecoration(
                                                      color: Color(0xFF518EF8),
                                                      shape: OvalBorder(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 58,
                                                top: 79,
                                                child: Container(
                                                  width: 109.12,
                                                  height: 67,
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 9.29,
                                                    left: 16.89,
                                                    right: 15.23,
                                                    bottom: 13.71,
                                                  ),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration:
                                                      const BoxDecoration(),
                                                  child: const Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '00%',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF518EF8),
                                                          fontSize: 36.15,
                                                          fontFamily:
                                                              'Helvetica Neue',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 24,
                                        top: 24,
                                        child: Text(
                                          'Project Completion Rate',
                                          style: TextStyle(
                                            color: Color(0xFF3A3A3A),
                                            fontSize: 18,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 21,
                                        top: 269,
                                        child: Text(
                                          'Completed',
                                          style: TextStyle(
                                            color: Color(0xFF3A3A3A),
                                            fontSize: 14,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 181,
                                        top: 269,
                                        child: Text(
                                          'In progress',
                                          style: TextStyle(
                                            color: Color(0xFF3A3A3A),
                                            fontSize: 14,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 98,
                                        top: 269,
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF518EF8),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 258,
                                        top: 269,
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFDDE7F8),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // const SizedBox(width: 20),
                                Container(
                                  width: 346,
                                  height: 306,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFEEFFE7),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: Color(0xFF7BC683)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 44,
                                        top: 113,
                                        child: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 272,
                                                decoration:
                                                    const ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      width: 0.50,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignCenter,
                                                      color: Color(0xFFAEAEAE),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 24),
                                              Container(
                                                width: 272,
                                                decoration:
                                                    const ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      width: 0.50,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignCenter,
                                                      color: Color(0xFFAEAEAE),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 24),
                                              Container(
                                                width: 272,
                                                decoration:
                                                    const ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      width: 0.50,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignCenter,
                                                      color: Color(0xFFAEAEAE),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 24),
                                              Container(
                                                width: 272,
                                                decoration:
                                                    const ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      width: 0.50,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignCenter,
                                                      color: Color(0xFFAEAEAE),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 24),
                                              Container(
                                                width: 272,
                                                decoration:
                                                    const ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      width: 0.50,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignCenter,
                                                      color: Color(0xFFAEAEAE),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 24),
                                              Container(
                                                width: 272,
                                                decoration:
                                                    const ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      width: 0.50,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignCenter,
                                                      color: Color(0xFFAEAEAE),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 76,
                                        top: 92,
                                        child: Container(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: 40,
                                                padding: const EdgeInsets.only(
                                                    top: 55),
                                                clipBehavior: Clip.antiAlias,
                                                decoration:
                                                    const ShapeDecoration(
                                                  color: Color(0xFFE8F5EA),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(8),
                                                    ),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 40,
                                                      height: 50,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration:
                                                          const ShapeDecoration(
                                                        color:
                                                            Color(0xFF7BC683),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    8),
                                                            topRight:
                                                                Radius.circular(
                                                                    8),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Container(
                                                width: 40,
                                                padding: const EdgeInsets.only(
                                                    top: 33),
                                                clipBehavior: Clip.antiAlias,
                                                decoration:
                                                    const ShapeDecoration(
                                                  color: Color(0xFFE8F5EA),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(8),
                                                    ),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 40,
                                                      height: 91,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration:
                                                          const ShapeDecoration(
                                                        color:
                                                            Color(0xFF7BC683),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    8),
                                                            topRight:
                                                                Radius.circular(
                                                                    8),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Container(
                                                width: 40,
                                                padding: const EdgeInsets.only(
                                                    top: 40),
                                                clipBehavior: Clip.antiAlias,
                                                decoration:
                                                    const ShapeDecoration(
                                                  color: Color(0xFFE8F5EA),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(8),
                                                    ),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 40,
                                                      height: 105,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration:
                                                          const ShapeDecoration(
                                                        color:
                                                            Color(0xFF7BC683),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    8),
                                                            topRight:
                                                                Radius.circular(
                                                                    8),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Container(
                                                width: 40,
                                                padding: const EdgeInsets.only(
                                                    top: 45),
                                                clipBehavior: Clip.antiAlias,
                                                decoration:
                                                    const ShapeDecoration(
                                                  color: Color(0xFFE8F5EA),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(8),
                                                    ),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 40,
                                                      height: 124,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration:
                                                          const ShapeDecoration(
                                                        color:
                                                            Color(0xFF7BC683),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    8),
                                                            topRight:
                                                                Radius.circular(
                                                                    8),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 38,
                                        top: 251,
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                            color: Color(0xFF8D8D8D),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 93,
                                        top: 266,
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                            color: Color(0xFF8D8D8D),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 148,
                                        top: 266,
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                            color: Color(0xFF8D8D8D),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 203,
                                        top: 266,
                                        child: Text(
                                          '3',
                                          style: TextStyle(
                                            color: Color(0xFF8D8D8D),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 258,
                                        top: 266,
                                        child: Text(
                                          '4',
                                          style: TextStyle(
                                            color: Color(0xFF8D8D8D),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 158,
                                        top: 276,
                                        child: Text(
                                          'Weeks',
                                          style: TextStyle(
                                            color: Color(0xFF8D8D8D),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 11,
                                        top: 185,
                                        child: Transform(
                                          transform: Matrix4.identity()
                                            ..translate(0.0, 0.0)
                                            ..rotateZ(-1.57),
                                          child: const Text(
                                            'Hours in a day',
                                            style: TextStyle(
                                              color: Color(0xFF8D8D8D),
                                              fontSize: 10,
                                              fontFamily: 'Helvetica Neue',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 38,
                                        top: 227,
                                        child: Text(
                                          '4',
                                          style: TextStyle(
                                            color: Color(0xFF8D8D8D),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 38,
                                        top: 203,
                                        child: Text(
                                          '8',
                                          style: TextStyle(
                                            color: Color(0xFF8D8D8D),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 32,
                                        top: 179,
                                        child: Text(
                                          '12',
                                          style: TextStyle(
                                            color: Color(0xFF8D8D8D),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 32,
                                        top: 155,
                                        child: Text(
                                          '16',
                                          style: TextStyle(
                                            color: Color(0xFF8D8D8D),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 32,
                                        top: 131,
                                        child: Text(
                                          '20',
                                          style: TextStyle(
                                            color: Color(0xFF8D8D8D),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 32,
                                        top: 107,
                                        child: Text(
                                          '24',
                                          style: TextStyle(
                                            color: Color(0xFF8D8D8D),
                                            fontSize: 10,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 24,
                                        top: 24,
                                        child: Text(
                                          'Time Spent',
                                          style: TextStyle(
                                            color: Color(0xFF3A3A3A),
                                            fontSize: 18,
                                            fontFamily: 'Helvetica Neue',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 24,
                                        top: 75,
                                        child: Container(
                                          width: 100,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Completed time',
                                                style: TextStyle(
                                                  color: Color(0xFF3A3A3A),
                                                  fontSize: 10,
                                                  fontFamily: 'Helvetica Neue',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                ),
                                              ),
                                              const SizedBox(width: 18),
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration: ShapeDecoration(
                                                  color:
                                                      const Color(0xFF7BC683),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 24,
                                        top: 54,
                                        child: Container(
                                          width: 200,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Estimated Time',
                                                style: TextStyle(
                                                  color: Color(0xFF3A3A3A),
                                                  fontSize: 10,
                                                  fontFamily: 'Helvetica Neue',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0,
                                                ),
                                              ),
                                              const SizedBox(width: 23),
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration: ShapeDecoration(
                                                  color:
                                                      const Color(0xFFE8F5EA),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //--------------------------graphs end--------------------
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.only(bottom: 16),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.50, color: Color(0xFFAEAEAE)),
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120,
                                  padding: const EdgeInsets.only(
                                      top: 24, bottom: 16),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF2F2F2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x19000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Recent Activity',
                                              style: TextStyle(
                                                color: Color(0xFF3A3A3A),
                                                fontSize: 20,
                                                fontFamily: 'Helvetica Neue',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                            const SizedBox(width: 708),
                                            Container(
                                              child: const Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Sort',
                                                    style: TextStyle(
                                                      color: Color(0xFF7734CC),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      // textDecoration: TextDecoration.underline,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Project Title',
                                              style: TextStyle(
                                                color: Color(0xFF3A3A3A),
                                                fontSize: 16,
                                                fontFamily: 'Helvetica Neue',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                            const SizedBox(width: 48),
                                            const Text(
                                              'Team',
                                              style: TextStyle(
                                                color: Color(0xFF3A3A3A),
                                                fontSize: 16,
                                                fontFamily: 'Helvetica Neue',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                            const SizedBox(width: 48),
                                            const Text(
                                              'Progress Status',
                                              style: TextStyle(
                                                color: Color(0xFF3A3A3A),
                                                fontSize: 16,
                                                fontFamily: 'Helvetica Neue',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                            const SizedBox(width: 48),
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      width: 0.50,
                                                      color: Color(0xFF3A3A3A)),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'April',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Container(
                                                    width: 24,
                                                    height: 24,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          left: 0,
                                                          top: 0,
                                                          child: Container(
                                                            width: 24,
                                                            height: 24,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    color: Color(
                                                                        0xFFD9D9D9)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1084,
                                  height: 344,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 16),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        // height: 392,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .height,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 8),
                                              decoration: ShapeDecoration(
                                                color: const Color(0xFFEFE7F9),
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      width: 0.30,
                                                      color: Color(0xFFA071DB)),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                shadows: [
                                                  const BoxShadow(
                                                    color: Color(0x19A071DB),
                                                    blurRadius: 8,
                                                    offset: Offset(0, 4),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'User Research',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 40,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                const ShapeDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://via.placeholder.com/40x40"),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              shape: OvalBorder(
                                                                side: BorderSide(
                                                                    width: 1.50,
                                                                    color: Color(
                                                                        0xFFF9F4FF)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                const ShapeDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://via.placeholder.com/40x40"),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              shape: OvalBorder(
                                                                side: BorderSide(
                                                                    width: 1.50,
                                                                    color: Color(
                                                                        0xFFF9F4FF)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                const ShapeDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://via.placeholder.com/40x40"),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              shape: OvalBorder(
                                                                side: BorderSide(
                                                                    width: 1.50,
                                                                    color: Color(
                                                                        0xFFF9F4FF)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            decoration:
                                                                ShapeDecoration(
                                                              color: const Color(
                                                                  0xFF5B0BC1),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            80),
                                                              ),
                                                            ),
                                                            child: const Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  '+3',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFFEBEBEB),
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        'Helvetica Neue',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Completed',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF3A3A3A),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Container(
                                                          width: 261,
                                                          height: 8,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFFEFE7F9),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 261,
                                                                height: 8,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: const Color(
                                                                      0xFF1B9D2A),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Text(
                                                    '4/4/22',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .height,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 8),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      width: 0.30,
                                                      color: Color(0xFFAEAEAE)),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'User Persona',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 40,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                const ShapeDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://via.placeholder.com/40x40"),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              shape: OvalBorder(
                                                                side: BorderSide(
                                                                    width: 1.50,
                                                                    color: Color(
                                                                        0xFFF9F4FF)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                const ShapeDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://via.placeholder.com/40x40"),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              shape: OvalBorder(
                                                                side: BorderSide(
                                                                    width: 1.50,
                                                                    color: Color(
                                                                        0xFFF9F4FF)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                const ShapeDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://via.placeholder.com/40x40"),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              shape: OvalBorder(
                                                                side: BorderSide(
                                                                    width: 1.50,
                                                                    color: Color(
                                                                        0xFFF9F4FF)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            decoration:
                                                                ShapeDecoration(
                                                              color: const Color(
                                                                  0xFF5B0BC1),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            80),
                                                              ),
                                                            ),
                                                            child: const Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  '+2',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFFEBEBEB),
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        'Helvetica Neue',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Completed',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF3A3A3A),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Container(
                                                          width: 261,
                                                          height: 8,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFFEFE7F9),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 261,
                                                                height: 8,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: const Color(
                                                                      0xFF1B9D2A),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Text(
                                                    '4/4/22',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .height,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 8),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      width: 0.30,
                                                      color: Color(0xFFAEAEAE)),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'User Persona',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 40,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                const ShapeDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://via.placeholder.com/40x40"),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              shape: OvalBorder(
                                                                side: BorderSide(
                                                                    width: 1.50,
                                                                    color: Color(
                                                                        0xFFF9F4FF)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                const ShapeDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://via.placeholder.com/40x40"),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              shape: OvalBorder(
                                                                side: BorderSide(
                                                                    width: 1.50,
                                                                    color: Color(
                                                                        0xFFF9F4FF)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                const ShapeDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://via.placeholder.com/40x40"),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              shape: OvalBorder(
                                                                side: BorderSide(
                                                                    width: 1.50,
                                                                    color: Color(
                                                                        0xFFF9F4FF)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            decoration:
                                                                ShapeDecoration(
                                                              color: const Color(
                                                                  0xFF5B0BC1),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            80),
                                                              ),
                                                            ),
                                                            child: const Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  '+4',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFFEBEBEB),
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        'Helvetica Neue',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Ongoing',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF3A3A3A),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Container(
                                                          width: 261,
                                                          height: 8,
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 64),
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFFEFE7F9),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 197,
                                                                height: 8,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: const Color(
                                                                      0xFF0A4FC7),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Text(
                                                    '4/4/22',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .height,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 8),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      width: 0.30,
                                                      color: Color(0xFFAEAEAE)),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'User Persona',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 40,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                const ShapeDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://via.placeholder.com/40x40"),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              shape: OvalBorder(
                                                                side: BorderSide(
                                                                    width: 1.50,
                                                                    color: Color(
                                                                        0xFFF9F4FF)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                const ShapeDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://via.placeholder.com/40x40"),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              shape: OvalBorder(
                                                                side: BorderSide(
                                                                    width: 1.50,
                                                                    color: Color(
                                                                        0xFFF9F4FF)),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                const ShapeDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://via.placeholder.com/40x40"),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                              shape: OvalBorder(
                                                                side: BorderSide(
                                                                    width: 1.50,
                                                                    color: Color(
                                                                        0xFFF9F4FF)),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Completed',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF3A3A3A),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Container(
                                                          width: 261,
                                                          height: 8,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFFEFE7F9),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 261,
                                                                height: 8,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: const Color(
                                                                      0xFF1B9D2A),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Text(
                                                    '4/4/22',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .height,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 8),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      width: 0.30,
                                                      color: Color(0xFFAEAEAE)),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'User Persona',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: NetworkImage(
                                                                  "https://via.placeholder.com/40x40"),
                                                              fit: BoxFit.fill,
                                                            ),
                                                            shape: OvalBorder(
                                                              side: BorderSide(
                                                                  width: 1.50,
                                                                  color: Color(
                                                                      0xFFF9F4FF)),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: NetworkImage(
                                                                  "https://via.placeholder.com/40x40"),
                                                              fit: BoxFit.fill,
                                                            ),
                                                            shape: OvalBorder(
                                                              side: BorderSide(
                                                                  width: 1.50,
                                                                  color: Color(
                                                                      0xFFF9F4FF)),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: NetworkImage(
                                                                  "https://via.placeholder.com/40x40"),
                                                              fit: BoxFit.fill,
                                                            ),
                                                            shape: OvalBorder(
                                                              side: BorderSide(
                                                                  width: 1.50,
                                                                  color: Color(
                                                                      0xFFF9F4FF)),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 40,
                                                          height: 40,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16),
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFF5B0BC1),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          80),
                                                            ),
                                                          ),
                                                          child: const Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                '+2',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xFFEBEBEB),
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'Helvetica Neue',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Completed',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF3A3A3A),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Container(
                                                          width: 261,
                                                          height: 8,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFFEFE7F9),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 261,
                                                                height: 8,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: const Color(
                                                                      0xFF1B9D2A),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Text(
                                                    '4/4/22',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .height,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 8),
                                              decoration: ShapeDecoration(
                                                color: const Color(0xFFEFE7F9),
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      width: 1,
                                                      color: Color(0xFFA071DB)),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                shadows: [
                                                  const BoxShadow(
                                                    color: Color(0x19A071DB),
                                                    blurRadius: 8,
                                                    offset: Offset(0, 4),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'User Research',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: NetworkImage(
                                                                  "https://via.placeholder.com/40x40"),
                                                              fit: BoxFit.fill,
                                                            ),
                                                            shape: OvalBorder(
                                                              side: BorderSide(
                                                                  width: 1.50,
                                                                  color: Color(
                                                                      0xFFF9F4FF)),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: NetworkImage(
                                                                  "https://via.placeholder.com/40x40"),
                                                              fit: BoxFit.fill,
                                                            ),
                                                            shape: OvalBorder(
                                                              side: BorderSide(
                                                                  width: 1.50,
                                                                  color: Color(
                                                                      0xFFF9F4FF)),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              const ShapeDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: NetworkImage(
                                                                  "https://via.placeholder.com/40x40"),
                                                              fit: BoxFit.fill,
                                                            ),
                                                            shape: OvalBorder(
                                                              side: BorderSide(
                                                                  width: 1.50,
                                                                  color: Color(
                                                                      0xFFF9F4FF)),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 40,
                                                          height: 40,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16),
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFF5B0BC1),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          80),
                                                            ),
                                                          ),
                                                          child: const Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                '+3',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xFFEBEBEB),
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'Helvetica Neue',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Completed',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF3A3A3A),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Helvetica Neue',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Container(
                                                          width: 261,
                                                          height: 8,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFFEFE7F9),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 261,
                                                                height: 8,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: const Color(
                                                                      0xFF1B9D2A),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Text(
                                                    '4/4/22',
                                                    style: TextStyle(
                                                      color: Color(0xFF3A3A3A),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Helvetica Neue',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

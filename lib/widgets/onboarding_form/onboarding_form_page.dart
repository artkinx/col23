import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:klusterthon/core/helper/constant_var_helper.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OnboardingFormPage extends StatefulWidget {
  const OnboardingFormPage({
    super.key,
    this.text1,
    this.text2,
    this.text3,
    this.btnText,
    this.buttonColor = primaryColor,
    this.secondaryBtnTextColor = primaryColor,
    required this.body,
    required this.title,
    this.text4,
    this.onMainButtonClick,
    this.useBodyAlone = false,
  });
  final String? text1, text2, text3, text4, btnText;
  final String title;
  final Color buttonColor, secondaryBtnTextColor;
  final List<Widget> body;
  final Function()? onMainButtonClick;
  final bool useBodyAlone;

  @override
  State<OnboardingFormPage> createState() => _OnboardingFormPageState();
}

class _OnboardingFormPageState extends State<OnboardingFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width / 3),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg2.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(royalBlueColor, BlendMode.hardLight)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logos/edlogo.png",
            height: 40,
          ),
          const SizedBox(
            height: 44,
          ),
          Card(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: widget.body,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: !widget.useBodyAlone,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6,
                                  child: Checkbox(
                                    splashRadius: 7,
                                    visualDensity: VisualDensity.compact,
                                    value: true,
                                    onChanged: (v) {},
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Visibility(
                                  visible: widget.text1 != null,
                                  child: Text(
                                    widget.text1 ?? "",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible:
                                widget.text2 != null && !widget.useBodyAlone,
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                widget.text2 ?? "",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 44,
                        child: EasyButton(
                          buttonColor: primaryColor,

                          onPressed: widget.onMainButtonClick == null
                              ? null
                              : () async {
                                  await widget.onMainButtonClick?.call();
                                },
                          // style: ElevatedButton.styleFrom(
                          //     backgroundColor: widget.buttonColor,
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(10))),
                          loadingStateWidget: LoadingAnimationWidget.beat(
                              color: Colors.white, size: 18),
                          idleStateWidget: Text(
                            widget.btnText ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !widget.useBodyAlone,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Visibility(
                                  visible: widget.text3 != null,
                                  child: Text(
                                    widget.text3 ?? "s",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Visibility(
                                      visible: widget.text4 != null,
                                      child: Text(
                                        widget.text4 ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: widget
                                                    .secondaryBtnTextColor,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    height: 20,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 10.0),
                                  child: Text("or"),
                                ),
                                Expanded(
                                  child: Divider(
                                    height: 20,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            SizedBox(
                              height: 45,
                              child: EasyButton(
                                  type: EasyButtonType.outlined,
                                  buttonColor: primaryColor,
                                  onPressed: () {},
                                  loadingStateWidget:
                                      LoadingAnimationWidget.beat(
                                          color: Colors.white, size: 15),
                                  idleStateWidget: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Logo(
                                        Logos.google,
                                        size: 25,
                                      )
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              "2023 COL23. All Rights Reserved",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey[500]),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

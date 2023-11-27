import 'package:flutter/material.dart';
import 'package:klusterthon/core/helper/constant_var_helper.dart';
import 'package:klusterthon/widgets/onboarding_form/onboarding_form_page.dart';

class TrackSelectionPage extends StatefulWidget {
  const TrackSelectionPage({super.key});

  @override
  State<TrackSelectionPage> createState() => _TrackSelectionPageState();
}

class _TrackSelectionPageState extends State<TrackSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingFormPage(
        title: "Register",
        btnText: "Continue",
        useBodyAlone: true,
        body: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(color: greyColor),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Track"),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: DropdownButtonFormField(
                        onChanged: (v) {},
                        items: const [
                          DropdownMenuItem(
                              value: "AI/ML", child: Text("AI/ML")),
                          DropdownMenuItem(
                              value: "UX Designer", child: Text("UX Designer")),
                          DropdownMenuItem(
                              value: "Software Engineer",
                              child: Text("Software Engineer")),
                        ],
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 9, vertical: 0),
                            border: OutlineInputBorder()),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Experience Level"),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: DropdownButtonFormField(
                        onChanged: (v) {},
                        items: const [
                          DropdownMenuItem(
                              value: "Beginner", child: Text("Beginner")),
                          DropdownMenuItem(
                              value: "Intermediate",
                              child: Text("Intermediate")),
                          DropdownMenuItem(
                              value: "Senior", child: Text("Senior")),
                        ],
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 9, vertical: 0),
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Skill Preferences for Collaboration",
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: const BoxDecoration(
              color: greyColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 110,
                  width: double.infinity,
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 16 / 9,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              style: BorderStyle.solid,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              width: 0,
                              color: Colors.grey),
                        ),
                        child: Text(
                          "UI/UX Design",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                style: BorderStyle.solid,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                width: 0,
                                color: Colors.grey)),
                        child: Text(
                          "UI/UX Design",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                style: BorderStyle.solid,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                width: 0,
                                color: Colors.grey)),
                        child: Text(
                          "UI/UX Design",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                style: BorderStyle.solid,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                width: 0,
                                color: Colors.grey)),
                        child: Text(
                          "UI/UX Design",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

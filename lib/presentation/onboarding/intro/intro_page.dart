import 'package:flutter/material.dart';
import 'package:klusterthon/core/helper/constant_var_helper.dart';
import 'package:klusterthon/widgets/intro_card.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool showGetStarted = false;
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();

    controller.addListener(() {
      print(controller.positions.toList().indexOf(controller.position));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 67, 0, 88).withOpacity(0.8),
          image: const DecorationImage(
            image: AssetImage('assets/bg1.jpeg'),
            opacity: 0.6,
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logos/edlogo.png",
              height: 60,
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              margin: const EdgeInsets.only(right: 13, left: 13),
              padding: const EdgeInsets.fromLTRB(2, 30, 30, 30),
              height: MediaQuery.sizeOf(context).height / 3.5,
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(32),
              ),
              child: ListView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    showGetStarted = index == 3 ? true : false;
                    return const IntroCard();
                  }),
            ),
            if (showGetStarted)
              ElevatedButton(
                  onPressed: () {}, child: const Text("Get Started")),
          ],
        ),
      ),
    );
  }
}

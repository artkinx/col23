import 'package:flutter/material.dart';
import 'package:klusterthon/core/helper/constant_var_helper.dart';
import 'package:klusterthon/widgets/menu/menu_item.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(12, 40, 12, 9),
              width: 308,
              height: MediaQuery.sizeOf(context).height,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/logos/edlogo.png",
                          color: primaryColor,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        MenuItem(
                          title: "Overview",
                          isActive: true,
                        ),
                        MenuItem(
                          title: "Pair Generator",
                        ),
                        MenuItem(
                          title: "Notification",
                        ),
                        MenuItem(
                          title: "Feedback",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

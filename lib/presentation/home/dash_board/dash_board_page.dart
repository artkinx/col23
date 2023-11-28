import 'package:flutter/material.dart';
import 'package:klusterthon/core/helper/constant_var_helper.dart';
import 'package:klusterthon/widgets/menu/menu_item.dart';

import '../../../widgets/charts/bar_chart.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(12, 40, 12, 9),
                width: 308,
                height: MediaQuery.sizeOf(context).height,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
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
              ),
              //-----------------body-------------------
              Expanded(
                child: Column(
                  children: [
                    //-------------------topbar---------------------
                    Container(
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                      width: MediaQuery.sizeOf(context).width,
                      height: 100,
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(1, 1),
                          spreadRadius: 0,
                        )
                      ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 43,
                            width: MediaQuery.sizeOf(context).width / 2,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Search",
                                suffix: Icon(
                                  Icons.search,
                                  size: 17,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Dera Williams"),
                                  Text("Ui/Ux Designer"),
                                ],
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  const CircleAvatar(),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFF7EAB17),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    //---------------------main body---------------------
                    Container(
                      height: MediaQuery.sizeOf(context).height - 100,
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //---------------sub top--------------------
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hi Dera, Welcome Back!",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 18),
                              ),
                              Text(
                                "How can we help you?",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(fontSize: 16, color: greyColor2),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 34,
                          ),
                          Wrap(
                            spacing: 50,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              Container(
                                width: 346,
                                height: 306,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 19),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFFFF8E7),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.50, color: Color(0xFFFFEFC2)),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                ),
                                child: BarChartSample1(),
                              ),
                              Container(
                                width: 346,
                                height: 306,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 19),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: blueLightColor,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.50, color: blueColor),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                ),
                              ),
                              Container(
                                width: 346,
                                height: 306,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 19),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: lightGreenColor,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      width: 0.50,
                                      color: greenColor,
                                    ),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

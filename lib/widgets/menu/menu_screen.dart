import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:klusterthon/app_routes.dart';
import 'package:klusterthon/core/helper/constant_var_helper.dart';
import 'package:klusterthon/core/services/navigation_service.dart';
import 'package:klusterthon/widgets/menu/bloc/drawer_menu_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.amber,
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SvgPicture.asset(
            "assets/logos/logomainlogo.svg",
            color: primaryColor,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            dense: true,
            title: const Text("Home Page"),
            leading: const Icon(Icons.home),
            onTap: () {
              //action when this menu is pressed
            },
          ),
          ListTile(
            dense: true,
            title: const Text("My Profile"),
            leading: const Icon(Icons.person),
            onTap: () {
              //action when this menu is pressed
            },
          ),
          ListTile(
            dense: true,
            title: const Text("My Orders"),
            leading: const Icon(Icons.add_box),
            onTap: () {
              //action when this menu is pressed
            },
          ),
          ListTile(
            dense: true,
            title: const Text("My Favourites"),
            leading: const Icon(Icons.monitor_heart),
            onTap: () {
              //action when this menu is pressed
              var bloc = context.read<DrawerMenuBloc>();

              bloc.add(NavToScreenEvent(2));
            },
          )
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:klusterthon/core/helper/constant_var_helper.dart';
import 'package:klusterthon/presentation/home/dash_board/dash_board_page.dart';
import 'package:klusterthon/widgets/menu/bloc/drawer_menu_bloc.dart';
import 'package:klusterthon/widgets/menu/menu_screen.dart';

sealed class DrawerProps {
  static Widget build(BuildContext context) {
    return BlocConsumer<DrawerMenuBloc, DrawerMenuState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ZoomDrawer(
          controller: context.read<DrawerMenuBloc>().state.drawerController,
          menuScreen: const MenuScreen(),
          mainScreen: state.pages[state.currentPage ?? 0],
          borderRadius: 24.0,
          mainScreenTapClose: true,
          showShadow: true,
          angle: 0.0,
          drawerShadowsBackgroundColor: Colors.grey[300]!,
          slideWidth: MediaQuery.of(context).size.width * 0.65,
        );
      },
    );
  }
}

class DrawerMenuWidget extends DrawerProps {
  static Widget drawer = Drawer(
    width: 230,
    child: SafeArea(
        child: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          "assets/logos/edlogo.png",
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
          },
        )
      ],
    )),
  );

  static Widget of(BuildContext context) {
    return DrawerProps.build(context);
  }
}

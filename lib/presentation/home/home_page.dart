import 'package:flutter/material.dart';
import 'package:klusterthon/widgets/menu/drawe_menu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DrawerMenuWidget.of(context);
  }
}

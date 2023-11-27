part of 'drawer_menu_bloc.dart';

@immutable
sealed class DrawerMenuEvent {}

class ToggleDrawerEvent extends DrawerMenuEvent {
  ToggleDrawerEvent();
}

class NavToScreenEvent extends DrawerMenuEvent {
  final int newScreen;

  NavToScreenEvent(this.newScreen);
}

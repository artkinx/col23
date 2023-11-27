import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:klusterthon/presentation/home/dash_board/dash_board_page.dart';
import 'package:klusterthon/presentation/onboarding/login_screen/login_screen_page.dart';
import 'package:klusterthon/presentation/onboarding/track_selection/track_selection_page.dart';

part 'drawer_menu_event.dart';
part 'drawer_menu_state.dart';

class DrawerMenuBloc extends Bloc<DrawerMenuEvent, DrawerMenuState> {
  DrawerMenuBloc() : super(DrawerMenuInitial()) {
    on<ToggleDrawerEvent>(_drawerMenuToggle);
    on<NavToScreenEvent>(_drawerNavToScreen);
  }

  _drawerMenuToggle(ToggleDrawerEvent event, Emitter<DrawerMenuState> emit) {
    state.drawerController.toggle?.call();
  }

  _drawerNavToScreen(NavToScreenEvent event, Emitter<DrawerMenuState> emit) {
    DrawerMenuState runEmit() {
      var newState = state.copyWith(event.newScreen);
      state.drawerController.toggle?.call();
      return newState;
    }

    emit(runEmit());
  }
}

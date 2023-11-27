part of 'drawer_menu_bloc.dart';

@immutable
sealed class DrawerMenuState {
  final ZoomDrawerController drawerController = ZoomDrawerController();
  final int? initPage;
  final int? currentPage;
  final List<Widget> pages = [
    const DashBoardPage(),
    const LoginScreenPage(),
    const TrackSelectionPage(),
  ];

  DrawerMenuState(this.currentPage, {this.initPage = 0});

  DrawerMenuState copyWith(int? currentPage);
}

final class DrawerMenuInitial extends DrawerMenuState {
  DrawerMenuInitial({int? currentPage}) : super(currentPage);

  @override
  DrawerMenuState copyWith(int? currentPage) {
    return DrawerMenuInitial(currentPage: currentPage);
  }
}

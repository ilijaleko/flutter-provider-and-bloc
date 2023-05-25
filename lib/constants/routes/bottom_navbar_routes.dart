import 'package:flutter/material.dart';

import '../../shared/models/layout/bottom_navbar_model.dart';
import 'routes.dart';

class BottomNavbarRoutes {
  static final List<BottomNavbarItemModel> _routes = [
    BottomNavbarItemModel(
      route: Routes.provider,
      navbarItem: const BottomNavigationBarItem(
        icon: Icon(Icons.self_improvement_sharp),
        label: "Provider",
      ),
    ),
    BottomNavbarItemModel(
      route: Routes.blocExample1,
      navbarItem: const BottomNavigationBarItem(
        icon: Icon(Icons.rectangle_outlined),
        label: "Bloc",
      ),
    ),
  ];

  static List<BottomNavbarItemModel> get routes => _routes;
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/routes/routes.dart';
import 'providers/university_provider.dart';
import 'screens/bloc_screen/posts_screen.dart';
import 'screens/provider_screen/universities_screen.dart';
import 'shared/widgets/bottom_navbar_widget/bottom_navbar_widget.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final routerConfig = GoRouter(
    initialLocation: Routes.provider,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return Scaffold(
              backgroundColor: Colors.white,
              bottomNavigationBar: const BottomNavbarWidget(),
              body: ChangeNotifierProvider(
                create: (context) {
                  // Return the provider and call the getUniversities (initial load)
                  return UniversityProvider()..getUniversities();
                },
                child: child,
              ));
        },
        routes: [
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: Routes.provider,
              pageBuilder: (context, state) => const NoTransitionPage(
                    child: UniversitiesScreenWidget(),
                  )),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: Routes.blocExample1,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: PostsScreen())),
        ],
      ),
    ],
  );
}

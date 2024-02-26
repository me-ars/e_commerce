import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping/Pages/Cart.dart';
import '../pages/home.dart';
import '../wrapper/Wrapper.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = "/home";
  // pvt navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome =
  GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorSettings =
  GlobalKey<NavigatorState>(debugLabel: 'shellcart');

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Branch Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: "/home",
                name: "Home",
                builder: (BuildContext context, GoRouterState state) =>
                const HomePage(),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettings,
            routes: <RouteBase>[
              GoRoute(
                path: "/cart",
                name: "Cart",
                builder: (BuildContext context, GoRouterState state) =>
                const Cart(),
              ),
            ],
          ),
        ],
      ),

    ],
  );
}

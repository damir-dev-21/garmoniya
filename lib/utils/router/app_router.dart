import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:garmoniya_pharm/presentation/home_page/pages/filter_page.dart';
import 'package:garmoniya_pharm/presentation/news_page/news_page.dart';
import 'package:garmoniya_pharm/presentation/splash_page/splash_page.dart';

import '../../presentation/cart_page/cart_page.dart';
import '../../presentation/home_page/home_page.dart';
import '../../presentation/login_page/login_page.dart';
import '../../presentation/navigator_handler/navigator_handler.dart';
import '../../presentation/network_disabled_page/netword_disabled_page.dart';
import '../../presentation/onload_page/onload_page.dart';
import '../../presentation/orders_page/orders_page.dart';
import '../../presentation/product_page/product_page.dart';
import '../../presentation/profle_page/profile_page.dart';
import 'navigator_keys.dart';
import 'route_utils.dart';

class AppRouter {
  GoRouter get router => _goRouter;

  AppRouter();

  late final GoRouter _goRouter = GoRouter(
    navigatorKey: NavigatorKeys.rootNavigatorKey,
    initialLocation: AppRoutes.profile.toPath,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, child) => WillPopScope(
              onWillPop: () async {
                final NavigatorState? currentState =
                    NavigatorKeys.rootNavigatorKey.currentState;
                final bool canPop =
                    NavigatorKeys.rootNavigatorKey.currentState!.canPop();
                if (currentState != null && canPop) {
                  return true;
                } else {
                  context.goNamed(AppRoutes.home.toName);
                }
                return false;
              },
              child: ScaffoldWithBottomNavBar(child: child)),
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                  path: AppRoutes.home.toPath,
                  name: AppRoutes.home.toName,
                  builder: (context, state) => HomePage()),
              GoRoute(
                  path: AppRoutes.orders.toPath,
                  name: AppRoutes.orders.toName,
                  builder: (context, state) => OrdersPage()),
              GoRoute(
                  path: AppRoutes.news.toPath,
                  name: AppRoutes.news.toName,
                  builder: (context, state) => NewsPage()),
              GoRoute(
                  path: AppRoutes.cart.toPath,
                  name: AppRoutes.cart.toName,
                  builder: (context, state) => CartPage()),
              GoRoute(
                  path: AppRoutes.profile.toPath,
                  name: AppRoutes.profile.toName,
                  builder: (context, state) => ProfilePage()),
            ])
          ]),
      GoRoute(
          path: AppRoutes.product.toPath,
          name: AppRoutes.product.toName,
          // parentNavigatorKey: NavigatorKeys.rootNavigatorKey,
          builder: (context, state) {
            // Map<String, dynamic> data = state.extra as Map<String, dynamic>;
            // final product = data['product'];
            // final isaddition = data['isaddition'];
            // final manageCountVisible = data['manageCountVisible'];
            return ProductPage(
                // product: product,
                // isaddition: isaddition,
                );
          }),
      GoRoute(
          path: AppRoutes.onload.toPath,
          name: AppRoutes.onload.toName,
          builder: (context, state) => OnLoadPage()),

      GoRoute(
          path: AppRoutes.login.toPath,
          name: AppRoutes.login.toName,
          builder: (context, state) => LoginPage()),
      GoRoute(
          path: AppRoutes.networkDisabled.toPath,
          name: AppRoutes.networkDisabled.toName,
          builder: (context, state) => NetworkDisabledPage()),
      GoRoute(
          path: AppRoutes.splash.toPath,
          name: AppRoutes.splash.toName,
          builder: (context, state) => SplashPage()),
      // GoRoute(
      //     path: AppRoutes.networkDisabled.toPath,
      //     name: AppRoutes.networkDisabled.toName,
      //     builder: (context, state) => NetworkDisabledPage()),
    ],
  );
}

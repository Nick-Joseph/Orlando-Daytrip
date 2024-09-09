import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orlando_daytrip/src/routing/not_found_screen.dart';

enum AppRoute {
  home,
  search,
  notifications,
  map,
  bookmarks,
  addStory,
  account,
  signIn,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => NotFoundScreen(),
      // builder: (context, state) => const ProductsListScreen(),
    )
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:orlando_daytrip/src/features/boomarkspage/bookmarksPage.dart';
import 'package:orlando_daytrip/src/features/curatePage/curatepage.dart';
import 'package:orlando_daytrip/src/features/discoverPage/discover_page.dart';
import 'package:orlando_daytrip/src/features/followingPage/following_page.dart';
import 'package:orlando_daytrip/src/features/homepage/presentation/lists/homepage_list_page.dart';
import 'package:orlando_daytrip/src/features/mappage/map_page.dart';
import 'package:orlando_daytrip/src/features/profilepage/profilePage.dart';
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
  following,
  discover,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  final _shellNavigatorMapKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellMap');
  final _shellNavigatorCurateKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellCurate');
  final _shellNavigatorDaylogKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellDaylog');
  final _shellNavigatorBookmarkKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellBookmark');
  final _shellNavigatorProfileKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellProfile');
  // final listenable = ref.watch(appRouterListenableProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    navigatorKey: _rootNavigatorKey,
    // refreshListenable: listenable,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          // first branch (A)
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomepageListPage()),
                routes: [
                  // child route
                  GoRoute(
                    path: 'following',
                    builder: (context, state) => const FollowingPage(),
                  ),
                  GoRoute(
                    path: 'discover',
                    builder: (context, state) => const DiscoverPage(),
                  ),
                ],
              ),
            ],
          ),
          // second branch (B)
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMapKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/map',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: MapPage(),
                ),
                routes: [
                  // child route
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCurateKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/addStory',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Curatepage(),
                ),
                routes: [
                  // child route
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBookmarkKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/bookmarks',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: BookmarksPage(),
                ),
                routes: [
                  // child route
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: '/profile',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Profilepage(),
                ),
                routes: [
                  // child route
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

// use like this:
// MaterialApp.router(routerConfig: goRouter, ...)
//   GoRoute(
//       path: '/',
//       name: AppRoute.home.name,
//       builder: (context, state) => const HomepageListPage(),
//       routes: [
//         GoRoute(
//           path: 'following',
//           name: AppRoute.following.name,
//           pageBuilder: (context, state) => const MaterialPage(
//             // fullscreenDialog: true,
//             child: FollowingPage(),
//           ),
//         ),
//         GoRoute(
//           path: 'discover',
//           name: AppRoute.discover.name,
//           pageBuilder: (context, state) => const MaterialPage(
//             // fullscreenDialog: true,
//             child: DiscoverPage(),
//           ),
//         ),
//       ])
// ],
// errorBuilder: (context, state) => const NotFoundScreen(),
// Stateful nested navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
          NavigationDestination(label: 'Map', icon: Icon(Icons.map)),
          NavigationDestination(label: '', icon: Icon(Icons.add_box_rounded)),
          NavigationDestination(label: 'Bookmarks', icon: Icon(Icons.bookmark)),
          NavigationDestination(label: 'Profile', icon: Icon(Icons.person)),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}

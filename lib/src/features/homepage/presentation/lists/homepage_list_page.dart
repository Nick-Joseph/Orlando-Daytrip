import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:orlando_daytrip/src/common_widget/empty_placeholder_widget.dart';
import 'package:orlando_daytrip/src/features/discoverPage/discover_page.dart';
import 'package:orlando_daytrip/src/features/followingPage/following_page.dart';
import 'package:orlando_daytrip/src/features/homepage/presentation/home_app_bar/home_app_bar.dart';
import 'package:orlando_daytrip/src/features/homepage/presentation/home_app_bar/notifications_button.dart';
import 'package:orlando_daytrip/src/localizations/string_hardcoded.dart';
import 'package:orlando_daytrip/src/routing/app_router.dart';

final countProvider = StateProvider<int>((ref) => 0);

/// Homepage list screen
class HomepageListPage extends ConsumerWidget {
  const HomepageListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: HomeAppBar(),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Center(
              child: Center(
                child: Column(
                  children: [
                    Text('$count'),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              ref.read(countProvider.notifier).update(
                                    (state) => state + 1,
                                  );
                            },
                            child: Text('Increment')),
                        ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(countProvider.notifier)
                                  .update((state) => state - 1);
                            },
                            child: Text('Decrement'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            FollowingPage(),
            DiscoverPage(),
          ],
        ),
      ),
    );
  }
}

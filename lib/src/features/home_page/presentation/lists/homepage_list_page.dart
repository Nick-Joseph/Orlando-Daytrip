import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orlando_daytrip/src/features/discoverPage/discover_page.dart';
import 'package:orlando_daytrip/src/features/following_page/following_page.dart';
import 'package:orlando_daytrip/src/features/home_page/presentation/home_app_bar/home_app_bar.dart';
import 'package:orlando_daytrip/src/features/home_page/presentation/home_widgets/calender_widget.dart';
import 'package:orlando_daytrip/src/features/home_page/presentation/home_widgets/custom_carousel_view.dart';

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
            Column(
              children: [
                const Row(
                  children: [
                    Text('Recent Articles',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                        onPressed: null,
                        icon: Icon(Icons.chevron_right, color: Colors.black)),
                  ],
                ),
                SizedBox(
                  height: 240,
                  child: CustomCarouselView(),
                ),
                const Row(
                  children: [
                    Text('Upcoming Events',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                        onPressed: null,
                        icon: Icon(Icons.chevron_right, color: Colors.black)),
                  ],
                ),
                CustomDateBar(),
              ],
            ),
            FollowingPage(),
            DiscoverPage(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:orlando_daytrip/src/common_widget/contant.dart';

import 'package:orlando_daytrip/src/features/discoverPage/discover_page.dart';
import 'package:orlando_daytrip/src/features/followingPage/following_page.dart';
import 'package:orlando_daytrip/src/features/homepage/presentation/home_app_bar/home_app_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
                  child: CarouselView(
                    padding: const EdgeInsets.all(0),
                    shrinkExtent: 200,
                    itemExtent: 200,
                    shape: const RoundedRectangleBorder(),
                    children: articles
                        .map(
                          (article) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(article.image),
                                    fit: BoxFit.cover),
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.bookmark_outline_outlined,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      article.author,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      article.title,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    // children: List.generate(4, (int index) {
                    //   return Image.asset('assets/paris.jpeg');
                    // }),
                  ),
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
                SfCalendar(
                  view: CalendarView.week,
                  selectionDecoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    shape: BoxShape.rectangle,
                  ),
                ),
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

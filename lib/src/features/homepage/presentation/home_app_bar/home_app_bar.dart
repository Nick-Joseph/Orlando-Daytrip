import 'package:flutter/material.dart';
import 'package:orlando_daytrip/src/features/homepage/presentation/home_app_bar/notifications_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Row(
        children: [
          // Adds spacing between title and TabBar
          TabBar(
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.zero,
            isScrollable: true, // Tabs can be scrollable

            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Following'),
              Tab(text: 'Discover'),
            ],
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3.0, // Thickness of the underline
                color: Colors.black, // Color of the underline
              ),
              // Padding from sides
            ),
            labelColor: Colors.black, // Active tab text color
            unselectedLabelColor: Colors.grey, // Inactive tab text color
            labelStyle: TextStyle(
              fontSize: 18.0, // Increase active tab text size
              fontWeight: FontWeight.bold, // Optional: Make the active tab bold
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 16.0, // Set unselected tab text size
            ),
          ),
        ],
      ),
      toolbarHeight: 50,
      actions: const [
        NotificationButton(),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.search,
            color: Colors.black,
            size: 35,
          ),
        )
      ], // Adjust this based on how much space you need
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

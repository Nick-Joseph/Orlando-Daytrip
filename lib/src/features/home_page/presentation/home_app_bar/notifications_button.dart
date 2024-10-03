import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Badge.count(
        count: 999,
        child: const Icon(
          Icons.notifications_none_outlined,
          color: Colors.black,
          size: 35,
        ),
      ),
      onPressed: null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:orlando_daytrip/src/common_widget/empty_placeholder_widget.dart';
import 'package:orlando_daytrip/src/localizations/string_hardcoded.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EmptyPlaceholderWidget(
        message: 'Booksmarks PAGE'.hardcoded,
      ),
    );
  }
}

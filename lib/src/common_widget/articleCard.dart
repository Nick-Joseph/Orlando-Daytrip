import 'package:flutter/material.dart';

abstract class CarouselItem {
  String get title;
  String get articleTitle;
  String get backgroundImage;

  Widget display();
}

class UserCarouselItem extends CarouselItem {
  @override
  final String title;
  @override
  final String articleTitle;
  @override
  final String backgroundImage;
  UserCarouselItem({
    required this.title,
    required this.articleTitle,
    required this.backgroundImage,
  });

  @override
  Widget display() {
    // TODO: implement display
    print(UnimplementedError());
    throw UnimplementedError();
  }
}

@override
Widget display() {
  ImageProvider backgroundImage =
      Image.asset('assets/paris.jpeg') as ImageProvider<Object>;
  String articleTitle = "Paris";
  String userName = "John Doe";
  return Stack(
    children: [
      // Background Image
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage, // Assuming image is a URL
            fit: BoxFit.cover,
          ),
        ),
      ),
      // Overlay with article title and user name
      Container(
        color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              articleTitle,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "By $userName",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

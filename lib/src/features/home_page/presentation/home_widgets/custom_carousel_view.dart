import 'package:flutter/material.dart';
import 'package:orlando_daytrip/src/common_widget/contant.dart';

class CustomCarouselView extends StatelessWidget {
  const CustomCarouselView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselView(
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
                      image: AssetImage(article.image), fit: BoxFit.cover),
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
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        article.title,
                        style: TextStyle(color: Colors.white, fontSize: 16),
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
    );
  }
}

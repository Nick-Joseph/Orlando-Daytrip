import 'package:flutter/material.dart';
import 'package:orlando_daytrip/src/common_widget/contant.dart';

class CustomDateBar extends StatelessWidget {
  final List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  final int selectedDayIndex = 3; // You can update this dynamically

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            itemBuilder: (context, index) {
              bool isSelected = selectedDayIndex == index;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    // Handle tap to update selected day
                  },
                  child: CircleAvatar(
                    backgroundColor: isSelected ? Colors.black : Colors.white,
                    child: Text(
                      days[index],
                      style: isSelected
                          ? TextStyle(color: Colors.white)
                          : TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        ListView.builder(
            itemCount: 1,
            shrinkWrap: true,
            reverse:
                true, // because list show low to high so reverse use to show high to low value and shrink wrap adjust its size use as you want to show and adjust it
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                    height: 150,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(articles[1].image),
                        ),
                        Column(
                          children: [
                            Text(articles[1].title),
                            Text(articles[1].author),
                          ],
                        )
                      ],
                    )),
              );
            }),
      ],
    );
  }
}

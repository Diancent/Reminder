import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:reminder/models/list_horizontal.dart';

class CarouselList extends StatelessWidget {
  const CarouselList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 72,
        aspectRatio: 16 / 9,
        viewportFraction: 0.26,
        initialPage: 1,
        enableInfiniteScroll: false,
        reverse: false,
        scrollDirection: Axis.horizontal,
      ),
      items: [0, 1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return firstSwipe[i];
          },
        );
      }).toList(),
    );
  }
}

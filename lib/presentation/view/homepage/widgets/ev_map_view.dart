import 'package:carousel_slider/carousel_slider.dart';
import 'package:evcompanion2/presentation/view/homepage/widgets/homepage_ev_card.dart';
import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CarouselSlider.builder(
          itemCount: 1,
          itemBuilder: (context, index, number) {
            return const HomepageCard();
          },
          options: CarouselOptions(aspectRatio: 60 / 40),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

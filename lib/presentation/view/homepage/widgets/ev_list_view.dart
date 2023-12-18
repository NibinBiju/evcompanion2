import 'package:evcompanion2/presentation/view/homepage/widgets/homepage_ev_card.dart';
import 'package:flutter/material.dart';

class EvListView extends StatelessWidget {
  const EvListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(
                  3,
                  (index) => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: HomepageCard(),
                      ))),
        ),
      ),
    );
  }
}

import 'package:evcompanion2/presentation/view/feature_page/widgets/page1.dart';
import 'package:evcompanion2/presentation/view/feature_page/widgets/page2.dart';
import 'package:evcompanion2/presentation/view/feature_page/widgets/page3.dart';
import 'package:evcompanion2/login_screen/login_screen.dart';
import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FeaturePage extends StatefulWidget {
  const FeaturePage({super.key});

  @override
  State<FeaturePage> createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {
  final List ofFeatures = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  int selectedIndex = 0;

  final PageController _pageController = PageController();
  bool onlastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  onlastPage = (value == 2);
                });
              },
              controller: _pageController,
              itemCount: ofFeatures.length,
              itemBuilder: (context, index) {
                selectedIndex = index;

                return ofFeatures[index];
              }),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('skip', style: ItemNameStyle))),
                SmoothPageIndicator(
                    controller: _pageController,
                    count: ofFeatures.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: myappbarColor,
                      dotColor: Colors.grey,
                    )),
                InkWell(
                  onTap: () {
                    onlastPage
                        ? Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }))
                        : _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.linear);
                  },
                  child: onlastPage
                      ? Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('Done', style: ItemNameStyle))
                      : Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('Next', style: ItemNameStyle)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

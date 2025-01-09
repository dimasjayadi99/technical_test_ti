import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:talent_insider_test/app/core/consts/path.dart';
import 'package:talent_insider_test/app/core/consts/string.dart';

import '../../../../core/dependency/injection_container.dart';
import '../../../../core/helpers/shared_prefs_helper.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;

  final List<OnBoardingModel> listOnBoardingItem = [
    OnBoardingModel(
        image: PathConst.onBoarding1,
        title: StringConst.firstOnBoardingTitle,
        description: StringConst.firstOnBoardingBody),
    OnBoardingModel(
        image: PathConst.onBoarding2,
        title: StringConst.secOnBoardingTitle,
        description: StringConst.secOnBoardingBody),
    OnBoardingModel(
        image: PathConst.onBoarding3,
        title: StringConst.thirdOnBoardingTitle,
        description: StringConst.thirdOnBoardingBody),
  ];

  CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: listOnBoardingItem.length,
          carouselController: buttonCarouselController,
          itemBuilder: (context, index, realIndex) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 260,
                  height: 300,
                  child: Image.asset(
                    listOnBoardingItem[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 42),
                Text(
                  listOnBoardingItem[index].title,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 24),
                Text(
                  listOnBoardingItem[index].description,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            );
          },
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              }),
        ),
        Positioned(
          bottom: 60,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              listOnBoardingItem.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: currentIndex == index ? 12 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: TextButton(
            onPressed: () {
              setState(() {
                if (currentIndex != 2) {
                  buttonCarouselController.animateToPage(2);
                } else {
                  final prefs = sl<SharedPrefsHelper>();
                  var token = prefs.getToken();
                  if (token == '') {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login', (route) => false);
                  } else {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/main', (route) => false);
                  }
                }
              });
            },
            child: Text(
              currentIndex != 2 ? "Skip" : "Let's Start",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}

class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  OnBoardingModel(
      {required this.image, required this.title, required this.description});
}

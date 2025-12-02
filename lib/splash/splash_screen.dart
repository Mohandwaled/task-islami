import 'package:flutter/material.dart';
import 'package:islami_tassk/splash/splash_model.dart';

import '../dots/dot_indicator.dart';
import '../sebha_tap/sebha.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_text.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/onBoarding";

  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<SplashScreen> {
  final PageController _pageController = PageController();

  int currentIndex = 0;

  List<SplashModel> list = [
    SplashModel(
      title: AppText.title,
      imagePath: AppAssets.splash1,
      SubTitle: null,
    ),
    SplashModel(
      title: AppText.title1,
      imagePath: AppAssets.splash2,
      SubTitle: AppText.subTitle1,
    ),
    SplashModel(
      title: AppText.title2,
      imagePath: AppAssets.splash3,
      SubTitle: AppText.subTitle2,
    ),
    SplashModel(
      title: AppText.title3,
      imagePath: AppAssets.splash4,
      SubTitle: AppText.subTitle3,
    ),
    SplashModel(
      title: AppText.title4,
      imagePath: AppAssets.splash5,
      SubTitle: AppText.subTitle4,
    ),
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black
      ,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo, height: height * 0.175),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          list[index].imagePath,
                          height: height * 0.45,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                        Text(
                          list[index].title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gold,
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                    if (list[index].SubTitle != null) ...[
                    const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              list[index].SubTitle!,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: AppColors.gold,
                              ),
                            ),
                          ],
                        ),
                      ],]
                    );
                  },
                  itemCount: list.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        currentIndex == 0
                            ? SizedBox()
                            : TextButton(
                          onPressed: () {
                              _pageController.animateToPage(
                                currentIndex - 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.gold,
                            ),
                          ),
                        ),
                        currentIndex == 4 ? TextButton(
                          onPressed: () {
                            if (currentIndex == 4) {
                              Navigator.pushReplacementNamed(context, SebhaScreen.routeName);
                            } else {
                              _pageController.animateToPage(
                                currentIndex + 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            }
                          },
                          child: Text(
                            "Finish",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.gold,
                            ),
                          ),
                        ): TextButton(
                          onPressed: () {
                            if (currentIndex == 4) {
                              // Navigator.pushReplacementNamed(context, Home.routeName);
                            } else {
                              _pageController.animateToPage(
                                currentIndex + 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            }
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.gold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DotsIndicator(active: currentIndex == 0),
                        DotsIndicator(active: currentIndex == 1),
                        DotsIndicator(active: currentIndex == 2),
                        DotsIndicator(active: currentIndex == 3),
                        DotsIndicator(active: currentIndex == 4),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

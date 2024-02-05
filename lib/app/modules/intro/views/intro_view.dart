import 'package:appse/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/intro_controller.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';
import 'package:lottie/lottie.dart';

class IntroView extends GetView<IntroController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue, Colors.white],
        ),
      ),
      child: OnBoardingScreen(
        onSkip: () {
          Get.offAllNamed(Routes.LOGIN);
        },
        showPrevNextButton: true,
        showIndicator: true,
        backgourndColor: Colors.transparent,
        activeDotColor: Colors.blue,
        deactiveDotColor: Colors.grey,
        iconColor: Colors.black,
        leftIcon: Icons.arrow_circle_left_rounded,
        rightIcon: Icons.arrow_circle_right_rounded,
        iconSize: 30,
        pages: [
          OnBoardingModel(
            image: Center(
              child: Lottie.asset('assets/lotties/intro1.json'),
            ),
            title: "Lab Entry Attendance",
            body:
                "Be punctual every time! Use this feature to digitally record your attendance in the lab. Attendance tracking made easy and efficient.",
          ),
          OnBoardingModel(
            image: Center(
              child: Lottie.asset('assets/lotties/intro2.json'),
            ),
            title: "Who's there?",
            body:
                "Curious about who's currently in the lab? Access this feature to view a list of individuals utilizing the lab facilities. Stay informed about the people you can connect with!",
          ),
          OnBoardingModel(
            image: Center(
              child: Lottie.asset('assets/lotties/intro3.json'),
            ),
            title: "Access Course Materials",
            body:
                "Explore course materials limitlessly! Gain direct access to learning materials, modules, and essential documents in the laboratory. Study comfortably without the hassle of carrying multiple books!",
          ),
          OnBoardingModel(
            image: Center(
              child: Lottie.asset('assets/lotties/intro4.json'),
            ),
            title: "Training Access",
            body: "Enhance your skills! Utilize this feature to access additional training provided by the laboratory. Improving your competencies is just a tap away.",
          ),
        ],
      ),
    );
  }
}

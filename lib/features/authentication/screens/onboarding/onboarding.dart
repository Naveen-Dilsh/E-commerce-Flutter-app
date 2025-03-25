import 'package:flutter/material.dart';
import 'package:shopping_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shopping_app/features/authentication/screens/onboarding/widgets/onboarding_circular.dart';
import 'package:shopping_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:shopping_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:shopping_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
              // PageView continues...
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation Indicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}

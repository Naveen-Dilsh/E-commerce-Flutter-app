import 'package:flutter/material.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight() * 0.85,
      right: TSizes.defaultSpace,
      child: TextButton(onPressed: () {}, child: const Text('Skip')),
    );
  }
}

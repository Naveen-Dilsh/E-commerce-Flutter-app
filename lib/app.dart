import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/bindings/general.bindings.dart';
import 'package:shopping_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shopping_app/utils/theme/theme.dart';

import 'utils/constants/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      // home: const OnboardingScreen(),
      home: const Scaffold(
          backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/login_signup/form_divider.dart';
import 'package:shopping_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:shopping_app/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              TTexts.signupTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: TSizes.defaultSpace),

            // Form
            const TSignUpForm(),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Divider
            TFormDivider(dividerText: TTexts.orSignupWith.capitalize!),

            const SizedBox(height: TSizes.spaceBtwSections),
            // Social Buttons
            const TSocialButtons(),
          ],
        ),
      )),
    );
  }
}

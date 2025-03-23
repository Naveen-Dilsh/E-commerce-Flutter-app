import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shopping_app/features/authentication/screens/password_configuration/reset_password.dart';

import '../../../../utils/constants/sizes.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text("Forgot Password?", style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text("Forgot Password Subtitle", style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spaceBtwItems * 2),

            /// Text Field
            TextFormField(
              decoration: const InputDecoration(labelText: "Email", prefixIcon: Icon(Iconsax.direct_right)),
            ), // TextFormField
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()), child: const Text("Submit")),
            ), // SizedBox
          ],
        ), // Column
      ), // Padding
    ); // Scaffold
  }
}

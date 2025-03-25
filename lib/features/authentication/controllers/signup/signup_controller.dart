import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shopping_app/data/repositories/user/user_repository.dart';
import 'package:shopping_app/features/authentication/screens/signup/verify_email.dart';
import 'package:shopping_app/utils/constants/image_strings.dart';
import 'package:shopping_app/utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; //hide password variable
  final privacyPolicy = true.obs; //privacy policy variable
  final email = TextEditingController(); //controller for email input
  final lastName = TextEditingController(); //controller for last name input
  final firstName = TextEditingController(); //controller for first name input
  final username = TextEditingController(); //controller for username input
  final password = TextEditingController(); //controller for password input
  final phoneNumber = TextEditingController(); //controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); //form key for form validation

  ///-- SIGNUP FORM CONTROLLER --///
  void signup() async {
    try {
      // start Loading
      // TFullScreenLoader.openLoadingDialog('We are processing Your information...', TImages.docerAnimation);

      // check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        //Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'Please accept the privacy policy to continue',
        );
        return;
      }

      // Register user in the firebase Authentication & Save user data in Firebase
      final UserCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: UserCredential.user!.uid,
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Account created successfully');

      // Move to verify Email screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      //Remove Loader
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }
}

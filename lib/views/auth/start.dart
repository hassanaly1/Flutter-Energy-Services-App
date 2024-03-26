import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/views/auth/login.dart';
import 'package:energy_services/views/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/background_image.png', fit: BoxFit.cover),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: context.height * 0.1,
                horizontal: context.height * 0.05),
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: context.height * 0.05,
                  horizontal: context.width * 0.01),
              height: context.height,
              width: context.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/background_shadow.png'),
                    fit: BoxFit.cover,
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/app-logo.png',
                      fit: BoxFit.cover,
                      height: 120,
                      width: 150,
                    ),
                    SizedBox(height: context.height * 0.1),
                    CustomButton(
                      buttonText: 'Login',
                      onTap: () => Get.offAll(() => const LoginScreen()),
                    ),
                    CustomButton(
                        buttonText: 'Register',
                        onTap: () => Get.offAll(() => const SignupScreen()),
                        usePrimaryColor: true),
                    SizedBox(height: context.height * 0.1),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

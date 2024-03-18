import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/views/auth/login.dart';
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
              child: Column(
                children: [
                  Image.asset('assets/images/app-logo-black.png',
                      fit: BoxFit.cover),
                  CustomTextWidget(
                    text: 'Welcome To Energy Services',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    textColor: AppColors.blueTextColor,
                  ),
                  CustomTextWidget(
                    text:
                        'streamline task management for mechanics Your ultimate companion for organizing tasks and managing checklists with ease.',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textColor: AppColors.blueTextColor,
                    fontStyle: FontStyle.italic,
                    maxLines: 4,
                  ),
                  SizedBox(height: context.height * 0.1),
                  CustomButton(
                    buttonText: 'Login',
                    onTap: () => Get.to(() => const LoginScreen()),
                  ),
                  CustomButton(
                      buttonText: 'Register',
                      onTap: () {},
                      usePrimaryColor: true),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

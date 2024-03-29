import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_textfield.dart';
import 'package:energy_services/views/auth/forget_password.dart';
import 'package:energy_services/views/auth/signup.dart';
import 'package:energy_services/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/toast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/auth-background.png', fit: BoxFit.cover),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: context.height * 0.05,
                        bottom: context.height * 0.05),
                    child: Image.asset('assets/images/app-logo.png',
                        height: context.height * 0.12, fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: context.height * 0.02,
                      horizontal: context.width * 0.04),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          spreadRadius: 5.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ]),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          'assets/images/gear.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomTextWidget(
                              text: 'Login to your Account',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomTextWidget(
                              text: 'Please enter your Email Password.',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center,
                              fontStyle: FontStyle.italic,
                              maxLines: 4,
                            ),
                            Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(height: context.height * 0.03),
                                  ReUsableTextField(
                                      hintText: 'Email',
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: AppColors.primaryColor,
                                      )

                                      // validator: (val) =>
                                      //     AppValidator.validateEmail(value: val),
                                      ),
                                  ReUsableTextField(
                                      hintText: 'Password',
                                      prefixIcon: Icon(
                                        Icons.lock_open_rounded,
                                        color: AppColors.primaryColor,
                                      )
                                      // validator: (val) =>
                                      //     AppValidator.validatePassword(value: val),
                                      ),
                                  InkWell(
                                    onTap: () => Get.to(
                                      () => const ForgetPasswordScreen(),
                                      transition: Transition.size,
                                      duration: const Duration(seconds: 1),
                                    ),
                                    child: CustomTextWidget(
                                      text: 'Forget Password?',
                                      fontSize: 12.0,
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: context.height * 0.03),
                            CustomButton(
                              buttonText: 'Login',
                              onTap: () {
                                Get.offAll(
                                  () => const HomeScreen(),
                                  transition: Transition.size,
                                  duration: const Duration(milliseconds: 700),
                                );
                                ToastMessage.showToastMessage(
                                    message: 'Login Successfully',
                                    backgroundColor: AppColors.blueTextColor);
                              },
                            ),
                            SizedBox(height: context.height * 0.02),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => const SignupScreen(),
                                    transition: Transition.size,
                                    duration: const Duration(seconds: 1),
                                  );
                                },
                                child: Text.rich(
                                  TextSpan(
                                    text: 'If you don’t have any account? ',
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.0),
                                    children: [
                                      TextSpan(
                                        text: 'Signup',
                                        style: TextStyle(
                                            color: AppColors.blueTextColor,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

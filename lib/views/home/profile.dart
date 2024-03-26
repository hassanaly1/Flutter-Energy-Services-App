import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(),
              CustomTextWidget(
                text: 'James Anderson',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              CustomTextWidget(
                text: 'Lead of all mechanics Lead of all mechanics',
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.height * 0.05,
                    horizontal: context.width * 0.1),
                child: Column(
                  children: [
                    ReUsableTextField(hintText: 'jamesanderson@gmail.com'),
                    ReUsableTextField(hintText: '0123456789'),
                    ReUsableTextField(hintText: '*********'),
                    CustomButton(
                      buttonText: 'Update',
                      onTap: () {},
                      usePrimaryColor: true,
                      textColor: Colors.black87,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.25,
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
            height: Get.height * 0.18,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/home-bg.png'),
                fit: BoxFit.cover,
              ),
              color: AppColors.blueTextColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                      CustomTextWidget(
                        text: 'Profile',
                        textColor: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: context.height * 0.15,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/user2.jpg"))),
            ),
          ),
        ],
      ),
    );
  }
}

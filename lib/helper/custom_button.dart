import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? borderColor;
  final double width;
  final double? height;
  final bool usePrimaryColor;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.width = double.infinity,
    this.textColor,
    this.borderColor,
    this.height,
    this.usePrimaryColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: ReUsableContainer(
          verticalPadding: context.height * 0.02,
          height: height ?? 50,
          color: usePrimaryColor
              ? AppColors.primaryColor
              : AppColors.secondaryColor,
          child: Center(
              child: CustomTextWidget(
            text: buttonText,
            fontSize: 16,
            textColor: usePrimaryColor ? Colors.black87 : Colors.white,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          )),
        ));
  }
}

import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_text.dart';
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
    return InkWell(
      onTap: onTap,
      child: Container(
          height: height ?? 50,
          width: width,
          margin: EdgeInsets.symmetric(
              horizontal: context.width * 0.15,
              vertical: context.height * 0.02),
          decoration: BoxDecoration(
            color: usePrimaryColor
                ? AppColors.primaryColor
                : AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Center(
              child: CustomTextWidget(
            text: buttonText,
            fontSize: 16,
            textColor: textColor ?? Colors.white,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ))),
    );
  }
}

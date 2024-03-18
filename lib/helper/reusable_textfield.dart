import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:flutter/material.dart';

class ReUsableTextField extends StatelessWidget {
  final String hintText;
  int? maxLines;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  TextEditingController? controller;
  bool obscureText;
  final String? Function(String?)? validator;
  final bool showBackgroundShadow;
  ReUsableTextField(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLines = 1,
      this.keyboardType,
      this.controller,
      this.obscureText = false,
      this.showBackgroundShadow = true,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      showBackgroundShadow: showBackgroundShadow,
      child: TextFormField(
        // textAlignVertical: TextAlignVertical.bottom,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        obscureText: obscureText,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: AppColors.textColor,
        ),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(vertical: 4.0),
          // isCollapsed: true,
          isDense: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,

          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: AppColors.lightTextColor,
          ),
          errorStyle: const TextStyle(
            fontSize: 8.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            color: Colors.redAccent,
          ),
          // errorBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(16.0),
          //     borderSide: const BorderSide(
          //       color: Colors.redAccent,
          //     )),
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(16.0),
          //     borderSide: const BorderSide(
          //       color: Colors.transparent,
          //     )),
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(16.0),
          //     borderSide: const BorderSide(
          //       color: Colors.black54,
          //     )),
        ),
      ),
    );
  }
}

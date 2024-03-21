import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_textfield.dart';
import 'package:flutter/cupertino.dart';

class HeadingAndTextfield extends StatelessWidget {
  final String title;
  final bool? readOnly;

  int? maxLines;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  TextEditingController? controller;
  final String? Function(String?)? validator;
  HeadingAndTextfield(
      {super.key,
      required this.title,
      this.readOnly,
      this.validator,
      this.controller,
      this.maxLines,
      this.suffixIcon,
      this.prefixIcon,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: title,
            fontWeight: FontWeight.w600,
          ),
          ReUsableTextField(
            controller: controller,
            readOnly: readOnly,
            hintText: title,
            maxLines: maxLines,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            keyboardType: keyboardType,
            validator: validator,
          )
        ],
      ),
    );
  }
}

class HeadingAndTextfieldInRow extends StatelessWidget {
  final String title;
  final String hintText;
  final bool? readOnly;
  int? maxLines;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  TextEditingController? controller;
  final String? Function(String?)? validator;
  HeadingAndTextfieldInRow(
      {super.key,
      required this.title,
      required this.hintText,
      this.readOnly,
      this.validator,
      this.controller,
      this.maxLines,
      this.suffixIcon,
      this.prefixIcon,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: Row(
        children: [
          CustomTextWidget(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          const SizedBox(width: 10.0),
          Flexible(
            child: ReUsableTextField(
              controller: controller,
              readOnly: readOnly,
              hintText: hintText,
              maxLines: maxLines,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              keyboardType: keyboardType,
              validator: validator,
            ),
          )
        ],
      ),
    );
  }
}

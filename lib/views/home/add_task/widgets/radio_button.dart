import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRadioButton extends StatelessWidget {
  final String heading;
  final List<String> options;
  final RxString selectedOption;

  const CustomRadioButton({super.key, 
    required this.options,
    required this.selectedOption,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: heading,
          fontWeight: FontWeight.w600,
          maxLines: 2,
        ),
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: options.map((option) {
              return Row(
                children: [
                  Radio(
                    visualDensity: VisualDensity.compact,
                    activeColor: AppColors.blueTextColor,
                    value: option,
                    groupValue: selectedOption.value,
                    onChanged: (value) {
                      selectedOption.value = value.toString();
                    },
                  ),
                  CustomTextWidget(text: option, fontSize: 11.0),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckboxWidget extends StatelessWidget {
  final String question;
  final List<String> options;
  final RxList<String> selectedValues;
  final AddTaskController controller = Get.find();

  CustomCheckboxWidget(
      {super.key,
      required this.options,
      required this.selectedValues,
      required this.question});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(
      init: controller,
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: question,
              fontWeight: FontWeight.w600,
            ),
            Column(
              children: options
                  .map((option) => CheckboxListTile(
                        title: CustomTextWidget(text: option),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: selectedValues.contains(option),
                        onChanged: (value) {
                          controller.toggleCheckbox(option, selectedValues);
                        },
                      ))
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}

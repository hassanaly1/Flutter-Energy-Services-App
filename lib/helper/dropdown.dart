import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/models/engine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final List<EngineModel> items;
  final void Function(EngineModel?)? onChanged;
  final VoidCallback? onTap;
  const CustomDropdown({
    super.key,
    required this.items,
    this.onChanged,
    required this.hintText,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      child: DropdownButtonFormField(
        hint: Text(hintText),
        dropdownColor: Colors.white,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: AppColors.lightTextColor,
        ),
        padding: EdgeInsets.zero,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          constraints: BoxConstraints(maxHeight: context.height * 0.08),
        ),
        borderRadius: BorderRadius.circular(12.0),
        items: items
            .map((options) => DropdownMenuItem(
                value: options,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: options.name ?? '',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                      textColor: AppColors.textColor,
                    ),
                    CustomTextWidget(
                      text: '  (${options.type})',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                      textColor: AppColors.textColor,
                    ),
                  ],
                )))
            .toList(),
        onChanged: onChanged,
        // onChanged: (value) {
        //   if (!controller.selectedTeams.contains(value)) {
        //     controller.selectedTeams.addNonNull(value!);
        //   } else {
        //     ToastMessage.showToastMessage(
        //         message: '${value?.name} is already selected.',
        //         backgroundColor: Colors.red);
        //   }
        //   print(controller.selectedTeams.length);
        // },
      ),
    );
  }
}

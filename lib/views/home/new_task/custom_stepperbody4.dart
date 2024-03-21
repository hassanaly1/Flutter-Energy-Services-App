import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/views/home/new_task/widgets/heading&textfield.dart';
import 'package:energy_services/views/home/new_task/widgets/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStepperBody4 extends StatelessWidget {
  CustomStepperBody4({
    super.key,
  });

  final AddTaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        children: [
          HeadingAndTextfield(
              title: 'Select Location',
              readOnly: true,
              prefixIcon: Icon(Icons.location_on_outlined,
                  color: AppColors.blueTextColor)),
          Row(
            children: [
              Flexible(
                child: HeadingAndTextfield(
                    title: 'Set Unit', keyboardType: TextInputType.number),
              ),
              Flexible(
                child: HeadingAndTextfield(
                    title: 'Unit Hours', keyboardType: TextInputType.number),
              )
            ],
          ),
          Row(
            children: [
              Flexible(
                  child:
                      HeadingAndTextfield(title: 'Set Date', readOnly: true)),
              Flexible(
                  child: HeadingAndTextfield(title: 'Set Time', readOnly: true))
            ],
          ),
          HeadingAndTextfield(title: 'Name of JOURNEYMAN'),
          CustomRadioButton(
            heading: 'Unit Online on Arrival?',
            options: const ['yes', 'no'],
            selectedOption: controller.unitOnlineOnArrival,
          ),
          HeadingAndTextfield(title: 'Job Scope', maxLines: 5),
          HeadingAndTextfield(
              title: 'Report Any Operations Problems', maxLines: 5),
          HeadingAndTextfield(title: 'Engine Brand'),
          Row(children: [
            Flexible(
                child: HeadingAndTextfield(
                    title: 'Model Number', keyboardType: TextInputType.number)),
            Flexible(
                child: HeadingAndTextfield(
                    title: 'Serial Number', keyboardType: TextInputType.number))
          ]),
          HeadingAndTextfield(title: 'Arrangement Number'),
          CustomRadioButton(
            heading: 'Oil Sample (s) Taken?',
            options: const ['yes', 'no'],
            selectedOption: controller.oilSamplesTaken,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                    buttonText: 'BACK',
                    usePrimaryColor: true,
                    onTap: () {
                      controller.previousPage();
                    }),
              ),
              Expanded(
                child: CustomButton(
                    buttonText: 'Next',
                    onTap: () {
                      controller.nextPage();
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}

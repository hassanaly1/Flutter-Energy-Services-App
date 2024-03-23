import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/views/home/new_task/widgets/heading&textfield.dart';
import 'package:energy_services/views/home/new_task/widgets/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStepperBody1 extends StatelessWidget {
  CustomStepperBody1({
    super.key,
  });

  final AddTaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: ListView(
        children: [
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                HeadingAndTextfield(
                    title: 'Select Location',
                    controller: controller.selectedLocation,
                    readOnly: true,
                    prefixIcon: Icon(Icons.location_on_outlined,
                        color: AppColors.blueTextColor)),
                Row(
                  children: [
                    Flexible(
                      child: HeadingAndTextfield(
                          title: 'Set Unit',
                          controller: controller.setUnits,
                          keyboardType: TextInputType.number),
                    ),
                    Flexible(
                      child: HeadingAndTextfield(
                          title: 'Unit Hours',
                          controller: controller.unitHours,
                          keyboardType: TextInputType.number),
                    )
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                        child: HeadingAndTextfield(
                            title: 'Set Date',
                            // controller: controller.selectDate,
                            readOnly: true)),
                    Flexible(
                        child: HeadingAndTextfield(
                            title: 'Set Time',
                            // controller: controller.selectTime,
                            readOnly: true))
                  ],
                ),
                HeadingAndTextfield(
                  title: 'Name of JOURNEYMAN',
                  controller: controller.nameOfJourneyMan,
                ),
                CustomRadioButton(
                  heading: 'Unit Online on Arrival?',
                  options: const ['yes', 'no'],
                  selectedOption: controller.unitOnlineOnArrival,
                ),
                HeadingAndTextfield(
                  title: 'Job Scope',
                  maxLines: 5,
                  controller: controller.jobScope,
                ),
                HeadingAndTextfield(
                  title: 'Report Any Operations Problems',
                  maxLines: 5,
                  controller: controller.operationalProblems,
                ),
                HeadingAndTextfield(title: 'Engine Brand'),
                Row(children: [
                  Flexible(
                      child: HeadingAndTextfield(
                          title: 'Model Number',
                          controller: controller.modelNumber,
                          keyboardType: TextInputType.number)),
                  Flexible(
                      child: HeadingAndTextfield(
                          title: 'Serial Number',
                          controller: controller.serialNumber,
                          keyboardType: TextInputType.number))
                ]),
                HeadingAndTextfield(
                    title: 'Arrangement Number',
                    controller: controller.arrangementNumber,
                    keyboardType: TextInputType.number),
                CustomRadioButton(
                  heading: 'Oil Sample (s) Taken?',
                  options: const ['yes', 'no'],
                  selectedOption: controller.oilSamplesTaken,
                ),
              ],
            ),
          ),
          CustomButton(
              buttonText: 'Next',
              onTap: () {
                controller.nextPage();
              })
        ],
      ),
    );
  }
}

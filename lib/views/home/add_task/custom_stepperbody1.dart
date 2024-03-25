import 'package:energy_services/controllers/googlemap_controller.dart';
import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/views/home/add_task/select_location.dart';
import 'package:energy_services/views/home/add_task/widgets/heading&textfield.dart';
import 'package:energy_services/views/home/add_task/widgets/radio_button.dart';
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
                Obx(
                  () => HeadingAndTextfield(
                      title: 'Select Location',
                      onTap: () => Get.to(() => GoogleMapScreen()),
                      hintText: controller.selectedAddress?.value == ""
                          ? 'Select Location'
                          : controller.selectedAddress?.value,
                      // controller: controller.selectedLocation,
                      readOnly: true,
                      prefixIcon: Icon(Icons.location_on_outlined,
                          color: AppColors.blueTextColor)),
                ),
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
                Obx(
                  () => Row(
                    children: [
                      Flexible(
                        child: HeadingAndTextfield(
                          title: 'Select Date',
                          hintText:
                              '${controller.taskSelectedDate.value.day.toString().padLeft(2, '0')} : ${controller.taskSelectedDate.value.month.toString().padLeft(2, '0')} : ${controller.taskSelectedDate.value.year.toString().padLeft(2, '0')}',
                          onTap: () => controller.selectDate(context),
                          readOnly: true,
                          // onChanged: (value) {
                          //   controller.selectDate(context);
                          // },
                        ),
                      ),
                      Flexible(
                        child: HeadingAndTextfield(
                          title: 'Select Time',
                          hintText:
                              '${controller.taskSelectedTime.value.format(context)..padLeft(2, '0')} ',
                          onTap: () => controller.selectTime(context),
                          readOnly: true,
                          // onChanged: (value) {
                          //   controller.selectTime(context);
                          // },
                        ),
                      )
                    ],
                  ),
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

import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/controllers/universal_controller.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/dropdown.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/helper/toast.dart';
import 'package:energy_services/views/home/add_task/select_location.dart';
import 'package:energy_services/views/home/add_task/widgets/heading&textfield.dart';
import 'package:energy_services/views/home/add_task/widgets/radio_button.dart';
import 'package:energy_services/views/home/engines/engines.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStepperBody1 extends StatelessWidget {
  CustomStepperBody1({
    super.key,
  });

  final UniversalController universalController = Get.find();
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
                    // hintText: controller.selectedAddress?.value == ""
                    //     ? 'Select Location'
                    //     : controller.selectedAddress?.value,
                    controller: controller.selectedAddress,
                    suffixIcon: InkWell(
                      onTap: () => Get.to(() => SelectLocationScreen()),
                      child: Icon(Icons.location_on_outlined,
                          color: AppColors.blueTextColor),
                    )),
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
                // Obx(
                //   () => HeadingAndTextfield(
                //     title: 'Engine Brand',
                //     hintText: controller.engineBrand.value == ''
                //         ? 'Select Engine Brand'
                //         : controller.engineBrand.value,
                //     readOnly: true,
                //     onTap: () {
                //       universalController.engines.isEmpty
                //           ? ToastMessage.showToastMessage(
                //               message:
                //                   'Please Add Engines first from the Engine section.',
                //               backgroundColor: Colors.red)
                //           : _openSelectEngineDialog(
                //               context: context,
                //               controller: universalController,
                //               taskController: controller,
                //             );
                //     },
                //   ),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Engine Brand',
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                    ),
                    CustomDropdown(
                      items: universalController.engines,
                      hintText: 'Select Engine Brand',
                      onTap: () {
                        debugPrint('Dropdown tapped');
                        universalController.engines.isEmpty
                            ? ToastMessage.showToastMessage(
                                message:
                                    'Please Add Engines first from the Engine section.',
                                backgroundColor: Colors.red)
                            : null;
                      },
                      onChanged: (value) {
                        controller.engineBrand.value = value!.name!;
                      },
                    ),
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

_openSelectEngineDialog(
    {required BuildContext context,
    required UniversalController controller,
    required AddTaskController taskController}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => Container(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: AlertDialog(
            scrollable: true,
            backgroundColor: Colors.transparent,
            content: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: context.height * 0.02),
              decoration: const BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Column(
                children: [
                  CustomTextWidget(
                      text: 'Engines',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.engines.length,
                    itemBuilder: (context, index) {
                      final engine = controller.engines[index];
                      return CustomEngineCard(
                        model: engine,
                        onTap: () {
                          taskController.engineBrand.value = engine.name ?? '';
                          Get.back();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

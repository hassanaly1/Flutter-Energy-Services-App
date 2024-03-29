import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/helper/reusable_textfield.dart';
import 'package:energy_services/helper/toast.dart';
import 'package:energy_services/helper/validator.dart';
import 'package:energy_services/models/single_part_model.dart';
import 'package:energy_services/views/home/add_task/custom_stepperbody2.dart';
import 'package:energy_services/views/home/add_task/widgets/heading&textfield.dart';
import 'package:energy_services/views/home/add_task/widgets/radio_button.dart';
import 'package:energy_services/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomStepperBody4 extends StatelessWidget {
  CustomStepperBody4({
    super.key,
  });
  final AddTaskController controller = Get.find();
  final _partsFormkey = GlobalKey<FormState>();

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
              color: AppColors.blueTextColor,
              borderRadius: 8.0,
              child: CustomTextWidget(
                text: 'START UP',
                textColor: Colors.white,
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
          //   Oil Pressure and Level Check
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Oil Pressure and Level Check'),
                CustomRadioButton(
                  heading: 'Oil pressure engine & good?',
                  options: const [
                    'yes',
                    'no',
                  ],
                  selectedOption: controller.oilPressureEngineAndGood,
                ),
                CustomRadioButton(
                  heading: 'Engine oil level:',
                  options: const ['low', 'good', 'high'],
                  selectedOption: controller.engineOilLevel,
                ),
              ],
            ),
          ),
          //   Coolant System Check
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Coolant System Check'),
                CustomRadioButton(
                  heading: 'Jacket water coolant level:',
                  options: const ['low', 'good', 'high'],
                  selectedOption: controller.jacketWaterCoolantLevel,
                ),
                CustomRadioButton(
                  heading: 'Auxiliary coolant level:',
                  options: const ['low', 'good', 'high'],
                  selectedOption: controller.auxiliaryCoolantLevel2,
                ),
              ],
            ),
          ),
          //   Temperature and Pressure Check
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Temperature and Pressure Check'),
                CustomRadioButton(
                  heading: 'All temps and pressures stable & normal ranges?',
                  options: const ['yes', 'no'],
                  selectedOption:
                      controller.allTempsAndPressuresStableAndNormalRanges,
                ),
              ],
            ),
          ),
          //   Noise and Vibration Check
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Noise and Vibration Check'),
                CustomRadioButton(
                  heading: 'Noises or vibrations detected?',
                  options: const ['yes', 'no'],
                  selectedOption: controller.noisesOrVibrationsDetected,
                ),
              ],
            ),
          ),
          //   Exhaust Gas and Manifold Pressure
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Exhaust Gas and Manifold Pressure'),
                CustomRadioButton(
                  heading: 'Engine exhaust gas checked & adjusted at max load?',
                  options: const ['yes', 'no'],
                  selectedOption:
                      controller.engineExhaustGasCheckedAndAdjustedAtMaxLoad,
                ),
                HeadingAndTextfield(
                  title:
                      'Document final set point exhaust gas oxygen or CO levels:',
                  controller: controller
                      .documentFinalSetPointExhaustGasOxygenOrCOLevels,
                ),
                HeadingAndTextfield(
                  title: 'Document final manifold pressure and RPM:',
                  controller: controller.documentFinalManifoldPressureAndRPM,
                )
              ],
            ),
          ),
          ReUsableContainer(
              color: AppColors.blueTextColor,
              borderRadius: 8.0,
              child: CustomTextWidget(
                text: 'FUTURE REPAIRS',
                textColor: Colors.white,
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
          //   Engine Deficiencies for Future Repairs
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Engine Deficiencies for Future Repairs'),
                CustomRadioButton(
                  options: const ['yes', 'no'],
                  selectedOption: controller.engineDeficienciesRadio,
                  heading: 'Engine deficiencies to be repaired in the future?',
                ),
                Obx(
                  () => Visibility(
                    visible: controller.engineDeficienciesRadio.value == 'yes',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(text: 'If yes then describe'),
                        ReUsableTextField(
                          maxLines: 3,
                          hintText:
                              'Describe Engine deficiencies to be repaired in the future?',
                          showBackgroundShadow:
                              controller.engineDeficienciesRadio.value == 'yes',
                          readOnly:
                              controller.engineDeficienciesRadio.value == 'no',
                          controller: controller.engineDeficienciesTextfield,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //   Parts Ordering Status
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Parts Ordering Status'),
                CustomRadioButton(
                  heading: 'Parts for above repairs ordered?',
                  options: const ['yes', 'no'],
                  selectedOption: controller.partsOrderingStatus,
                ),
              ],
            ),
          ),
          //Future Parts
          ReUsableContainer(
              color: AppColors.blueTextColor,
              borderRadius: 8.0,
              child: CustomTextWidget(
                text: 'PARTS ORDER LIST FOR NEXT VISIT',
                textColor: Colors.white,
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
          //   Add Parts in Table

          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Form(
              key: _partsFormkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContainerHeading(heading: 'Add Parts'),
                  HeadingAndTextfield(
                    title: 'Name:',
                    controller: controller.partName,
                    validator: (value) => AppValidator.validateEmptyText(
                        fieldName: 'Name', value: value),
                  ),
                  HeadingAndTextfield(
                    title: 'Description:',
                    controller: controller.partDescription,
                    validator: (value) => AppValidator.validateEmptyText(
                        fieldName: 'Description', value: value),
                  ),
                  HeadingAndTextfield(
                    title: 'Quantity:',
                    controller: controller.partQuantity,
                    keyboardType: TextInputType.number,
                    validator: (value) => AppValidator.validateEmptyText(
                        fieldName: 'Quantity', value: value),
                  ),
                  HeadingAndTextfield(
                    title: 'Vendor:',
                    controller: controller.partVendor,
                    validator: (value) => AppValidator.validateEmptyText(
                        fieldName: 'Vendor', value: value),
                  ),
                  CustomButton(
                    buttonText: 'Add',
                    onTap: () {
                      if (_partsFormkey.currentState!.validate()) {
                        controller.partsList.add(
                          SinglePartModel(
                            controller.partName.text.trim(),
                            controller.partDescription.text.trim(),
                            controller.partQuantity.text.trim(),
                            controller.partVendor.text.trim(),
                          ),
                        );
                        controller.partName.clear();
                        controller.partDescription.clear();
                        controller.partQuantity.clear();
                        controller.partVendor.clear();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Obx(
            () => ReUsableContainer(
                borderRadius: 8.0,
                child: controller.partsList.isEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.1),
                        child: CustomTextWidget(
                            text: 'No Parts Added',
                            textAlign: TextAlign.center),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.partsList.length,
                        itemBuilder: (context, index) => SinglePartDetail(
                          model: controller.partsList[index],
                          index: index,
                        ),
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      )),
          ),
          //   List of Parts
          Row(
            children: [
              Expanded(
                child: CustomButton(
                    buttonText: 'BACK',
                    usePrimaryColor: true,
                    onTap: () => controller.previousPage()),
              ),
              Expanded(
                child: CustomButton(
                    buttonText: 'SUBMIT',
                    onTap: () {
                      controller.addTask();
                      Get.offAll(() => const HomeScreen());
                      ToastMessage.showToastMessage(
                          message: 'Task Created Successfully',
                          backgroundColor: AppColors.blueTextColor);
                      // Get.delete<AddTaskController>();
                      // Get.toNamed('/home');
                      // Get.offAllNamed('/home');
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SinglePartDetail extends StatelessWidget {
  final SinglePartModel model;
  final int index;
  SinglePartDetail({super.key, required this.model, required this.index});

  final AddTaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      showBackgroundShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  textColor: Colors.transparent,
                  text: (index + 1).toString(),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
                CustomTextWidget(
                  text: (index + 1).toString(),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
                IconButton(
                    onPressed: () {
                      controller.partsList.removeAt(index);
                    },
                    icon: const Icon(FontAwesomeIcons.xmark, color: Colors.red))
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          CustomTextWidget(
            text: 'Part Name:  ',
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          CustomTextWidget(text: model.partName),
          const SizedBox(height: 8.0),
          CustomTextWidget(
            text: 'Part Description:  ',
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          CustomTextWidget(text: model.partDescription),
          const SizedBox(height: 8.0),
          CustomTextWidget(
            text: 'Part Quantity:  ',
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          CustomTextWidget(text: model.partQuantity.toString()),
          const SizedBox(height: 8.0),
          CustomTextWidget(
            text: 'Part Vendor:  ',
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          CustomTextWidget(text: model.partVendor),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

import 'package:energy_services/controllers/task_controllers.dart';
import 'package:energy_services/helper/appcolors.dart';
import 'package:energy_services/helper/custom_button.dart';
import 'package:energy_services/helper/custom_text.dart';
import 'package:energy_services/helper/reusable_container.dart';
import 'package:energy_services/helper/reusable_textfield.dart';
import 'package:energy_services/helper/toast.dart';
import 'package:energy_services/views/home/add_task/widgets/checkbox.dart';
import 'package:energy_services/views/home/add_task/widgets/heading&textfield.dart';
import 'package:energy_services/views/home/add_task/widgets/radio_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStepperBody2 extends StatelessWidget {
  CustomStepperBody2({
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
              color: AppColors.blueTextColor,
              borderRadius: 8.0,
              child: CustomTextWidget(
                text: 'ENGINE RUNNING CHECKS',
                textAlign: TextAlign.center,
                textColor: Colors.white,
              )),
          //Engine Load Factor
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Engine Load Factor'),
                Row(
                  children: [
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'Engine Load',
                      controller: controller.engineLoad,
                      keyboardType: TextInputType.number,
                    )),
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'Engine RPM',
                      controller: controller.engineRPM,
                      keyboardType: TextInputType.number,
                    ))
                  ],
                ),
                HeadingAndTextfield(
                  title: 'Ignition Timing, BTDC',
                  controller: controller.ignitionTiming,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          //Exhaust Gas Sample
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Exhaust Gas Sample'),
                CustomCheckboxWidget(
                  question: 'Exhaust Gas Sample (As Found)',
                  options: const ['Oxygen', 'CO', 'NOx'],
                  selectedValues: controller.exhaustGasSampleFound,
                ),
                Row(
                  children: [
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'LB (Left Bank)',
                      controller: controller.leftBankFound,
                      keyboardType: TextInputType.number,
                    )),
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'RB(Right Bank)',
                      controller: controller.rightBankFound,
                      keyboardType: TextInputType.number,
                    ))
                  ],
                ),
                CustomCheckboxWidget(
                  question: 'Exhaust Gas Sample (As ADJUSTED )',
                  options: const ['Oxygen', 'CO', 'NOx'],
                  selectedValues: controller.exhaustGasSampleAdjusted,
                ),
                Row(
                  children: [
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'LB (Left Bank)',
                      controller: controller.leftBankAdjusted,
                      keyboardType: TextInputType.number,
                    )),
                    Flexible(
                        child: HeadingAndTextfield(
                      title: 'RB(Right Bank)',
                      controller: controller.rightBankAdjusted,
                      keyboardType: TextInputType.number,
                    ))
                  ],
                ),
              ],
            ),
          ),
          //Fuel Quality
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Fuel Quality in Use'),
                HeadingAndTextfield(
                  title: 'BTU Value',
                  controller: controller.btuValue,
                  keyboardType: TextInputType.number,
                ),
                CustomRadioButton(
                    options: const ['C', 'F'],
                    selectedOption: controller.selectedBtuValue,
                    heading: 'BTU Value')
              ],
            ),
          ),
          //Cylinder Exhaust Pyrometer
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Cylinder Exhaust Pyrometer Temperature Readings'),
                Obx(
                  () => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        controller.pyrometerTemperatureControllers.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 0.0,
                            childAspectRatio: 1.7),
                    itemBuilder: (BuildContext context, int index) {
                      return NumberWithTextField(
                          number: (index + 1).toString(),
                          controller: controller
                              .pyrometerTemperatureControllers[index]);
                    },
                  ),
                ),
                CustomButton(
                  buttonText: 'Add',
                  onTap: () {
                    if (controller.pyrometerTemperatureControllers.length <
                        16) {
                      controller.pyrometerTemperatureControllers
                          .add(TextEditingController());
                    } else {
                      ToastMessage.showToastMessage(
                          message:
                              'You can add up to only 16 Pyrometer Temperatures.',
                          backgroundColor: AppColors.blueTextColor);
                    }
                  },
                )
              ],
            ),
          ),
          //Turbo Temperatures
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Turbo Temperatures'),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          CustomRadioButton(
                              options: const ['C', 'F'],
                              selectedOption: controller.lbTurboIn,
                              heading: 'LB TURBO IN'),
                          ReUsableTextField(
                            hintText: 'Temperature',
                            controller: controller.lbTurboInTemp,
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          CustomRadioButton(
                              options: const ['C', 'F'],
                              selectedOption: controller.rbTurboIn,
                              heading: 'RB TURBO IN'),
                          ReUsableTextField(
                            hintText: 'Temperature',
                            controller: controller.rbTurboInTemp,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.black54),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          CustomRadioButton(
                              options: const ['C', 'F'],
                              selectedOption: controller.lbTurboOut,
                              heading: 'LB TURBO OUT'),
                          ReUsableTextField(
                            hintText: 'Temperature',
                            controller: controller.lbTurboOutTemp,
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          CustomRadioButton(
                              options: const ['C', 'F'],
                              selectedOption: controller.rbTurboOut,
                              heading: 'RB TURBO OUT'),
                          ReUsableTextField(
                            hintText: 'Temperature',
                            controller: controller.rbTurboOutTemp,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //MissFireDetected
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(heading: 'Misfires Detected'),
                CustomRadioButton(
                    options: const ['yes', 'no'],
                    selectedOption: controller.missFireDetected,
                    heading: 'Misfires Detected?')
              ],
            ),
          ),
          //BurnTimes
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Burn Times'),
                Obx(
                  () => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.burnTemperatureControllers.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 0.0,
                            childAspectRatio: 1.7),
                    itemBuilder: (BuildContext context, int index) {
                      return NumberWithTextField(
                          number: (index + 1).toString(),
                          controller:
                              controller.burnTemperatureControllers[index]);
                    },
                  ),
                ),
                CustomButton(
                  buttonText: 'Add',
                  onTap: () {
                    if (controller.burnTemperatureControllers.length < 16) {
                      controller.burnTemperatureControllers
                          .add(TextEditingController());
                    } else {
                      ToastMessage.showToastMessage(
                          message:
                              'You can add up to only 16 Burn Times Temperatures.',
                          backgroundColor: AppColors.blueTextColor);
                    }
                  },
                )
              ],
            ),
          ),
          //Throttle  & Fuel Value Position
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const ContainerHeading(
                    heading: 'Throttle & Fuel Valve Position'),
                HeadingAndTextfield(
                  title: 'Throttle Actuator Position',
                  controller: controller.throttleActuatorPosition,
                  keyboardType: TextInputType.number,
                ),
                HeadingAndTextfield(
                  title: 'Fuel Value',
                  controller: controller.fuelValue,
                  keyboardType: TextInputType.number,
                )
              ],
            ),
          ),
          //Engine Oil
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Engine Oil'),
                HeadingAndTextfield(
                  title: 'Engine Oil Pressure (PSI)',
                  controller: controller.engineOilPressure,
                  keyboardType: TextInputType.number,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Oil Pressure Differential Across Oil Filter',
                      fontWeight: FontWeight.w600,
                    ),
                    Obx(
                      () => Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: ReUsableTextField(
                                hintText: 'Value',
                                keyboardType: TextInputType.number,
                                controller:
                                    controller.oilPressureDifferentialTextField,
                                onChanged: (value) {
                                  controller.oilPressureDifferential.value =
                                      value;
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: AppColors.blueTextColor,
                                  value: 'NA',
                                  groupValue:
                                      controller.oilPressureDifferential.value,
                                  onChanged: (value) {
                                    if (value == 'NA') {
                                      controller.oilPressureDifferential.value =
                                          value!;
                                      controller
                                          .oilPressureDifferentialTextField
                                          .clear();
                                    }
                                  },
                                ),
                                CustomTextWidget(text: 'NA', fontSize: 14.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                InOutWidget(
                  heading: 'Oil temperature',
                  inController: controller.oilTemperatureIn,
                  outController: controller.oilTemperatureOut,
                ),
                CustomRadioButton(
                    options: const [
                      'LOW',
                      'GOOD',
                      'HIGH',
                    ],
                    selectedOption: controller.oilLevelEngine,
                    heading: 'Oil Level Engine')
              ],
            ),
          ),
          //Engine Coolent
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Engine Coolant'),
                TextfieldWithRadioButtons(
                  heading: 'Engine Coolant Pressure',
                  keyboardType: TextInputType.number,
                  val1: 'PSI',
                  val2: 'KPA',
                  textController: controller.engineCoolantPressure,
                  radioController: controller.engineCoolantPressureRadioValue,
                ),
                CustomRadioButton(
                    options: const [
                      'LOW',
                      'GOOD',
                      'HIGH',
                    ],
                    selectedOption: controller.jacketWaterLevel,
                    heading: 'Jacket Water Level')
              ],
            ),
          ),
          //Auxiliary Coolant
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Auxiliary Coolant'),
                CustomRadioButton(
                    options: const [
                      'LOW',
                      'GOOD',
                      'HIGH',
                    ],
                    selectedOption: controller.auxiliaryCoolantlevel1,
                    heading: 'Auxiliary Coolant level')
              ],
            ),
          ),
          //JacketWaterTemperatures
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Jacket Water Temperatures'),
                InOutWidget(
                  heading: 'Jacketwater Temperatures In & Out (C/F)',
                  inController: controller.jacketWaterTemperaturesIn,
                  outController: controller.jacketWaterTemperaturesOut,
                ),
                InOutWidget(
                  heading: 'Aux. Coolant Temperatures In & Out (C/F)',
                  inController: controller.auxCoolantTemperaturesIn,
                  outController: controller.auxCoolantTemperaturesOut,
                ),
              ],
            ),
          ),
          //Air Intakes
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Air Intake'),
                TextfieldWithRadioButtons(
                  heading: 'Inlet Air Temp',
                  keyboardType: TextInputType.number,
                  val1: 'C',
                  val2: 'F',
                  textController: controller.inletAirTemp,
                  radioController: controller.inletAirTempRadio,
                ),
                TextfieldWithRadioButtons(
                  heading: 'Inlet Air Pressure',
                  keyboardType: TextInputType.number,
                  val1: 'PSI',
                  val2: 'KPA',
                  textController: controller.inletAirPressure,
                  radioController: controller.inletAirPressureRadio,
                ),
                HeadingAndTextfield(
                  title: 'Primary Fuel Pressure (PSI)',
                  controller: controller.primaryFuelPressure,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          //Air/Fuel Ratio & Crankcase Pressure
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Air/Fuel Ratio & Crankcase Pressure'),
                HeadingAndTextfield(
                  title: 'Actual Air to Fuel Ratio (%)',
                  keyboardType: TextInputType.number,
                  controller: controller.actualAirToFuelRatio,
                ),
                HeadingAndTextfield(
                  title: 'Crankcase Pressure / Vacuum',
                  controller: controller.crankcasePressure,
                  keyboardType: TextInputType.number,
                ),
                TextfieldWithRadioButtons(
                  heading: 'Airfilter Restriction',
                  keyboardType: TextInputType.number,
                  val1: 'RB',
                  val2: 'LB',
                  textController: controller.airFilterRestriction,
                  radioController: controller.airFilterRestrictionRadio,
                ),
                CustomRadioButton(
                    options: const ['LOW', 'GOOD', 'HIGH', 'NA'],
                    selectedOption: controller.hydraulicOil,
                    heading: 'Hydraulic Oil')
              ],
            ),
          ),
          //Leaks Found
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Leaks Found'),
                CustomRadioButton(
                    options: const ['yes', 'no'],
                    selectedOption: controller.leaksFound,
                    heading: 'Any Leaks Found?'),
                Obx(
                  () => Visibility(
                      visible: controller.leaksFound.value == "yes",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(text: 'If yes then describe'),
                          CheckboxWithTextfield(
                            heading: 'Oil',
                            isSelected: controller.isOilSelected,
                            controller: controller.oilDescription,
                          ),
                          CheckboxWithTextfield(
                            heading: 'Coolant',
                            isSelected: controller.isCoolantSelected,
                            controller: controller.coolantDescription,
                          ),
                          CheckboxWithTextfield(
                            heading: 'Gass',
                            isSelected: controller.isGasSelected,
                            controller: controller.gasDescription,
                          ),
                          CheckboxWithTextfield(
                            heading: 'Exhaust',
                            isSelected: controller.isExhaustSelected,
                            controller: controller.exhaustDescription,
                          ),
                          CheckboxWithTextfield(
                            heading: 'Air',
                            isSelected: controller.isAirSelected,
                            controller: controller.airDescription,
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
          //Excessive vibration & odd noises
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(
                    heading: 'Excessive vibration & odd noises'),
                CustomRadioButton(
                  options: const ['yes', 'no'],
                  selectedOption: controller.excessiveVibrationAndOddNoises,
                  heading: 'Excessive vibration & odd noises?',
                ),
                Obx(
                  () => Visibility(
                    visible: controller.excessiveVibrationAndOddNoises.value ==
                        "yes",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(text: 'If yes then describe'),
                        ReUsableTextField(
                          maxLines: 3,
                          hintText: 'Describe Excessive Vibration & Odd Noises',
                          showBackgroundShadow:
                              controller.excessiveVibrationAndOddNoises.value ==
                                  'yes',
                          readOnly:
                              controller.excessiveVibrationAndOddNoises.value ==
                                  'no',
                          controller: controller
                              .excessiveVibrationAndOddNoisesDescription,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Problems with Driver
          ReUsableContainer(
            showBackgroundShadow: false,
            color: Colors.grey.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerHeading(heading: 'Problems with Driver'),
                CustomRadioButton(
                  options: const ['yes', 'no'],
                  selectedOption: controller.problemsWithDriver,
                  heading: 'Problem found with Driver during running checks?',
                ),
                Obx(
                  () => Visibility(
                    visible: controller.problemsWithDriver.value == 'yes',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(text: 'If yes then describe'),
                        ReUsableTextField(
                          maxLines: 3,
                          hintText:
                              'Describe Problem found with Driver during running checks',
                          showBackgroundShadow:
                              controller.problemsWithDriver.value == 'yes',
                          readOnly: controller.problemsWithDriver.value == 'no',
                          controller: controller.problemsWithDriverDescription,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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

class NumberWithTextField extends StatelessWidget {
  final String number;
  final TextEditingController? controller;
  const NumberWithTextField({super.key, required this.number, this.controller});

  @override
  Widget build(BuildContext context) {
    return HeadingAndTextfieldInRow(
      title: number,
      hintText: 'Temperature',
      controller: controller,
      keyboardType: TextInputType.number,
    );
  }
}

class CheckboxWithTextfield extends StatelessWidget {
  final String heading;
  final TextEditingController? controller;
  final RxBool isSelected;
  const CheckboxWithTextfield(
      {super.key,
      required this.heading,
      this.controller,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          SizedBox(
            width: 100,
            child: Column(
              children: [
                CustomTextWidget(text: heading),
                Checkbox(
                  value: isSelected.value,
                  onChanged: (value) {
                    isSelected.value = value!;
                  },
                ),
              ],
            ),
          ),
          Flexible(
              child: ReUsableTextField(
            hintText: 'Description',
            maxLines: 2,
            controller: controller,
            showBackgroundShadow: isSelected.value ? true : false,
            readOnly: isSelected.value ? false : true,
          ))
        ],
      ),
    );
  }
}

class TextfieldWithRadioButtons extends StatelessWidget {
  final String heading;
  final String val1;
  final String val2;
  final TextEditingController? textController;
  final RxString? radioController;
  final TextInputType? keyboardType;
  const TextfieldWithRadioButtons({
    super.key,
    required this.heading,
    this.textController,
    this.radioController,
    required this.val1,
    required this.val2,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: heading,
          fontWeight: FontWeight.w600,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ReUsableTextField(
                hintText: 'Value',
                controller: textController,
                keyboardType: keyboardType,
              ),
            ),
            Flexible(
              child: CustomRadioButton(
                  options: [val1],
                  selectedOption: radioController!,
                  heading: ''),
            ),
            Flexible(
              child: CustomRadioButton(
                  options: [val2],
                  selectedOption: radioController!,
                  heading: ''),
            ),
          ],
        ),
      ],
    );
  }
}

class InOutWidget extends StatelessWidget {
  final String heading;
  final TextEditingController? inController;
  final TextEditingController? outController;
  const InOutWidget(
      {super.key,
      required this.heading,
      this.inController,
      this.outController});

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
        Row(
          children: [
            Flexible(
              child: HeadingAndTextfieldInRow(
                title: 'In',
                hintText: 'Value',
                controller: inController,
                keyboardType: TextInputType.number,
              ),
            ),
            Flexible(
              child: HeadingAndTextfieldInRow(
                title: 'Out',
                hintText: 'Value',
                controller: outController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ContainerHeading extends StatelessWidget {
  final String heading;
  const ContainerHeading({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: CustomTextWidget(
        text: heading,
        maxLines: 2,
        textAlign: TextAlign.center,
      )),
    );
  }
}
